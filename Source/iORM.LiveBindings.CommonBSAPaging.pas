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
  System.Classes, System.SysUtils;

const
  CURRENT_PAGE_DEFAULT = 1;
  NEXT_PAGE_START_OFFSET = 0;
  PAGE_SIZE_DEFAULT = 100;

type

  TioCommonBSAPageManagerConcrete = class;

  // Paging type
  TioBSAPagingType = (ptDisabled, ptHardPaging, ptProgressiveManual, ptProgressiveAuto);

  // LoadPage anonymous method type
  TioBSAPagingLoadMethod = reference to procedure;

  // Paging: SQL limit strategy
  IioBSAPageManagerStrategy = interface
    ['{65896A9F-5B1A-407B-AB2E-C486D7B19ABF}']
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function IsProgressive: Boolean;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean;
    procedure PrepareForRefresh;
  end;

{$TYPEINFO ON}

  TioCommonBSAPageManager = class(TPersistent)
  strict private
    FConcretePageManager: TioCommonBSAPageManagerConcrete;
    procedure _Lock;
    procedure _Unlock;
  strict protected
    function GetCurrentPage: Integer;
    function GetEnabled: Boolean;
    function GetFirstPage: Boolean;
    function GetLastPage: Boolean;
    function GetNextPageStartOffset: Integer;
    function GetPageCount: Integer;
    function GetPageSize: Integer;
    function GetPagingType: TioBSAPagingType;
    procedure SetCurrentPage(const Value: Integer);
    procedure SetNextPageStartOffset(const Value: Integer);
    procedure SetPageSize(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
  public
    constructor Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
    destructor Destroy; override;
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function IsProgressive: Boolean;
    procedure NotifyItemIndexChanged(const ANewItemIndex: Integer);
    procedure NextPage;
    procedure PrevPage;
    procedure PrepareForRefresh;
    procedure SetItemCount(const AItemCount: Integer);
    property CurrentPage: Integer read GetCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
    property Enabled: Boolean read GetEnabled;
    property FirstPage: Boolean read GetFirstPage;
    property LastPage: Boolean read GetFirstPage;
    property PageCount: Integer read GetPageCount;
  published
    property NextPageStartOffset: Integer read GetNextPageStartOffset write SetNextPageStartOffset default NEXT_PAGE_START_OFFSET;
    property PageSize: Integer read GetPageSize write SetPageSize default PAGE_SIZE_DEFAULT;
    property PagingType: TioBSAPagingType read GetPagingType write SetPagingType default ptDisabled;
  end;

  TioCommonBSAPageManagerConcrete = class
  strict private
    FCurrentPage: Integer;
    FLoadPageMethod: TioBSAPagingLoadMethod;
    FNextPageStartOffset: Integer;
    FPageCount: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FStrategy: IioBSAPageManagerStrategy;
  strict protected
    function GetEnabled: Boolean;
    function GetFirstPage: Boolean;
    function GetLastPage: Boolean;
    procedure CheckStrategy;
    procedure InvokeLoadPageMethod;
    procedure SetCurrentPage(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    procedure Reset;
  public
    constructor Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function IsProgressive: Boolean;
    procedure NotifyItemIndexChanged(const ANewItemIndex: Integer);
    procedure NextPage;
    procedure PrevPage;
    procedure PrepareForRefresh;
    procedure SetItemCount(const AItemCount: Integer);
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
    property Enabled: Boolean read GetEnabled;
    property FirstPage: Boolean read GetFirstPage;
    property LastPage: Boolean read GetFirstPage;
    property NextPageStartOffset: Integer read FNextPageStartOffset write FNextPageStartOffset;
    property PageCount: Integer read FPageCount;
    property PageSize: Integer read FPageSize write FPageSize;
    property PagingType: TioBSAPagingType read FPagingType write SetPagingType;
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
    function IsProgressive: Boolean; virtual; abstract;
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; virtual; abstract;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; virtual; abstract;
    procedure PrepareForRefresh; virtual; abstract;
  end;

  TioCommonBSAPageManagerStrategy_HardPaging = class(TioCommonBSAPageManagerStrategy)
  public
    function IsProgressive: Boolean; override;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; override;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
    procedure PrepareForRefresh; override;
  end;

  TioCommonBSAPageManagerStrategy_ProgressiveManual = class(TioCommonBSAPageManagerStrategy)
  public
    function IsProgressive: Boolean; override;
    function MoveToPage(const AFromPage, AToPage, APageSize, ANextPageStartOffset: Integer): Boolean; override;
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
    procedure PrepareForRefresh; override;
  end;

  TioCommonBSAPageManagerStrategy_ProgressiveAuto = class(TioCommonBSAPageManagerStrategy_ProgressiveManual)
  public
    function NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage, APageSize: Integer): Boolean; override;
  end;

implementation

uses
  System.Math, iORM.LiveBindings.Factory, iORM.Exceptions;

{ TioCommonBSAPageManager }

constructor TioCommonBSAPageManager.Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
begin
  FConcretePageManager := TioCommonBSAPageManagerConcrete.Create(ALoadPageMethod);
end;

function TioCommonBSAPageManager.GetEnabled: Boolean;
begin
  _Lock;
  try
    Result := FConcretePageManager.Enabled;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetFirstPage: Boolean;
begin
  _Lock;
  try
    Result := FConcretePageManager.FirstPage;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetLastPage: Boolean;
begin
  _Lock;
  try
    Result := FConcretePageManager.LastPage;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager._Lock;
begin
  TMonitor.Enter(Self);
end;

function TioCommonBSAPageManager.IsProgressive: Boolean;
begin
  _Lock;
  try
    Result := FConcretePageManager.IsProgressive;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetSqlLimit: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.GetSqlLimit;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetSqlLimitOffset: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.GetSqlLimitOffset;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.NextPage;
begin
  _Lock;
  try
    FConcretePageManager.NextPage;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.NotifyItemIndexChanged(const ANewItemIndex: Integer);
begin
  _Lock;
  try
    FConcretePageManager.NotifyItemIndexChanged(ANewItemIndex);
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.PrepareForRefresh;
begin
  _Lock;
  try
    FConcretePageManager.PrepareForRefresh;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.PrevPage;
begin
  _Lock;
  try
    FConcretePageManager.PrevPage;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetPageCount: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.PageCount;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetPageSize: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.PageSize;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetPagingType: TioBSAPagingType;
begin
  _Lock;
  try
    Result := FConcretePageManager.PagingType;
  finally
    _Unlock;
  end;
end;

destructor TioCommonBSAPageManager.Destroy;
begin
  _Lock;
  try
    FConcretePageManager.Free;
  finally
    _Unlock;
  end;
  inherited;
end;

function TioCommonBSAPageManager.GetCurrentPage: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.CurrentPage;
  finally
    _Unlock;
  end;
end;

function TioCommonBSAPageManager.GetNextPageStartOffset: Integer;
begin
  _Lock;
  try
    Result := FConcretePageManager.NextPageStartOffset;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.SetCurrentPage(const Value: Integer);
begin
  _Lock;
  try
    FConcretePageManager.CurrentPage := Value;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.SetItemCount(const AItemCount: Integer);
begin
  _Lock;
  try
    FConcretePageManager.SetItemCount(AItemCount);
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.SetNextPageStartOffset(const Value: Integer);
begin
  _Lock;
  try
    FConcretePageManager.NextPageStartOffset := Value;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.SetPageSize(const Value: Integer);
begin
  _Lock;
  try
    FConcretePageManager.PageSize := Value;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager.SetPagingType(const Value: TioBSAPagingType);
begin
  _Lock;
  try
    FConcretePageManager.PagingType := Value;
  finally
    _Unlock;
  end;
end;

procedure TioCommonBSAPageManager._Unlock;
begin
  TMonitor.Exit(Self);
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

procedure TioCommonBSAPageManagerStrategy_HardPaging.PrepareForRefresh;
begin
  // Nothing to do
end;

function TioCommonBSAPageManagerStrategy_HardPaging.IsProgressive: Boolean;
begin
  Result := False;
end;

function TioCommonBSAPageManagerStrategy_HardPaging.MoveToPage(const AFromPage, AToPage, APageSize,
  ANextPageStartOffset: Integer): Boolean;
begin
  SetSqlLimit(APageSize + ANextPageStartOffset);
  SetSqlLimitOffset((APageSize * (AToPage - 1)) - ANextPageStartOffset);
  Result := True;
end;

{ TioSqlLimitStrategy_ProgressiveManual }

function TioCommonBSAPageManagerStrategy_ProgressiveManual.NextPageAfterItemIndexChanged(const ANewItemIndex, ACurrentPage,
  APageSize: Integer): Boolean;
begin
  Result := False;
end;

procedure TioCommonBSAPageManagerStrategy_ProgressiveManual.PrepareForRefresh;
begin
  SetSqlLimit(GetSqlLimit + GetSqlLimitOffset);
  SetSqlLimitOffset(0);
end;

function TioCommonBSAPageManagerStrategy_ProgressiveManual.IsProgressive: Boolean;
begin
  Result := True;
end;

function TioCommonBSAPageManagerStrategy_ProgressiveManual.MoveToPage(const AFromPage, AToPage, APageSize,
  ANextPageStartOffset: Integer): Boolean;
begin
  if (AToPage > AFromPage) then
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

{ TioCommonBSAPageManagerConcrete }

procedure TioCommonBSAPageManagerConcrete.CheckStrategy;
begin
  if not Assigned(FStrategy) then
    raise EioException.Create(Self.ClassName, 'CheckStrategy', 'Paging is not active.')
end;

constructor TioCommonBSAPageManagerConcrete.Create(const ALoadPageMethod: TioBSAPagingLoadMethod);
begin
  FPagingType := ptDisabled;
  FPageSize := PAGE_SIZE_DEFAULT;
  FNextPageStartOffset := NEXT_PAGE_START_OFFSET;
  FLoadPageMethod := ALoadPageMethod;
  Reset;
end;

function TioCommonBSAPageManagerConcrete.GetSqlLimit: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimit;
end;

function TioCommonBSAPageManagerConcrete.GetSqlLimitOffset: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimitOffset;
end;

procedure TioCommonBSAPageManagerConcrete.InvokeLoadPageMethod;
begin
  if Assigned(FLoadPageMethod) then
    FLoadPageMethod;
end;

function TioCommonBSAPageManagerConcrete.GetEnabled: Boolean;
begin
  Result := FPagingType > ptDisabled;
end;

function TioCommonBSAPageManagerConcrete.GetFirstPage: Boolean;
begin
  Result := FCurrentPage = 1;
end;

function TioCommonBSAPageManagerConcrete.GetLastPage: Boolean;
begin
  Result := FCurrentPage = FPageCount;
end;

procedure TioCommonBSAPageManagerConcrete.NextPage;
begin
  SetCurrentPage(FCurrentPage + 1);
end;

procedure TioCommonBSAPageManagerConcrete.NotifyItemIndexChanged(const ANewItemIndex: Integer);
begin
  if Enabled and FStrategy.NextPageAfterItemIndexChanged(ANewItemIndex, FCurrentPage, FPageSize) then
    NextPage;
end;

procedure TioCommonBSAPageManagerConcrete.PrepareForRefresh;
begin
  if Enabled then
    FStrategy.PrepareForRefresh;
end;

procedure TioCommonBSAPageManagerConcrete.PrevPage;
begin
  SetCurrentPage(FCurrentPage - 1);
end;

function TioCommonBSAPageManagerConcrete.IsProgressive: Boolean;
begin
  Result := Assigned(FStrategy) and FStrategy.IsProgressive;
end;

procedure TioCommonBSAPageManagerConcrete.Reset;
begin
  FCurrentPage := CURRENT_PAGE_DEFAULT;
  if Enabled then
    FStrategy.MoveToPage(0, CURRENT_PAGE_DEFAULT, FPageSize, FNextPageStartOffset);
end;

procedure TioCommonBSAPageManagerConcrete.SetCurrentPage(const Value: Integer);
begin
  if Enabled and (Value <> FCurrentPage) and (Value > 0) and (Value <= FPageCount) and
    FStrategy.MoveToPage(FCurrentPage, Value, FPageSize, FNextPageStartOffset) then
  begin
    FCurrentPage := Value;
    InvokeLoadPageMethod;
  end;
end;

procedure TioCommonBSAPageManagerConcrete.SetItemCount(const AItemCount: Integer);
begin
  FPageCount := (AItemCount div FPageSize);
end;

procedure TioCommonBSAPageManagerConcrete.SetPagingType(const Value: TioBSAPagingType);
begin
  if Value = FPagingType then
    Exit;
  FStrategy := TioLiveBindingsFactory.GetBSAPageManagerStrategy(Value);
  FPagingType := Value;
  Reset;
end;

end.

