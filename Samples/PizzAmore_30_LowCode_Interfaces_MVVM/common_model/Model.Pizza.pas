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
  iORM, Model.Interfaces, DJSON.Attributes, ETM.Repository,
  System.Generics.Collections;

type

  [ioEntity('PIZZAS'), etmTrace(TEtmTimeSlot), ioConflictStrategy(TioSameVersionWin, csResolved)]
  TPizza = class(TInterfacedObject, IPizza)
  private
    FID: Integer;
    FName: String;
    FPrice: Currency;
    [ioSkip([ssETM])]
    FImage: TBitmap;
    FObjVersion: TioObjVersion;  // The ObjVersion is mandatory if you want to use the ETM, otherwise not
    FIngredients: TList<IPizzaIngredientRow>;
    function GetID: Integer;
    function GetImage: TBitmap;
    function GetIngredients: TList<IPizzaIngredientRow>;
    function GetName: String;
    function GetPrice: Currency;
    procedure SetName(const AValue: String);
    procedure SetPrice(const AValue: Currency);
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read GetID;
    property Name: String read GetName write SetName;
    property Price: Currency read GetPrice write SetPrice;
    property Image: TBitmap read GetImage;
    property Ingredients: TList<IPizzaIngredientRow> read GetIngredients;
  end;

implementation

{ TPizza }

constructor TPizza.Create;
begin
  inherited;
  FImage := TBitmap.Create;
  FIngredients := TList<IPizzaIngredientRow>.Create;
end;

destructor TPizza.Destroy;
begin
  FImage.Free;
  FIngredients.Free;
  inherited;
end;

function TPizza.GetID: Integer;
begin
  Result := FID;
end;

function TPizza.GetImage: TBitmap;
begin
  Result := FImage;
end;

function TPizza.GetIngredients: TList<IPizzaIngredientRow>;
begin
  Result := FIngredients;
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
