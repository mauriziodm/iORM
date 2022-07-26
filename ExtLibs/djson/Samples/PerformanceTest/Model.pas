unit Model;

interface

uses
  System.Generics.Collections, System.JSON, DJSON.Attributes, ObjectsMappers;

type

  TPhoneNumber = class
  private
    FID: Integer;
    FMasterID: Integer;
    FNumero: String;
  public
    constructor Create(AID:Integer; ANumero:String; AMasterID:Integer); overload;
    property ID: Integer read FID write FID;
    property Numero:String read FNumero write FNumero;
    property MasterID:Integer read FMasterID write FMasterID;
  end;

  TPerson = class
  private
    FID: Integer;
    FDescrizione: String;
    FNumTel: TObjectList<TPhoneNumber>;
  public
    constructor Create; overload;
    constructor Create(AID:Integer; ADescrizione:String); overload;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Descrizione:String read FDescrizione write FDescrizione;
    [MapperItemsClassType(TPhoneNumber)]  // Only for DMVC compatibility
    property NumTel:TObjectList<TPhoneNumber> read FNumTel;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TMyClass }

constructor TPerson.Create(AID:Integer; ADescrizione:String);
begin
  Self.Create;
  FID := AID;
  FDescrizione := ADescrizione;
end;

constructor TPerson.Create;
begin
  inherited;
  FNumTel := TObjectList<TPhoneNumber>.Create;
end;

destructor TPerson.Destroy;
begin
  FNumTel.Free;
  inherited;
end;

{ TNumTel }

constructor TPhoneNumber.Create(AID: Integer; ANumero: String; AMasterID: Integer);
begin
  inherited Create;
  FID := AID;
  FNumero := ANumero;
  FMasterID := AMasterID;
end;

end.
