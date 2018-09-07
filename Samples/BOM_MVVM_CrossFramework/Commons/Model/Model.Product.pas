unit Model.Product;

interface

uses
  Model.Interfaces, iORM.Attributes, Model.Base, iORM.Containers.Interfaces,
  System.Generics.Collections;

type

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IProduct)]
  TProduct = class(TBase, IProduct)
  private
//    FBOMItems: IioList<IBOMItem>;
    FBOMItems: TList<IBOMItem>;
  protected
    // BOMItems
    function GetBOMItems: TList<IBOMItem>;
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
    destructor Destroy; override;
    [ioHasMany(IBOMItem, 'MasterID')]
    property BOMItems:TList<IBOMItem> read GetBOMItems;
    [ioSkip]
    property Cost:Currency read GetCost;
    [ioSkip]
    property Time:Integer read GetTime;
    [ioSkip]
    property MaterialCost:Currency read GetMaterialCost;
    [ioSkip]
    property ProcessCost:Currency read GetProcessCost;
  end;

implementation

uses
  iORM, iORM.LazyLoad.Generics.List;

{ TProduct }

constructor TProduct.Create;
begin
  inherited;
//  FBOMItems := TioList<IBOMItem>.Create;
  FBOMItems := TList<IBOMItem>.Create;
end;

destructor TProduct.Destroy;
begin
  FBOMItems.Free;
  inherited;
end;

function TProduct.GetBOMItems: TList<IBOMItem>;
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
