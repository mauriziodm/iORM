unit Interfaces;

interface

uses
  System.Generics.Collections;

type

  IPhoneNumber = interface
    ['{A1441E43-1546-41A8-A96A-E61420060CCF}']
    // ID
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;
    // Numero
    procedure SetNumber(const Value: String);
    function GetNumber: String;
    property Number:String read GetNumber write SetNumber;
    // MasterID
    procedure SetMasterID(const Value: Integer);
    function GetMasterID: Integer;
    property MasterID:Integer read GetMasterID write SetMasterID;
  end;

  IPerson = interface
    ['{C17BE296-6DD3-4452-BBBE-C09223938C67}']
    // ID
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    property ID:Integer read GetID write SetID;
    // Name
    procedure SetName(const Value: String);
    function GetName: String;
    property Name:String read GetName write SetName;
    // Phone numbers
    function GetPhones: TDictionary<String,IPhoneNumber>;
    property Phones:TDictionary<String,IPhoneNumber> read GetPhones;
  end;

implementation

end.
