unit DDT.DynamicDocTypes;

interface

uses
  System.Classes, DDT.Interfaces, System.Generics.Collections;

type

  TddtDynamicDocTypes = class(TInterfacedObject, IddtDynamicDocTypes)
  private
    FItems: TList<IddtDocTypeItem>;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure AddDocTypeItem(const ADocTypeItem: IddtDocTypeItem);
    procedure FillWhereConditions(const AStrings: TStrings);
  end;

implementation

{ TddtDynamicDocTypes }

procedure TddtDynamicDocTypes.AddDocTypeItem(const ADocTypeItem: IddtDocTypeItem);
begin
  FItems.Add(ADocTypeItem);
end;

constructor TddtDynamicDocTypes.Create;
begin
  inherited;
  FItems := TList<IddtDocTypeItem>.Create;
end;

destructor TddtDynamicDocTypes.Destroy;
begin
  FItems.Free;
  inherited;
end;

procedure TddtDynamicDocTypes.FillWhereConditions(const AStrings: TStrings);
var
  LDocTypeItem: IddtDocTypeItem;
begin
  for LDocTypeItem in FItems do
    AStrings.Add(LDocTypeItem.GetWhereSQL);
end;

end.
