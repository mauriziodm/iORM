unit Model;

interface

uses
  Vcl.Graphics, DJSON.Attributes, System.Rtti;

type

  TPizza = class
  private
    FID: Integer;
    FName: string;
    [djType(TypeInfo(String))]  // Not necessary if TypeAnnotations are enabled
    FAnyTypeValue: TValue;
    FImage: TBitmap;
  public
    constructor Create;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Name:String read FName write FName;
    [djType(TypeInfo(String))]  // Not necessary if TypeAnnotations are enabled
    property AnyTypeValue: TValue read FAnyTypeValue write FAnyTypeValue;
    property Image:TBitmap read FImage write FImage;
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
  Inherited;
end;

end.
