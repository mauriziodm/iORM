unit Model.Product;

interface

uses
  Model.Interfaces, iORM.Attributes, Model.Base, iORM.Containers.Interfaces;

type

  [ioEntity('ARTICLES', ioFields), ioTrueClass, diImplements(IProduct)]
  TProduct = class(TBase, IProduct)
  private
    [ioHasMany('IBOMItem', 'MasterID')]
    FBOMItems: IioList<IBOMItem>;
  protected
    // BOMItems
    function GetBOMItems: IioList<IBOMItem>;
    // Cost
    function GetCost: Currency;
    // Time (minute)
    function GetTime: Integer;
    // MaterialCost
    function GetMaterialCost: Currency;
    // ProcessCost
    function GetProcessCost: Currency;
  public
    constructor Create; override;
    property BOMItems:IioList<IBOMItem> read GetBOMItems;
    property Cost:Currency read GetCost;
    property Time:Integer read GetTime;
    property MaterialCost:Currency read GetMaterialCost;
    property ProcessCost:Currency read GetProcessCost;
  end;

implementation

uses
  iORM, iORM.LazyLoad.Generics.List;

{ TProduct }

constructor TProduct.Create;
begin
  inherited;
  FBOMItems := TioList<IBOMItem>.Create;
end;

function TProduct.GetBOMItems: IioList<IBOMItem>;
begin
  Result := FBOMItems;
end;

function TProduct.GetCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  Result := 0;
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetCost;
end;

function TProduct.GetMaterialCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  Result := 0;
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetMaterialCost;
end;

function TProduct.GetProcessCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  Result := 0;
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetProcessCost;
end;

function TProduct.GetTime: Integer;
var
  LBOMItem: IBOMItem;
begin
  Result := 0;
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetTime;
end;

end.
