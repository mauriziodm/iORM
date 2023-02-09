unit Model.Pizza;

interface

uses
// "ioFMX" is defined in project options to indicate that it is a firemonkey project (Project | Options | Delphi Compiler | Conditional defines).
// Note: You need to build your project (Project | Build <ProjectName> or Shift + F9) for the changes to take effect.
{$IFDEF ioFMX}
  Fmx.Graphics,
{$ELSE}
  Vcl.Graphics,
{$IFEND}
  iORM, Model.Interfaces, Model.BaseBO, DJSON.Attributes;

type

  [ioEntity('PIZZAS')]
  TPizza = class(TBaseBO, IPizza)
  private
    FName: String;
    FPrice: Currency;
    [djSkip]
    FImage: TBitmap;
    procedure SetName(const AValue: String);
    procedure SetPrice(const AValue: Currency);
    function GetName: String;
    function GetPrice: Currency;
    function GetImage: TBitmap;
  public
    constructor Create; overload;
    constructor Create(const AName: String; const APrice: Currency; const AImageFileName: String); overload;
    constructor Create(const AName: String; const APrice: Currency); overload;
    destructor Destroy; override;
    property Name: String read GetName write SetName;
    property Price: Currency read GetPrice write SetPrice;
    property Image: TBitmap read GetImage;
  end;


implementation

{ TPizza }

constructor TPizza.Create;
begin
  inherited;
  FImage := TBitmap.Create;
end;

constructor TPizza.Create(const AName: String; const APrice: Currency; const AImageFileName: String);
begin
  Create;
  FName := AName;
  FPrice := APrice;
  FImage.LoadFromFile(AImageFileName);
end;

constructor TPizza.Create(const AName: String; const APrice: Currency);
begin
  Create;
  FName := AName;
  FPrice := APrice;
end;

destructor TPizza.Destroy;
begin
  FImage.Free;
  inherited;
end;

function TPizza.GetImage: TBitmap;
begin
  Result := FImage;
end;

function TPizza.GetName: String;
begin
  Result := FName;
end;

function TPizza.GetPrice: Currency;
begin
  Result := FPrice;
end;

procedure TPizza.SetName(const AValue: String);
begin
  FName := AValue;
end;

procedure TPizza.SetPrice(const AValue: Currency);
begin
  FPrice := AValue;
end;

end.
