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
  iORM, Model.Interfaces;

type

  [ioEntity]
  TPizza = class(TInterfacedObject, IPizza)
  private
    FID: Integer;
    FName: String;
    FPrice: Currency;
    FImage: TBitmap;
    // ID property
    function GetID: Integer;
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    // Price property
    procedure SetPrice(const AValue: Currency);
    function GetPrice: Currency;
    // Image property
    function GetImage: TBitmap;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read GetID;  // ReadOnly
    property Name: String read GetName write SetName;
    property Price: Currency read GetPrice write SetPrice;
    property Image: TBitmap read GetImage; // ReadOnly
  end;

implementation

{ TPizza }

constructor TPizza.Create;
begin
  inherited;
  FImage := TBitmap.Create;
end;

destructor TPizza.Destroy;
begin
  FImage.Free;
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
