unit BusinessObjects.ProdItems;

interface

uses
  iORM.Attributes,
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  System.Generics.Collections, System.Classes, BusinessObjects.Interfaces, iORM.Containers.Interfaces;

type

  [ioEntity('ProdItems'), ioTrueClass, diImplements(IProdItem)]
  TProdItem = class(TInterfacedObject, IProdItem)
  private
    [ioIndex]
    FMasterID: Integer;
    FID: Integer;
    FQty: Single;
    FRow_Index: Integer;
  public
    constructor Create(const AQty: Single); virtual;
    property ID: Integer read FID write FID;
    property MasterID: Integer read FMasterID write FID;
    property Qty: Single read FQty write FQty;
    property Row_Index: Integer read FRow_Index write FRow_Index;
  end;

  [ioEntity('ProdItems'), ioTrueClass]
  TItemProductionOrderRow = class(TProdItem)
  private
    FItem: IProductionOrderRow;
  public
    constructor Create(const aProductionOrderRow: IProductionOrderRow; const AQty: Single); overload;
    [ioInteger(10, False)]
    [ioBelongsTo('IProductionOrderRow')]
    property Item: IProductionOrderRow read FItem write FItem;
  end;

  [ioEntity('ProdItems'), ioTrueClass]
  TItemProductionOrderHeader = class(TProdItem)
  private
    FItem: IProductionOrderHeader;
  public
    constructor Create(const aProductionOrderHeader: IProductionOrderHeader; const AQty: Single); overload;
    [ioBelongsTo('IProductionOrderHeader')]
    [ioInteger(10, False)]
    property Item: IProductionOrderHeader read FItem write FItem;
  end;

implementation

{ TProdItem }

constructor TProdItem.Create(const AQty: Single);
begin
  inherited Create;
  FQty := AQty;
end;

{ TBOMItemProduct }

constructor TItemProductionOrderHeader.Create(const aProductionOrderHeader: IProductionOrderHeader; const AQty: Single);
begin
  inherited Create(AQty);
  FItem := aProductionOrderHeader;
end;

{ TProdtemMaterial }

constructor TItemProductionOrderRow.Create(const aProductionOrderRow: IProductionOrderRow; const AQty: Single);
begin
  inherited Create(AQty);
  FItem := aProductionOrderRow;
end;

end.
