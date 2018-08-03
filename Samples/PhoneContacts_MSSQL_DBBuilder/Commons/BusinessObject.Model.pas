unit BusinessObject.Model;

interface

uses
  System.Generics.Collections,
  iORM.Attributes,
  iORM.Containers.Interfaces,
  iORM.CommonTypes,
  BusinessObject.Model.Interfaces;

type

//{$RTTI EXPLICIT METHODS([vcPublic, vcProtected, vcPrivate])}
{$RTTI EXPLICIT METHODS([vcPublic, vcProtected])}

  [ioEntity('Phones')]
  TPhoneNumber = class(TInterfacedObject, IPhoneNumber)
  private
    FPhoneNumber: String;
    FPhoneType: String;
    FPersonID: Integer;
    FID: Integer;
  protected
    procedure SetID(AValue:Integer);
    function GetID: Integer;
    procedure SetPersonID(AValue:Integer);
    function GetPersonID: Integer;
    procedure SetPhoneType(AValue:String);
    function GetPhoneType: String;
    procedure SetPhoneNumber(AValue:String);
    function GetPhoneNumber: String;
  public
    constructor Create(NewPhoneType, NewPhoneNumber: String; NewPersonID: Integer; NewID: Integer = 0); overload;
    destructor Destroy; override;
    [ioInteger(10, False)]
    property ID: Integer read GetID write SetID;
    [ioInteger(10, False)]
    property PersonID:Integer read GetPersonID write SetPersonID;
    [ioVarchar(70, True)]
    property PhoneType:String read FPhoneType write FPhoneType;
    [ioVarchar(35, True)]
    property PhoneNumber:String read FPhoneNumber write FPhoneNumber;
  end;

  [ioEntity('Persons', ioFields), ioTrueClass]
  [ioIndex('[.LastName], [.FirstName]')]
  TPerson = class(TInterfacedObject, IPerson)
  private
    [ioInteger(10, False)]
    FID: Integer;
    [ioVarchar(100, False)]
    FLastName: String;
    [ioVarchar(50, False)]
    FFirstName: String;
    [ioHasMany('IPhoneNumber', 'PersonID', ioLazyLoad), ioInject]
    FPhones: IioList<IPhoneNumber>;
    [ioDecimal(18, 3, True)]
    FSalary: Currency;
    [ioBinary('',True)]
    FPhoto: String;
    [ioDate(True)]
    FBirthDate: TDate;
    [ioTime(True)]
    FBirthTime: TTime;
    [ioDateTime(True)]
    FLastUpdate: TDateTime;
    [ioFloat(True)]
    FFloatField: Double;
    [ioInteger(10, True)]
    FIntegerField: Integer;
  protected
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
  public
    constructor Create(NewFirstName, NewLastName: String; NewID: Integer = 0); overload;
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

  [ioEntity('Persons',  ioFields), ioTrueClass]
  TEmployee = class(TPerson, IEmployee)
  private
    [ioVarchar(50, False)]
    FBranchOffice: String;
  protected
    procedure SetBranchOffice(AValue:String);
    function GetBranchOffice: String;
  public
    constructor Create(NewFirstName, NewLastName, NewBranchOffice: String; NewID: Integer = 0); overload;
    property BranchOffice:String read GetBranchOffice write SetBranchOffice;
  end;

  [ioEntity('Persons',  ioFields), ioTrueClass]
  TCustomer = class(TPerson, ICustomer)
  private
    [ioIndex]
    [ioIndex(ioDescending)]
    [ioVarchar(150, False)]
    FFidelityCardCode: String;
  protected
    procedure SetFidelityCardCode(AValue:String);
    function GetFidelityCardCode: String;
  public
    constructor Create(NewFirstName, NewLastName, NewFidelityCardCode: String; NewID: Integer = 0); overload;
    property FidelityCardCode:String read GetFidelityCardCode write SetFidelityCardCode;
  end;

  [ioEntity('Persons',  ioFields), ioTrueClass]
  TVipCustomer = class(TCustomer, IVipCustomer)
  private
    [ioVarchar(230, False)]
    FVipCardCode: String;
  protected
    procedure SetVipCardCode(AValue:String);
    function GetVipCardCode: String;
  public
    constructor Create(NewFirstName, NewLastName, NewFidelityCardCode, NewVipCardCode: String; NewID: Integer = 0); overload;
    property VipCardCode:String read GetVipCardCode write SetVipCardCode;
  end;

implementation

uses
  System.SysUtils, iORM.Containers.Factory, iORM;

{ TPerson }

constructor TPerson.Create(NewFirstName, NewLastName: String; NewID: Integer);
begin
  inherited Create;
  FID := NewID;
  FFirstName := NewFirstName;
  FLastName := NewLastName;
end;

function TPerson.GetBirthDate: TDate;
begin
  Result := FBirthDate;
end;

function TPerson.GetBirthTime: TTime;
begin
  Result := FBirthTime;
end;

function TPerson.GetClassNameProp: String;
begin
  Result := Self.ClassName;
end;

function TPerson.GetFirstName: String;
begin
  Result := FFirstName;
end;

function TPerson.GetFloatField: Double;
begin
  Result := FFloatField;
end;

function TPerson.GetFullName: String;
begin
 Result := (FirstName + ' ' + LastName).Trim;
end;

function TPerson.GetID: Integer;
begin
  Result := FID;
end;

function TPerson.GetIntegerField: Integer;
begin
  Result := FIntegerField;
end;

function TPerson.GetLastName: String;
begin
  Result := FLastName;
end;

function TPerson.GetLastUpdate: TDateTime;
begin
  Result := FLastUpdate;
end;

function TPerson.GetPhones: IioList<IPhoneNumber>;
begin
  Result := FPhones;
end;

function TPerson.GetPhoto: String;
begin
  Result := FPhoto;
end;

function TPerson.GetSalary: Currency;
begin
  Result := FSalary;
end;

procedure TPerson.SetBirthDate(const Value: TDate);
begin
  FBirthDate := Value;
end;

procedure TPerson.SetBirthTime(const Value: TTime);
begin
  FBirthTime := Value;
end;

procedure TPerson.SetFirstName(AValue: String);
begin
  FFirstName := AValue;
end;

procedure TPerson.SetFloatField(const Value: Double);
begin
  FFloatField := Value;
end;

procedure TPerson.SetID(AValue: Integer);
begin
  FID := AValue;
end;

procedure TPerson.SetIntegerField(const Value: Integer);
begin
  FIntegerField := Value;
end;

procedure TPerson.SetLastName(AValue: String);
begin
  FLastName := AValue;
end;

procedure TPerson.SetLastUpdate(const Value: TDateTime);
begin
  FLastUpdate := Value;
end;

procedure TPerson.SetPhones(AValue: IioList<IPhoneNumber>);
begin
  FPhones := AValue;
end;

procedure TPerson.SetPhoto(const Value: String);
begin
  FPhoto := Value;
end;

procedure TPerson.SetSalary(const Value: Currency);
begin
  FSalary := Value;
end;

{ TEmployee }

constructor TEmployee.Create(NewFirstName, NewLastName, NewBranchOffice: String;
  NewID: Integer);
begin
  inherited Create(NewFirstName, NewLastName);
  FBranchOffice := NewBranchOffice;
end;

function TEmployee.GetBranchOffice: String;
begin
  result := FBranchOffice;
end;

procedure TEmployee.SetBranchOffice(AValue: String);
begin
  FBranchOffice := AValue;
end;

{ TCustomer }

constructor TCustomer.Create(NewFirstName, NewLastName,
  NewFidelityCardCode: String; NewID: Integer);
begin
  inherited Create(NewFirstName, NewLastName);
  FFidelityCardCode := NewFidelityCardCode;
end;

function TCustomer.GetFidelityCardCode: String;
begin
  Result := FFidelityCardCode;
end;

procedure TCustomer.SetFidelityCardCode(AValue: String);
begin
  FFidelityCardCode := AValue;
end;

{ TVipCustomer }

constructor TVipCustomer.Create(NewFirstName, NewLastName,
  NewFidelityCardCode, NewVipCardCode: String; NewID: Integer);
begin
  inherited Create(NewFirstName, NewLastName, NewFidelityCardCode);
  FVipCardCode := NewVipCardCode;
end;

{ TPhoneNumbers }

constructor TPhoneNumber.Create(NewPhoneType, NewPhoneNumber: String;
  NewPersonID, NewID: Integer);
begin
  inherited Create;
  FPersonID := NewPersonID;
  FPhoneType := NewPhoneType;
  FPhoneNumber := NewPhoneNumber;
end;


function TVipCustomer.GetVipCardCode: String;
begin
  Result := FVipCardCode;
end;

procedure TVipCustomer.SetVipCardCode(AValue: String);
begin
  FVipCardCode := AValue;
end;

destructor TPhoneNumber.Destroy;
begin

  inherited;
end;

function TPhoneNumber.GetID: Integer;
begin
  Result := FID;
end;

function TPhoneNumber.GetPersonID: Integer;
begin
  Result := FPersonID;
end;

function TPhoneNumber.GetPhoneNumber: String;
begin
  Result := FPhoneNumber;
end;

function TPhoneNumber.GetPhoneType: String;
begin
  Result := FPhoneType;
end;

procedure TPhoneNumber.SetID(AValue: Integer);
begin
  FID := AValue;
end;

procedure TPhoneNumber.SetPersonID(AValue: Integer);
begin
  FPersonID := AValue;
end;

procedure TPhoneNumber.SetPhoneNumber(AValue: String);
begin
  FPhoneNumber := AValue;
end;

procedure TPhoneNumber.SetPhoneType(AValue: String);
begin
  FPhoneType := AValue;
end;

end.
