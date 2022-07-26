unit Model;

interface

uses
  System.Classes, System.SysUtils,
  System.Generics.Collections, DJSON.Attributes, System.JSON, Serializers;

type

  [djSerializerDOM(TPhoneNumberCustomSerializerDOM)]  // Or register the custom serializer in a IomParams object or direct in the command
  [djSerializerJDO(TPhoneNumberCustomSerializerJDO)]  // Or register the custom serializer in a IomParams object or direct in the command
  [djSerializerStream(TPhoneNumberCustomSerializerStream)]  // Or register the custom serializer in a IomParams object or direct in the command
  TPhoneNumber = class
  private
    FID: Integer;
    FMasterID: Integer;
    FNumber: String;
  public
    constructor Create(AID:Integer; ANumero:String; AMasterID:Integer); overload;
    property ID: Integer read FID write FID;
    property Number:String read FNumber write FNumber;
    property MasterID:Integer read FMasterID write FMasterID;
  end;

  TPerson = class
  private
    FID: Integer;
    FName: String;
    FNote: TStringList;
    FPhoneNumbers: TObjectList<TPhoneNumber>;
    FGender: Char;
    FAge: Byte;
    FNumberOfFriends: Word;
    FBirthPlace: String;
    FBirthDate: TDate;
    FBirthTime: TTime;
    FLastEdit: TDateTime;
  public
    constructor Create; overload;
    constructor Create(AID:Integer; ADescrizione:String); overload;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Name:String read FName write FName;
    property Gender:Char read FGender write FGender;
    property NumberOfFriends:Word read FNumberOfFriends write FNumberOfFriends;
    property Age:Byte read FAge write FAge;
    property BirthPlace: String read FBirthPlace write FBirthPlace;
    property BirthDate: TDate read FBirthDate write FBirthDate;
    property BirthTime: TTime read FBirthTime write FBirthTime;
    property LastEdit:TDateTime read FLastEdit write FLastEdit;
    property PhoneNumbers:TObjectList<TPhoneNumber> read FPhoneNumbers;
    property Note: TStringList read FNote;
  end;

implementation


{ TMyClass }

constructor TPerson.Create(AID:Integer; ADescrizione:String);
begin
  Self.Create;
  FID := AID;
  FName := ADescrizione;
end;

constructor TPerson.Create;
begin
  inherited;
  FPhoneNumbers := TObjectList<TPhoneNumber>.Create;
  FNote := TStringList.Create;
end;

destructor TPerson.Destroy;
begin
  FNote.Free;
  FPhoneNumbers.Free;
  inherited;
end;

{ TNumTel }

constructor TPhoneNumber.Create(AID: Integer; ANumero: String; AMasterID: Integer);
begin
  inherited Create;
  FID := AID;
  FNumber := ANumero;
  FMasterID := AMasterID;
end;

end.
