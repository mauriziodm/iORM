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

{ TODO : Il page manager DEVE ESSERE THREADSAFE, potrei fare un wrapper esterno che regola l'accesso all'oggetto reale interno? }
  TioCommonBSAPageManager = class(TPersistent)
  strict private
    FCurrentPage: Integer;
    FLoadPageMethod: TioBSAPagingLoadMethod;
    FNextPageStartOffset: Integer;
    FPageCount: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FStrategy: IioBSAPageManagerStrategy;
  strict protected
    procedure CheckStrategy;
    procedure InvokeLoadPageMethod;
    procedure SetCurrentPage(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    procedure Reset;
  public
    constructor Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function IsEnabled: Boolean;
    function RefreshWithReload: Boolean;
    procedure NotifyItemIndexChanged(const ANewItemIndex: Integer);
    procedure NextPage;
    procedure PrevPage;
    procedure SetItemCount(const AItemCount: Integer);
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
    property PageCount: Integer read FPageCount;
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
    function RefreshWithReload: Boolean; virtual; abstract;
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; virtual; abstract;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; virtual; abstract;
  end;

  TioCommonBSAPageManagerStrategy_HardPaging = class(TioCommonBSAPageManagerStrategy)
  public
    function RefreshWithReload: Boolean; override;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; override;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
  end;

  TioCommonBSAPageManagerStrategy_ProgressiveManual = class(TioCommonBSAPageManagerStrategy)
  public
    function RefreshWithReload: Boolean; override;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; override;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
  end;

  TioCommonBSAPageManagerStrategy_ProgressiveAuto = class(TioCommonBSAPageManagerStrategy_ProgressiveManual)
  public
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
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

procedure TioCommonBSAPageManager.InvokeLoadPageMethod;
begin
  if Assigned(FLoadPageMethod) then
    FLoadPageMethod;
end;

function TioCommonBSAPageManager.IsEnabled: Boolean;
begin
  Result := FPagingType > ptDisabled;
end;

function TioCommonBSAPageManager.RefreshWithReload: Boolean;
begin
  Result := Assigned(FStrategy) and FStrategy.RefreshWithReload;
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

procedure TioCommonBSAPageManager.NotifyItemIndexChanged(const ANewItemIndex: Integer);
begin
  if IsEnabled and FStrategy.NextPageAfterItemIndexChanged(ANewItemIndex, FCurrentPage, FPageSize) then
    NextPage;
end;

procedure TioCommonBSAPageManager.PrevPage;
begin
  SetCurrentPage(FCurrentPage - 1);
end;

procedure TioCommonBSAPageManager.SetCurrentPage(const Value: Integer);
begin
  if IsEnabled and FStrategy.MoveToPage(FCurrentPage, Value, FPageSize, FNextPageStartOffset) then
  begin
    FCurrentPage := Value;
    InvokeLoadPageMethod;
  end;
end;

procedure TioCommonBSAPageManager.SetItemCount(const AItemCount: Integer);
begin
  FPageCount := (AItemCount div FPageSize) + 1;
end;

procedure TioCommonBSAPageManager.Reset;
begin
  FCurrentPage := CURRENT_PAGE_DEFAULT;
  if IsEnabled then
    FStrategy.MoveToPage(0, CURRENT_PAGE_DEFAULT, FPageSize, FNextPageStartOffset);
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

function TioCommonBSAPageManagerStrategy_HardPaging.NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage,
  APageSize: Integer): Boolean;
begin
  Result := False;
end;

function TioCommonBSAPageManagerStrategy_HardPaging.RefreshWithReload: Boolean;
begin
  Result := False;
end;

function TioCommonBSAPageManagerStrategy_HardPaging.MoveToPage(const AFromPage, AToPage, APageSize,
  ANextPageStartOffset: Integer): Boolean;
begin
  if (AToPage <> AFromPage) and (AToPage > 0) then
  begin
    SetSqlLimit(APageSize + ANextPageStartOffset);
    SetSqlLimitOffset((APageSize * (AToPage - 1)) - ANextPageStartOffset);
    Result := True;
  end
  else
    Result := False;
end;

{ TioSqlLimitStrategy_ProgressiveManual }

function TioCommonBSAPageManagerStrategy_ProgressiveManual.NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage,
  APageSize: Integer): Boolean;
begin
  Result := False;
end;

function TioCommonBSAPageManagerStrategy_ProgressiveManual.RefreshWithReload: Boolean;
begin
  Result := True;
end;

function TioCommonBSAPageManagerStrategy_ProgressiveManual.MoveToPage(const AFromPage, AToPage, APageSize,
  ANextPageStartOffset: Integer): Boolean;
begin
  if (AToPage > AFromPage) and (AToPage > 0) then
  begin
    SetSqlLimitOffset(APageSize * AFromPage);
    SetSqlLimit(APageSize * AToPage - GetSqlLimitOffset);
    Result := True;
  end
  else
    Result := False;
end;

{ TioCommonBSAPageManagerStrategy_ProgressiveAuto }

function TioCommonBSAPageManagerStrategy_ProgressiveAuto.NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage,
  APageSize: Integer): Boolean;
begin
  Result := ANewItemIndex >= (ACurrentPage * APageSize) - (APageSize div 2);
end;

end.
