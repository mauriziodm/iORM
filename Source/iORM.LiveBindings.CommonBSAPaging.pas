unit iORM.LiveBindings.CommonBSAPaging;

interface

uses
  iORM.LiveBindings.Interfaces;

const
  PAGING_TYPE_DEFAULT = ptDisabled;
  CURRENT_PAGE_DEFAULT = 1;
  NEXT_PAGE_AUTO_THRESHOLD_DEFAULT = 50;
  NEXT_PAGE_START_OFFSET = 0;
  PAGE_SIZE_DEFAULT = 100;

type

{$TYPEINFO ON}
  TioCommonBSAPaging = class(TInterfacedObject)
  private
    [Weak]
    FActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    FCurrentPage: Integer;
    FCurrentPageFirstRecNo: Integer;
    FCurrentPageLastRecNo: Integer;
    FNextPageAutoThreshold: Integer;
    FNextPageStartOffset: Integer;
    FPageSize: Integer;
    FPagingType: TioBSAPagingType;
    FHigherLoadedRecNo: Integer;
  protected
    procedure SetCurrentPage(const Value: Integer);
    procedure SetNextPageAutoThreshold(const Value: Integer);
    procedure SetNextPageStartOffset(const Value: Integer);
    procedure SetPagingType(const Value: TioBSAPagingType);
    procedure SetPageSize(const Value: Integer);
    function GetCurrentPage: Integer;
    function GetCurrentPageFirstRecNo: Integer;
    function GetCurrentPageLastRecNo: Integer;
    function GetHigherLoadedRecNo: Integer;
    function GetNextPageAutoThreshold: Integer;
    function GetNextPageStartOffset: Integer;
    function GetPagingType: TioBSAPagingType;
    function GetPageSize: Integer;
  public
    property CurrentPage: Integer read GetCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
    property CurrentPageFirstRecNo: Integer read GetCurrentPageLastRecNo;
    property CurrentPageLastRecNo: Integer read GetCurrentPageFirstRecNo;
    property HigherLoadedRecNo: Integer read GetHigherLoadedRecNo;
    // procedure GoToPage
    // procedure NextPage
    // procedure PrevPage
  published
    constructor Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    property NextPageAutoThreshold: Integer read GetNextPageAutoThreshold write SetNextPageAutoThreshold
      default NEXT_PAGE_AUTO_THRESHOLD_DEFAULT;
    property NextPageStartOffset: Integer read GetNextPageStartOffset write SetNextPageStartOffset
      default NEXT_PAGE_START_OFFSET;
    property PageSize: Integer read GetPageSize write SetPageSize default PAGE_SIZE_DEFAULT;
    property PagingType: TioBSAPagingType read GetPagingType write SetPagingType default PAGING_TYPE_DEFAULT;
  end;

implementation

{ TioCommonBSAPaging }

constructor TioCommonBSAPaging.Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  FPagingType := PAGING_TYPE_DEFAULT;
  FCurrentPage := CURRENT_PAGE_DEFAULT;
  FPageSize := PAGE_SIZE_DEFAULT;
  FNextPageAutoThreshold := NEXT_PAGE_AUTO_THRESHOLD_DEFAULT;
  FNextPageStartOffset := NEXT_PAGE_START_OFFSET;
  FActiveBindSourceAdapter := AActiveBindSourceAdapter;
end;

function TioCommonBSAPaging.GetCurrentPageFirstRecNo: Integer;
begin
  Result := FCurrentPageLastRecNo;
end;

function TioCommonBSAPaging.GetCurrentPage: Integer;
begin
  result := FCurrentPage;
end;

function TioCommonBSAPaging.GetCurrentPageLastRecNo: Integer;
begin
  Result := FCurrentPageFirstRecNo;
end;

function TioCommonBSAPaging.GetHigherLoadedRecNo: Integer;
begin
  Result := FHigherLoadedRecNo;
end;

function TioCommonBSAPaging.GetNextPageAutoThreshold: Integer;
begin
  result := FNextPageAutoThreshold;
end;

function TioCommonBSAPaging.GetNextPageStartOffset: Integer;
begin
  result := FNextPageStartOffset;
end;

function TioCommonBSAPaging.GetPageSize: Integer;
begin
  result := FPageSize;
end;

function TioCommonBSAPaging.GetPagingType: TioBSAPagingType;
begin
  Result := FPagingType;
end;

procedure TioCommonBSAPaging.SetCurrentPage(const Value: Integer);
begin
  FCurrentPage := Value;
end;

procedure TioCommonBSAPaging.SetNextPageAutoThreshold(const Value: Integer);
begin
  FNextPageAutoThreshold := Value;
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
  FPagingType := Value;
end;

end.
