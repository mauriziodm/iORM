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

{$TYPEINFO ON}
  TioCommonBSAPageManager = class(TPersistent)
  strict private
    FCurrentPage: Integer;
    FNextPageStartOffset: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FStrategy: IioBSAPageManagerStrategy;
  strict protected
    procedure SetCurrentPage(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    function GetSqlLimit: Integer; // Lascio o tolgo?
    function GetSqlLimitOffset: Integer; // Lascio o tolgo?
    procedure CheckStrategy;
    procedure Reset;
  public
    procedure NextPage;
    procedure PrevPage;
    property CurrentPage: Integer read FCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
  published
    // constructor Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    constructor Create;
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
    function GetSqlLimit: Integer;
    function GetSqlLimitOffset: Integer;
  end;

  TioCommonBSAPageManagerStrategy_HardPaging = class(TioCommonBSAPageManagerStrategy)
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
  end;

  // NB: Un eventuale altro LimitStrategy progressivo ma con avanzamento pagina automatico
  // calcolerà la soglia che innescherà il caricamento della pagina successiva (ex NextPageAutoThreshold)
  // ponendolo clla metà della PageSize
  TioCommonBSAPageManagerStrategy_ProgressiveManual = class(TioCommonBSAPageManagerStrategy)
  strict private
    FHigherSqlLimitOffset: Integer;
  public
    procedure CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer); override;
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

constructor TioCommonBSAPageManager.Create;
begin
  FPagingType := PAGING_TYPE_DEFAULT;
  FPageSize := PAGE_SIZE_DEFAULT;
  FNextPageStartOffset := NEXT_PAGE_START_OFFSET;
  Reset;
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

procedure TioCommonBSAPageManager.Reset;
begin
  FCurrentPage := CURRENT_PAGE_DEFAULT;
end;

procedure TioCommonBSAPageManager.SetCurrentPage(const Value: Integer);
begin
  if (Value = FCurrentPage) or (Value < 1) then
    Exit;
  CheckStrategy;
  FStrategy.CalcSqlLimit(Value, FPageSize, FNextPageStartOffset);
  FCurrentPage := Value;
end;

procedure TioCommonBSAPageManager.SetPagingType(const Value: TioBSAPagingType);
begin
  if Value = FPagingType then
    Exit;
  FStrategy := TioLiveBindingsFactory.GetBSAPageManagerStrategy(Value);
  FPagingType := Value;
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

{ TioSqlLimitStrategy_ProgressiveManual }

procedure TioCommonBSAPageManagerStrategy_ProgressiveManual.CalcSqlLimit(const ADestPage, APageSize, ANextPageStartOffset: Integer);
begin
  SetSqlLimit((APageSize * ADestPage) - FHigherSqlLimitOffset);
  SetSqlLimitOffset(FHigherSqlLimitOffset);
  FHigherSqlLimitOffset := GetSqlLimitOffset + GetSqlLimit;
end;

end.
