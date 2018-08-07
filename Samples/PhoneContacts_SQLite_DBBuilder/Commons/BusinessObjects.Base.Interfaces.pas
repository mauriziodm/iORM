unit BusinessObjects.Base.Interfaces;

interface

type

  IBaseBO = interface
    ['{82F3A949-B54C-4647-B5AB-87CE43798DA8}']
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;
  end;

  ISingletonString = interface
    ['{FAEC5AEF-69A2-4B71-A74E-9072A273B05B}']
    procedure SetValue(const Value: String);
    function GetValue: String;
    property Value: String read GetValue write SetValue;
  end;

implementation

end.

