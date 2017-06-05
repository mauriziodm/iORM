unit Model.Product;

interface

uses
  Model.Interfaces, iORM.Containers.Interfaces, iORM.Attributes, Model.Base;

type

  [ioEntity('ARTICLES', ioFields), ioTrueClass, diImplements(IProduct)]
  TProduct = class(TBase, IProduct)
  private
    [ioInject]
    [ioHasMany('IBOMItem', 'MasterID', ioLazyLoad)]
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

function TProduct.GetBOMItems: IioList<IBOMItem>;
begin
  Result := FBOMItems;
end;

function TProduct.GetCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetItemCost;
end;

function TProduct.GetMaterialCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetItemMaterialCost;
end;

function TProduct.GetProcessCost: Currency;
var
  LBOMItem: IBOMItem;
begin
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetItemProcessCost;
end;

function TProduct.GetTime: Integer;
var
  LBOMItem: IBOMItem;
begin
  for LBOMItem in FBOMItems do
    Result := Result + LBOMItem.GetItemTime;
end;

initialization

  io.di.RegisterClass<TioList<IBOMItem>>.Implements<IioList<IBOMItem>>.Execute;

end.
