unit eCommerceImport_Items;

interface

uses
  System.Generics.Collections, eCommerceImport_Common;

type
  TecImportExportItem = class (TecBaseClass)
  public
  strict private
  var
    FItemIndex: Integer;
    FItemDescription: String;
    FItemSqlWhere: String;
    FItemDetailsSqlWhere: String;
  public
    property ItemIndex: Integer read FItemIndex write FItemIndex;
    property ItemDescription: String read FItemDescription write FItemDescription;
    property ItemSqlWhere: String read FItemSqlWhere write FItemSqlWhere;
    property ItemDetailsSqlWhere: String read FItemDetailsSqlWhere write FItemDetailsSqlWhere;
  end;

  /// <url>element://model:project::levante/delphi:e_method:src:levante:eCommerceImport_Loaders.TecLoader.PrepareImportList()</url>
  TecImportExportItemList = class (TecBaseClass)
  strict private
    FItems: TObjectList<TecImportExportItem>;
  strict
  private
    function GetCount: Integer; protected
    function GetItem(Index: Integer): TecImportExportItem;
  public
    property ItemList: TObjectList<TecImportExportItem> read FItems;
    /// <clientCardinality>0..*</clientCardinality>
    /// <supplierCardinality>1</supplierCardinality>
    /// <directed>True</directed>
    property ItemsArray[Index: Integer]: TecImportExportItem
      read GetItem; default;
    property Count: Integer read GetCount;
    constructor Create;
    destructor Destroy; override;
    procedure Add(NewDescription:String; NewItemSqlWhere:String; NewItemDetailsSqlWhere:String);
  end;

implementation

{ TecImportExportItemList }

function TecImportExportItemList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TecImportExportItemList.GetItem(Index: Integer): TecImportExportItem;
begin
  Result := FItems[Index];
end;

procedure TecImportExportItemList.Add(NewDescription, NewItemSqlWhere: String; NewItemDetailsSqlWhere:String);
var
  NewImportExportItem: TecImportExportItem;
begin
  NewImportExportItem := TecImportExportItem.Create;
  try
    NewImportExportItem.ItemIndex := ItemList.Count;
    NewImportExportItem.ItemDescription := NewDescription;
    NewImportExportItem.ItemSqlWhere := NewItemSqlWhere;
    NewImportExportItem.ItemDetailsSqlWhere := NewItemDetailsSqlWhere;
    ItemList.Add(NewImportExportItem);
  except
    NewImportExportItem.Free;
    raise;
  end;
end;

constructor TecImportExportItemList.Create;
begin
  inherited Create;
  FItems := TObjectList<TecImportExportItem>.Create(True);
end;

destructor TecImportExportItemList.Destroy;
begin
  FItems.Free;
  inherited Destroy;
end;

end.
