{ *************************************************************************** }
{ }
{ iORM - (interfaced ORM) }
{ }
{ Copyright (C) 2015-2016 Maurizio Del Magno }
{ }
{ mauriziodm@levantesw.it }
{ mauriziodelmagno@gmail.com }
{ https://github.com/mauriziodm/iORM.git }
{ }
{ }
{ *************************************************************************** }
{ }
{ This file is part of iORM (Interfaced Object Relational Mapper). }
{ }
{ Licensed under the GNU Lesser General Public License, Version 3; }
{ you may not use this file except in compliance with the License. }
{ }
{ iORM is free software: you can redistribute it and/or modify }
{ it under the terms of the GNU Lesser General Public License as published }
{ by the Free Software Foundation, either version 3 of the License, or }
{ (at your option) any later version. }
{ }
{ iORM is distributed in the hope that it will be useful, }
{ but WITHOUT ANY WARRANTY; without even the implied warranty of }
{ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the }
{ GNU Lesser General Public License for more details. }
{ }
{ You should have received a copy of the GNU Lesser General Public License }
{ along with iORM.  If not, see <http://www.gnu.org/licenses/>. }
{ }
{ *************************************************************************** }

unit iORM.LiveBindings.CommonBSAPaging;

interface

uses
  iORM.LiveBindings.Interfaces, System.Classes;

const
  PAGING_TYPE_DEFAULT = ptDisabled;
  CURRENT_PAGE_DEFAULT = 1;
  NEXT_PAGE_START_OFFSET = 0;
  PAGE_SIZE_DEFAULT = 100;

type

  // LoadPage anonymous method type
  TioBSAPagingLoadMethod = reference to procedure;

 {$TYPEINFO ON}
  TioCommonBSAPageManager = class(TPersistent)
  strict private
    FCurrentPage: Integer;
    FLoadPageMethod: TioBSAPagingLoadMethod;
    FNextPageStartOffset: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FStrategy: IioBSAPageManagerStrategy;
  strict protected
    procedure _InternalSetCurrentPage(const Value: Integer);
    procedure CheckStrategy;
    procedure SetCurrentPage(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    procedure Reset;
  public
    constructor Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function IsEnabled: Boolean;
    function IsProgressive: Boolean;
    procedure NextPage;
    procedure PrevPage;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
  published
    property NextPageStartOffset: Integer read FNextPageStartOffset write FNextPageStartOffset default NEXT_PAGE_START_OFFSET;
    property PageSize: Integer read FPageSize write FPageSize default PAGE_SIZE_DEFAULT;
    property PagingType: TioBSAPagingType read FPagingType write SetPagingType default PAGING_TYPE_DEFAULT;
  end;

  // Base class for all SQL limit strategy classes
  TioCommonBSAPageManagerStrategy = class abstract(TInterfacedObject, IioBSAPageManagerStrategy)
  strict private
    FSqlLimit: Integer;
    FSqlLimitOffset: Integer;
  strict protected
    procedure SetSqlLimit(const AValue: Integer);
    procedure SetSqlLimitOffset(const AValue: Integer);
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); virtual; abstract;
    function IsProgressive: Boolean; virtual; abstract;
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
  end;

  TioCommonBSAPageManagerStrategy_HardPaging = class(TioCommonBSAPageManagerStrategy)
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
    function IsProgressive: Boolean; override;
  end;

  // NB: Un eventuale altro LimitStrategy progressivo ma con avanzamento pagina automatico
  // calcolerà la soglia che innescherà il caricamento della pagina successiva (ex NextPageAutoThreshold)
  // ponendolo clla metà della PageSize
  TioCommonBSAPageManagerStrategy_ProgressiveManual = class(TioCommonBSAPageManagerStrategy)
  strict private
    FHigherSqlLimitOffset: Integer;
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
    function IsProgressive: Boolean; override;
  end;

implementation

uses
  System.Math, iORM.LiveBindings.Factory, iORM.Exceptions;

{ TioCommonBSAPaging }

procedure TioCommonBSAPageManager.CheckStrategy;
begin
  if not Assigned(FStrategy) then
    EioException.Create(Self.ClassName, 'CheckStrategy', 'Paging is not active.')
end;

constructor TioCommonBSAPageManager.Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
begin
  FPagingType := PAGING_TYPE_DEFAULT;
  FPageSize := PAGE_SIZE_DEFAULT;
  FNextPageStartOffset := NEXT_PAGE_START_OFFSET;
  FLoadPageMethod := ALoadPageMethod;
  Reset;
end;

function TioCommonBSAPageManager.IsEnabled: Boolean;
begin
  Result := FPagingType > ptDisabled;
end;

function TioCommonBSAPageManager.IsProgressive: Boolean;
begin
  Result := Assigned(FStrategy) and FStrategy.IsProgressive;
end;

function TioCommonBSAPageManager.GetSqlLimit: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimit;
end;

function TioCommonBSAPageManager.GetSqlLimitOffset: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimitOffset;
end;

procedure TioCommonBSAPageManager.NextPage;
begin
  SetCurrentPage(FCurrentPage + 1);
end;

procedure TioCommonBSAPageManager.PrevPage;
begin
  SetCurrentPage(FCurrentPage - 1);
end;

procedure TioCommonBSAPageManager._InternalSetCurrentPage(const Value: Integer);
begin
  FCurrentPage := Value;
  if IsEnabled then
    FStrategy.CalcSqlLimit(Value, FPageSize, FNextPageStartOffset);
end;

procedure TioCommonBSAPageManager.SetCurrentPage(const Value: Integer);
begin
  if (Value = FCurrentPage) or (Value < 1) or not IsEnabled then
    Exit;                 
  _InternalSetCurrentPage(Value);
  FLoadPageMethod; // Invoke the LoadPage anonymous method
end;

procedure TioCommonBSAPageManager.Reset;
begin
  _InternalSetCurrentPage(CURRENT_PAGE_DEFAULT);
end;

procedure TioCommonBSAPageManager.SetPagingType(const Value: TioBSAPagingType);
begin
  if Value = FPagingType then
    Exit;
  FStrategy := TioLiveBindingsFactory.GetBSAPageManagerStrategy(Value);
  FPagingType := Value;
  Reset;
end;

{ TioSqlLimitStrategy_Base }

function TioCommonBSAPageManagerStrategy.GetSqlLimitOffset: Integer;
begin
  Result := FSqlLimitOffset;
end;

function TioCommonBSAPageManagerStrategy.GetSqlLimit: Integer;
begin
  Result := FSqlLimit;
end;

procedure TioCommonBSAPageManagerStrategy.SetSqlLimit(const AValue: Integer);
begin
  FSqlLimit := Max(AValue, 0);
end;

procedure TioCommonBSAPageManagerStrategy.SetSqlLimitOffset(const AValue: Integer);
begin
  FSqlLimitOffset := Max(AValue, 0);
end;

{ TioSqlLimitStrategy_HardPaging }

procedure TioCommonBSAPageManagerStrategy_HardPaging.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer);
begin
  SetSqlLimit(APageSize + ANextPageStartOffset);
  SetSqlLimitOffset((APageSize * (ADestPage - 1)) - ANextPageStartOffset);
end;

function TioCommonBSAPageManagerStrategy_HardPaging.IsProgressive: Boolean;
begin
  Result := False;
end;

{ TioSqlLimitStrategy_ProgressiveManual }

procedure TioCommonBSAPageManagerStrategy_ProgressiveManual.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer);
begin
  SetSqlLimit((APageSize * ADestPage) - FHigherSqlLimitOffset);
  SetSqlLimitOffset(FHigherSqlLimitOffset);
  FHigherSqlLimitOffset := GetSqlLimitOffset + GetSqlLimit;
end;

function TioCommonBSAPageManagerStrategy_ProgressiveManual.IsProgressive: Boolean;
begin
  Result := True;
end;

end.
