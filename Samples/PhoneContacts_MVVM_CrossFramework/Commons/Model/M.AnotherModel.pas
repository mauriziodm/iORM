unit M.AnotherModel;

interface

uses
  iORM.Containers.Interfaces, iORM.Attributes, M.Interfaces;

type

  [ioTable('OtherPersons'), diImplements(IPerson, 'Another'), ioKeyGenerator('PERSONS'), ioTrueClass]
  TAnotherPerson = class(TInterfacedObject, IPerson)
  private
    FID: Integer;
    FLastName: String;
    FFirstName: String;
    FPhones: IioList<IPhoneNumber>;
  protected
    procedure SetID(AValue:Integer);
    function GetID: Integer;
    procedure SetFirstName(AValue:String);
    function GetFirstName: String;
    procedure SetLastName(AValue:String);
    function GetLastName: String;
    procedure SetPhones(AValue:IioList<IPhoneNumber>);
    function GetPhones: IioList<IPhoneNumber>;
    function GetFullName: String;
    function GetClassNameProp: String;
  public
    constructor Create; overload;
    constructor Create(NewFirstName, NewLastName: String; NewID: Integer = 0); overload;
    destructor Destroy; override;
    property ID:Integer read GetID write SetID;
    property FirstName:String read GetFirstName write SetFirstName;
    property LastName:String read GetLastName write SetLastName;
    [ioEmbeddedHasMany('IPhoneNumber')][ioTypeAlias('Another')]
    property Phones:IioList<IPhoneNumber> read GetPhones write SetPhones;
    [ioSkip]
    property FullName:String read GetFullName;
    [ioSkip]
    property ClassNameProp:String read GetClassNameProp;
  end;


implementation

uses
  iORM, SysUtils;

{ TAnotherPerson }

constructor TAnotherPerson.Create;
begin
  inherited;
  FPhones := io.di.Locate<IioList<IPhoneNumber>>.Alias('Another').Get;
end;

constructor TAnotherPerson.Create(NewFirstName, NewLastName: String; NewID: Integer);
begin
  Self.Create;
  FID := NewID;
  FFirstName := NewFirstName;
  FLastName := NewLastName;
end;

destructor TAnotherPerson.Destroy;
begin
//  if Assigned(FPhones) then FPhones.Free;
  inherited;
end;

function TAnotherPerson.GetClassNameProp: String;
begin
  Result := Self.ClassName + ' (Another)';
end;

function TAnotherPerson.GetFirstName: String;
begin
  Result := FFirstName;
end;

function TAnotherPerson.GetFullName: String;
begin
 Result := (LastName + ' ' + FirstName).Trim;
end;

function TAnotherPerson.GetID: Integer;
begin
  Result := FID;
end;

function TAnotherPerson.GetLastName: String;
begin
  Result := FLastName;
end;

function TAnotherPerson.GetPhones: IioList<IPhoneNumber>;
begin
  Result := FPhones;
end;

procedure TAnotherPerson.SetFirstName(AValue: String);
begin
  FFirstName := AValue;
end;

procedure TAnotherPerson.SetID(AValue: Integer);
begin
  FID := AValue;
end;

procedure TAnotherPerson.SetLastName(AValue: String);
begin
  FLastName := AValue;
end;

procedure TAnotherPerson.SetPhones(AValue: IioList<IPhoneNumber>);
begin
  FPhones := AValue;
end;

end.
