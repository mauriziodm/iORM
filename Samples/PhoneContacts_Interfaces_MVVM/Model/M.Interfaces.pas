unit M.Interfaces;

interface

uses
  iORM.Containers.Interfaces;

type

  IPhoneNumber = Interface
    ['{08A1F5A8-3D1D-482A-B2EC-166B4C9064F7}']
    // ID
    procedure SetID(AValue:Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;
    // PersonID
    procedure SetPersonID(AValue:Integer);
    function GetPersonID: Integer;
    property PersonID:Integer read GetPersonID write SetPersonID;
    // PhoneType
    procedure SetPhoneType(AValue:String);
    function GetPhoneType: String;
    property PhoneType:String read GetPhoneType write SetPhoneType;
    // PhoneNUmber
    procedure SetPhoneNumber(AValue:String);
    function GetPhoneNumber: String;
    property PhoneNumber:String read GetPhoneNumber write SetPhoneNumber;
  end;

  IPerson = interface
    ['{0F8EAEE5-6E59-4A95-B08C-8CD1F31C32D3}']
    // ID
    procedure SetID(AValue:Integer);
    function GetID: Integer;
    property ID:Integer read GetID write SetID;
    // FirstName
    procedure SetFirstName(AValue:String);
    function GetFirstName: String;
    property FirstName:String read GetFirstName write SetFirstName;
    // LastName
    procedure SetLastName(AValue:String);
    function GetLastName: String;
    property LastName:String read GetLastName write SetLastName;
    // Phones
    procedure SetPhones(AValue:IioList<IPhoneNumber>);
    function GetPhones: IioList<IPhoneNumber>;
    property Phones:IioList<IPhoneNumber> read GetPhones write SetPhones;
    // FullName
    function GetFullName: String;
    property FullName:String read GetFullName;
    // ClassNameProp
    function GetClassNameProp: String;
    property ClassNameProp:String read GetClassNameProp;
  end;

  IEmployee = interface(IPerson)
    ['{D95C8DFF-3C1B-4E81-A3D3-65C0D06ADF83}']
    // BranchOffice
    procedure SetBranchOffice(AValue:String);
    function GetBranchOffice: String;
    property BranchOffice:String read GetBranchOffice write SetBranchOffice;
  end;

  ICustomer = interface(IPerson)
    ['{92931D4F-E238-4E76-8D29-53F9D3F265E3}']
    // FidelityCardCode
    procedure SetFidelityCardCode(AValue:String);
    function GetFidelityCardCode: String;
    property FidelityCardCode:String read GetFidelityCardCode write SetFidelityCardCode;
  end;

  IVipCustomer = interface(ICustomer)
    ['{5C2DD04E-7B58-44A2-BCA8-BD0782AABF10}']
    // VipCardCode
    procedure SetVipCardCode(AValue:String);
    function GetVipCardCode: String;
    property VipCardCode:String read GetVipCardCode write SetVipCardCode;
  end;


implementation

end.
