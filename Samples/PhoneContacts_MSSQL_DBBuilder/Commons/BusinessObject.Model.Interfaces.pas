unit BusinessObject.Model.Interfaces;

interface

uses
  System.Generics.Collections, 
  iORM.Containers.Interfaces;

type
  IPhoneNumber = Interface(IInvokable)
    ['{08A1F5A8-3D1D-482A-B2EC-166B4C9064F7}']
    procedure SetID(AValue:Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;

    procedure SetPersonID(AValue:Integer);
    function GetPersonID: Integer;
    property PersonID:Integer read GetPersonID write SetPersonID;

    procedure SetPhoneType(AValue:String);
    function GetPhoneType: String;
    property PhoneType:String read GetPhoneType write SetPhoneType;

    procedure SetPhoneNumber(AValue:String);
    function GetPhoneNumber: String;
    property PhoneNumber:String read GetPhoneNumber write SetPhoneNumber;
  end;

  IPerson = interface(IInvokable)
    ['{0F8EAEE5-6E59-4A95-B08C-8CD1F31C32D3}']
    procedure SetID(AValue:Integer);
    procedure SetFirstName(AValue:String);
    procedure SetLastName(AValue:String);
    procedure SetPhones(AValue:IioList<IPhoneNumber>);
    function GetID: Integer;
    function GetFirstName: String;
    function GetLastName: String;
    function GetPhones: IioList<IPhoneNumber>;
    function GetFullName: String;
    function GetClassNameProp: String;
    function GetSalary: Currency;
    procedure SetSalary(const Value: Currency);
    function GetPhoto: String;
    procedure SetPhoto(const Value: String);
    function GetBirthDate: TDate;
    function GetBirthTime: TTime;
    function GetLastUpdate: TDateTime;
    procedure SetBirthDate(const Value: TDate);
    procedure SetBirthTime(const Value: TTime);
    procedure SetLastUpdate(const Value: TDateTime);
    function GetFloatField: Double;
    function GetIntegerField: Integer;
    procedure SetFloatField(const Value: Double);
    procedure SetIntegerField(const Value: Integer);

    property ID:Integer read GetID write SetID;
    property FirstName:String read GetFirstName write SetFirstName;
    property LastName:String read GetLastName write SetLastName;
    property Phones:IioList<IPhoneNumber> read GetPhones write SetPhones;
    property FullName:String read GetFullName;
    property ClassNameProp:String read GetClassNameProp;
    property Salary: Currency read GetSalary write SetSalary;
    property Photo: String read GetPhoto write SetPhoto;
    property BirthDate: TDate read GetBirthDate write SetBirthDate;
    property BirthTime: TTime read GetBirthTime write SetBirthTime;
    property LastUpdate: TDateTime read GetLastUpdate write SetLastUpdate;
    property FloatField: Double read GetFloatField write SetFloatField;
    property IntegerField: Integer read GetIntegerField write SetIntegerField;
  end;

  IEmployee = interface(IPerson)
    ['{D95C8DFF-3C1B-4E81-A3D3-65C0D06ADF83}']
    procedure SetBranchOffice(AValue:String);
    function GetBranchOffice: String;
    property BranchOffice:String read GetBranchOffice write SetBranchOffice;
  end;

  ICustomer = interface(IPerson)
    ['{92931D4F-E238-4E76-8D29-53F9D3F265E3}']
    procedure SetFidelityCardCode(AValue:String);
    function GetFidelityCardCode: String;
    property FidelityCardCode:String read GetFidelityCardCode write SetFidelityCardCode;
  end;

  IVipCustomer = interface(ICustomer)
    ['{5C2DD04E-7B58-44A2-BCA8-BD0782AABF10}']
    procedure SetVipCardCode(AValue:String);
    function GetVipCardCode: String;
    property VipCardCode:String read GetVipCardCode write SetVipCardCode;
  end;

implementation

end.
