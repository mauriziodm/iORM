unit Model.BOMItems;

interface

uses
  Model.Interfaces, iORM.Attributes, Model.Material, Model.Process, Model.Product;

type

  [ioEntity('BOMItems', ioFields), ioTrueClass, diImplements(IBOMItem)]
  TBOMItem = class(TInterfacedObject, IBOMItem)
  private
    [ioIndex]
    FMasterID: Integer;
    FID: Integer;
    FQty: Single;
  protected
    function GetCost: Currency; virtual;
    function GetTime: Integer; virtual;
    function GetMaterialCost: Currency; virtual;
    function GetProcessCost: Currency; virtual;
  public
    constructor Create(const AQty:Single); virtual;
    property ID:Integer read FID write FID;
    property MasterID:Integer read FMasterID write FMasterID;
    property Qty:Single read FQty write FQty;
  end;

  [ioEntity('BOMItems', ioFields), ioTrueClass]
  TBOMItemMaterial = class(TBOMItem)
  private
    [ioBelongsTo(TMaterial)]
    FArticle: IMaterial;
  protected
    function GetCost: Currency; override;
    function GetMaterialCost: Currency; override;
  public
    constructor Create(const AMaterial:IMaterial; const AQty:Single); overload;
    property Article:IMaterial read FArticle write FArticle;
    property ItemCost:Currency read GetCost;
  end;

  [ioEntity('BOMItems', ioFields), ioTrueClass]
  TBOMItemProcess = class(TBOMItem)
  private
    [ioBelongsTo(TProcess)]
    FArticle: IProcess;
  protected
    function GetCost: Currency; override;
    function GetTime: Integer; override;
    function GetProcessCost: Currency; override;
  public
    constructor Create(const AProcess:IProcess; const AQty:Single); overload;
    property Article:IProcess read FArticle write FArticle;
    property ItemCost:Currency read GetCost;
    property ItemTime:Integer read GetTime;
  end;

  [ioEntity('BOMItems', ioFields), ioTrueClass]
  TBOMItemProduct = class(TBOMItem)
  private
    [ioBelongsTo(TProduct)]
    FArticle: IProduct;
  protected
    function GetCost: Currency; override;
    function GetTime: Integer; override;
    function GetMaterialCost: Currency; override;
    function GetProcessCost: Currency; override;
  public
    constructor Create(const AProduct:IProduct; const AQty:Single); overload;
    property Article:IProduct read FArticle write FArticle;
    property ItemCost:Currency read GetCost;
    property ItemTime:Integer read GetTime;
    property ItemMaterialCost:Currency read GetCost;
    property ItemProcessCost:Currency read GetCost;
  end;

implementation

{ TBOMItem<T> }

constructor TBOMItem.Create(const AQty: Single);
begin
  inherited Create;
  FQty := AQty;
end;

function TBOMItem.GetCost: Currency;
begin
  Result := 0;
end;

function TBOMItem.GetMaterialCost: Currency;
begin
  Result := 0;
end;

function TBOMItem.GetProcessCost: Currency;
begin
  Result := 0;
end;

function TBOMItem.GetTime: Integer;
begin
  Result := 0;
end;

{ TBOMItemMaterial }

constructor TBOMItemMaterial.Create(const AMaterial: IMaterial;
  const AQty: Single);
begin
  inherited Create(AQty);
  FArticle := AMaterial;
end;

function TBOMItemMaterial.GetCost: Currency;
begin
  Result := FArticle.Cost * Qty;
end;

function TBOMItemMaterial.GetMaterialCost: Currency;
begin
  Result := FArticle.Cost * Qty;
end;

{ TBOMItemProcess }

constructor TBOMItemProcess.Create(const AProcess: IProcess;
  const AQty: Single);
begin
  inherited Create(AQty);
  FArticle := AProcess;
end;

function TBOMItemProcess.GetCost: Currency;
begin
  Result := FArticle.Cost * FQty;
end;

function TBOMItemProcess.GetProcessCost: Currency;
begin
  Result := FArticle.Cost * FQty;
end;

function TBOMItemProcess.GetTime: Integer;
begin
  Result := Trunc(FArticle.Time * FQty);
end;

{ TBOMItemProduct }

constructor TBOMItemProduct.Create(const AProduct: IProduct;
  const AQty: Single);
begin
  inherited Create(AQty);
  FArticle := AProduct;
end;

function TBOMItemProduct.GetCost: Currency;
begin
  Result := FArticle.Cost * FQty;
end;

function TBOMItemProduct.GetMaterialCost: Currency;
begin
  Result := FArticle.MaterialCost * FQty;
end;

function TBOMItemProduct.GetProcessCost: Currency;
begin
  Result := FArticle.ProcessCost * FQty;
end;

function TBOMItemProduct.GetTime: Integer;
begin
  Result := Trunc(FArticle.Time * FQty);
end;

end.
