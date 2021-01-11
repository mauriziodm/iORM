unit iORM.LiveBindings.CommonBSAPaging;

interface

uses
  iORM.LiveBindings.Interfaces;

const
  ENABLED_DEFAULT = False;
  CURRENT_PAGE_DEFAULT = 1;
  PAGE_ADJUSTMENT_FACTOR_DEFAULT = 0;
  PAGE_SIZE_DEFAULT = 50;

type

  TioCommonBSAPaging = class
  private
    [Weak]
    FActiveBindSourceAdapter: IioActiveBindSourceAdapter;
    FCurrentPage: Integer;
    FEnabled: boolean;
    FPageAdjustmentFactor: Integer;
    FPageSize: Integer;
  protected
    procedure SetCurrentPage(const Value: Integer);
    procedure SetEnabled(const Value: boolean);
    procedure SetPageAdjustmentFactor(const Value: Integer);
    procedure SetPageSize(const Value: Integer);
    function GetCurrentPage: Integer;
    function GetEnabled: boolean;
    function GetPageAdjustmentFactor: Integer;
    function GetPageSize: Integer;
  public
    property CurrentPage: Integer read GetCurrentPage write SetCurrentPage default CURRENT_PAGE_DEFAULT;
  published
    constructor Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
    property Enabled: boolean read GetEnabled write SetEnabled default ENABLED_DEFAULT;
    property PageAdjustmentFactor: Integer read GetPageAdjustmentFactor write SetPageAdjustmentFactor default PAGE_ADJUSTMENT_FACTOR_DEFAULT;
    property PageSize: Integer read GetPageSize write SetPageSize default PAGE_SIZE_DEFAULT;
  end;

implementation

{ TioCommonBSAPaging }

constructor TioCommonBSAPaging.Create(const AActiveBindSourceAdapter: IioActiveBindSourceAdapter);
begin
  FEnabled := ENABLED_DEFAULT;
  FCurrentPage := CURRENT_PAGE_DEFAULT;
  FPageSize := PAGE_SIZE_DEFAULT;
  FPageAdjustmentFactor := PAGE_ADJUSTMENT_FACTOR_DEFAULT;
  FActiveBindSourceAdapter := AActiveBindSourceAdapter;
end;

function TioCommonBSAPaging.GetCurrentPage: Integer;
begin
  result := FCurrentPage;
end;

function TioCommonBSAPaging.GetEnabled: boolean;
begin
  result := FEnabled;
end;

function TioCommonBSAPaging.GetPageAdjustmentFactor: Integer;
begin
  result := FPageAdjustmentFactor;
end;

function TioCommonBSAPaging.GetPageSize: Integer;
begin
  result := FPageSize;
end;

procedure TioCommonBSAPaging.SetCurrentPage(const Value: Integer);
begin
  FCurrentPage := Value;
end;

procedure TioCommonBSAPaging.SetEnabled(const Value: boolean);
begin
  FEnabled := Value;
end;

procedure TioCommonBSAPaging.SetPageAdjustmentFactor(const Value: Integer);
begin
  FPageAdjustmentFactor := Value;
end;

procedure TioCommonBSAPaging.SetPageSize(const Value: Integer);
begin
  FPageSize := Value;
end;

end.
