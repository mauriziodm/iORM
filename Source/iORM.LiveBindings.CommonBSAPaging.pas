unit iORM.LiveBindings.CommonBSAPaging;

interface

uses
  iORM.LiveBindings.Interfaces;

const
  PAGING_TYPE_DEFAULT = ptDisabled;
  CURRENT_PAGE_DEFAULT = 1;
  NEXT_PAGE_START_OFFSET = 0;
  PAGE_SIZE_DEFAULT = 100;

type

{$TYPEINFO ON}
  TioCommonBSAPaging = class(TInterfacedObject, IioCommonBSAPaging)
  strict private[Weak]
    FActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    FCurrentPage: Integer;
    FNextPageStartOffset: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FStrategy: IioSqlLimitStrategy;
  strict protected
    procedure SetCurrentPage(const Value: Integer);
    procedure SetNextPageStartOffset(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    procedure SetPageSize(const Value: Integer);
    function GetCurrentPage: Integer;
    function GetNextPageStartOffset: Integer;
    function GetPagingType: TioBSAPagingType;
    function GetPageSize: Integer;
    function GetSqlLimit: Integer; // Lascio o tolgo?
    function GetSqlLimitOffset: Integer; // Lascio o tolgo?
    procedure CheckStrategy;
    procedure Reset;
  public
    procedure NextPage;
    procedure PrevPage;
    property CurrentPage: Integer read GetCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
  published
//    constructor Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    constructor Create;
    property NextPageStartOffset: Integer read GetNextPageStartOffset write SetNextPageStartOffset default NEXT_PAGE_START_OFFSET;
    property PageSize: Integer read GetPageSize write SetPageSize default PAGE_SIZE_DEFAULT;
    property PagingType: TioBSAPagingType read GetPagingType write SetPagingType default PAGING_TYPE_DEFAULT;
  end;

  // Base class for all SQL limit strategy classes
  TioSqlLimitStrategy_Base = class abstract(TInterfacedObject, IioSqlLimitStrategy)
  strict private
    FSqlLimit: Integer;
    FSqlLimitOffset: Integer;
  strict protected
    procedure SetSqlLimit(const AValue: Integer);
    procedure SetSqlLimitOffset(const AValue: Integer);
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); virtual; abstract;
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
  end;

  TioSqlLimitStrategy_HardPaging = class(TioSqlLimitStrategy_Base)
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
  end;

  // NB: Un eventuale altro LimitStrategy progressivo ma con avanzamento pagina automatico
  // calcolerà la soglia che innescherà il caricamento della pagina successiva (ex NextPageAutoThreshold)
  // ponendolo clla metà della PageSize
  TioSqlLimitStrategy_ProgressiveManual = class(TioSqlLimitStrategy_Base)
  strict private
    FHigherSqlLimitOffset: Integer;
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
  end;

implementation

uses
  System.Math, iORM.LiveBindings.Factory, iORM.Exceptions;

{ TioCommonBSAPaging }

procedure TioCommonBSAPaging.CheckStrategy;
begin
  if not Assigned(FStrategy) then
    EioException.Create(Self.ClassName, 'CheckStrategy', 'Paging is not active.')
end;

constructor TioCommonBSAPaging.Create;
begin
  Reset;
end;

function TioCommonBSAPaging.GetCurrentPage: Integer;
begin
  Result := FCurrentPage;
end;

function TioCommonBSAPaging.GetNextPageStartOffset: Integer;
begin
  Result := FNextPageStartOffset;
end;

function TioCommonBSAPaging.GetPageSize: Integer;
begin
  Result := FPageSize;
end;

function TioCommonBSAPaging.GetPagingType: TioBSAPagingType;
begin
  Result := FPagingType;
end;

function TioCommonBSAPaging.GetSqlLimit: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimit;
end;

function TioCommonBSAPaging.GetSqlLimitOffset: Integer;
begin
  CheckStrategy;
  Result := FStrategy.GetSqlLimitOffset;
end;

procedure TioCommonBSAPaging.NextPage;
begin
  SetCurrentPage(FCurrentPage + 1);
end;

procedure TioCommonBSAPaging.PrevPage;
begin
  SetCurrentPage(FCurrentPage - 1);
end;

procedure TioCommonBSAPaging.Reset;
begin
  FPagingType := PAGING_TYPE_DEFAULT;
  FCurrentPage := CURRENT_PAGE_DEFAULT;
  FPageSize := PAGE_SIZE_DEFAULT;
  FNextPageStartOffset := NEXT_PAGE_START_OFFSET;
end;

procedure TioCommonBSAPaging.SetCurrentPage(const Value: Integer);
begin
  if (Value = FCurrentPage) or (Value < 1) then
    Exit;
  CheckStrategy;
  FStrategy.CalcSqlLimit(Value, FPageSize, FNextPageStartOffset);
  FCurrentPage := Value;
end;

procedure TioCommonBSAPaging.SetNextPageStartOffset(const Value: Integer);
begin
  FNextPageStartOffset := Value;
end;

procedure TioCommonBSAPaging.SetPageSize(const Value: Integer);
begin
  FPageSize := Value;
end;

procedure TioCommonBSAPaging.SetPagingType(const Value: TioBSAPagingType);
begin
  if Value = FPagingType then
    Exit;
  FStrategy := TioLiveBindingsFactory.GetSqlLimitStrategy(Value);
  FPagingType := Value;
  Reset;
  if FActiveBindSourceAdapter.Active then
    FActiveBindSourceAdapter.Refresh(True);
end;

{ TioSqlLimitStrategy_Base }

function TioSqlLimitStrategy_Base.GetSqlLimitOffset: Integer;
begin
  Result := FSqlLimitOffset;
end;

function TioSqlLimitStrategy_Base.GetSqlLimit: Integer;
begin
  Result := FSqlLimit;
end;

procedure TioSqlLimitStrategy_Base.SetSqlLimit(const AValue: Integer);
begin
  FSqlLimit := Max(AValue, 0);
end;

procedure TioSqlLimitStrategy_Base.SetSqlLimitOffset(const AValue: Integer);
begin
  FSqlLimitOffset := Max(AValue, 0);
end;

{ TioSqlLimitStrategy_HardPaging }

procedure TioSqlLimitStrategy_HardPaging.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer);
begin
  SetSqlLimit(APageSize + ANextPageStartOffset);
  SetSqlLimitOffset((APageSize * (ADestPage - 1)) - ANextPageStartOffset);
end;

{ TioSqlLimitStrategy_ProgressiveManual }

procedure TioSqlLimitStrategy_ProgressiveManual.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer);
begin
  SetSqlLimit((APageSize * ADestPage) - FHigherSqlLimitOffset);
  SetSqlLimitOffset(FHigherSqlLimitOffset);
  FHigherSqlLimitOffset := GetSqlLimitOffset + GetSqlLimit;
end;

end.
