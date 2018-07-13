unit Model;

interface

uses iORM.Attributes, System.Generics.Collections;

type

  [ioEntity('Phones')]
  TPhoneNumber = class
  private
    FPhoneNumber: String;
    FPhoneType: String;
    FPersonID: Integer;
    FID: Integer;
  public
    constructor Create(NewPhoneType, NewPhoneNumber: String; NewPersonID: Integer; NewID: Integer = 0); overload;
    property ID: Integer read FID write FID;
    property PersonID:Integer read FPersonID write FPersonID;
    property PhoneType:String read FPhoneType write FPhoneType;
    property PhoneNumber:String read FPhoneNumber write FPhoneNumber;
  end;

  [ioEntity('Persons')]
  TPerson = class
  private
    FID: Integer;
    FLastName: String;
    FFirstName: String;
    FPhones: TObjectList<TPhoneNumber>;
  protected
    function GetFullName: String;
  public
    constructor Create; overload;
    constructor Create(NewFirstName, NewLastName: String; NewID: Integer = 0); overload;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property FirstName:String read FFirstName write FFirstName;
    property LastName:String read FLastName write FLastName;
    [ioHasMany(TPhoneNumber, 'PersonID')]
    property Phones:TObjectList<TPhoneNumber> read FPhones write FPhones;
    [ioSkip]
    property FullName:String read GetFullName;
  end;

implementation

uses
  System.SysUtils;

{ TPerson }

constructor TPerson.Create;
begin
  inherited;
  FPhones := TObjectList<TPhoneNumber>.Create;
end;

constructor TPerson.Create(NewFirstName, NewLastName: String; NewID: Integer);
begin
  Self.Create;
  FID := NewID;
  FFirstName := NewFirstName;
  FLastName := NewLastName;
end;

destructor TPerson.Destroy;
begin
  FPhones.Free;
  inherited;
end;

function TPerson.GetFullName: String;
begin
 Result := (FirstName + ' ' + LastName).Trim;
end;

{ TPhoneNumber }

constructor TPhoneNumber.Create(NewPhoneType, NewPhoneNumber: String;
  NewPersonID, NewID: Integer);
begin
  inherited Create;
  FPersonID := NewPersonID;
  FPhoneType := NewPhoneType;
  FPhoneNumber := NewPhoneNumber;
end;

end.
