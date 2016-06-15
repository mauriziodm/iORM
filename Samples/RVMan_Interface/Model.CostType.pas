unit Model.CostType;

interface

uses
  Model.BaseConst, Model.BaseClasses, iORM.Attributes,
  Model.CostType.Interfaces;

const
  GroupHeaders: array[0..2] of string = ('Totale', 'Varie', 'Carburante');

type
  // Classe che rappresente i tipi di spesa possibili
  [ioTable('COSTTYPES')]
  TCostType = class(TBaseClass, ICostType)
  strict private
    FObjectType: Byte;
  strict protected
    function GetObjectType: Byte;
    procedure SetObjectType(Value: Byte);
    function GetListViewItem_GroupHeader: String; override;
  public
    constructor Create(AID:Integer; ADescrizione:String; AObjectType:Byte); overload;
    property ObjectType: Byte read GetObjectType write SetObjectType;
  end;

implementation

{ TCostType }


constructor TCostType.Create(AID: Integer; ADescrizione: String;
  AObjectType: Byte);
begin
  inherited Create(AID, ADescrizione);
  ObjectType := AObjectType;
end;


// -----------------------------------------------------------------------------
function TCostType.GetListViewItem_GroupHeader: String;
begin
  inherited;
  Result := GroupHeaders[Self.ObjectType];
end;

function TCostType.GetObjectType: Byte;
begin
  Result := FObjectType;
end;

procedure TCostType.SetObjectType(Value: Byte);
begin
  if Value <> FObjectType then
  begin
    FObjectType := Value;
  end;
end;
// -----------------------------------------------------------------------------

end.
