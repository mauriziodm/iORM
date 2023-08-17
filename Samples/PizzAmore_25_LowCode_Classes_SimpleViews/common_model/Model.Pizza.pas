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
  iORM, ETM.Repository;

type

  [ioEntity('PIZZAS'), etmTrace(TEtmRepository)]
  TPizza = class
  private
    FID: Integer;
    FName: String;
    FPrice: Currency;
    FImage: TBitmap;
    FObjVersion: TioObjVersion;
  public
    constructor Create;
    destructor Destroy; override;
    property ID: Integer read FID; // ReadOnly
    property Name: String read FName write FName;
    property Price: Currency read FPrice write FPrice;
    property Image: TBitmap read FImage; // ReadOnly
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

end.
