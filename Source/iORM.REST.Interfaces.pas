unit iORM.REST.Interfaces;

interface

uses
  iORM.Where.Interfaces, System.JSON;

  const
    KEY_WHERE = 'Where';
    KEY_DATAOBJECT = 'DataObj';
    KEY_JSONDATAVALUE = 'JSONDataValue';
    KEY_RELATIONPROPERTYNAME = 'RelPropName';
    KEY_RELATIONOID = 'RelOID';
    KEY_BLINDINSERT = 'Blind';

type

  IioRESTRequestBody = interface
    ['{83DE9ECE-47EA-4814-B40E-3E39FAA210A2}']
    function ToJSONObject:TJSONObject;
    // Where
    procedure SetWhere(const Value: IioWhere);
    function GetWhere: IioWhere;
    property Where:IioWhere read GetWhere write SetWhere;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
    // RelationPropertyName
    procedure SetRelationPropertyName(const Value: String);
    function GetRelationPropertyName: String;
    property RelationPropertyName:String read GetRelationPropertyName write SetRelationPropertyName;
    // RelationOID
    procedure SetRelationOID(const Value: Integer);
    function GetRelationOID: Integer;
    property RelationOID:Integer read GetRelationOID write SetRelationOID;
    // BlindInsert
    procedure SetBlindInsert(const Value: Boolean);
    function GetBlindInsert: Boolean;
    property BlindInsert:Boolean read GetBlindInsert write SetBlindInsert;
  end;

  IioRESTResponseBody = interface
    ['{E5A14525-308F-4877-99B7-C270D691FC6D}']
    function ToJSONObject:TJSONObject;
    // JSONDataValue
    procedure SetJSONDataValue(const Value: TJSONValue);
    function GetJSONDataValue: TJSONValue;
    property JSONDataValue:TJSONValue read GetJSONDataValue write SetJSONDataValue;
    // DataObject
    procedure SetDataObject(const Value: TObject);
    function GetDataObject: TObject;
    property DataObject:TObject read GetDataObject write SetDataObject;
  end;

implementation

end.
