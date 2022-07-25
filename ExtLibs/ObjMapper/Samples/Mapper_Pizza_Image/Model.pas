unit Model;

interface

uses
  Vcl.Graphics, ObjMapper.Attributes, System.Rtti;

type

  TPizza = class
  private
    FID: Integer;
    FName: string;
    FAnyTypeValue: TValue;
    [MapperStreamable]
    FImage: TBitmap;
  public
    constructor Create;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Name:String read FName write FName;
    property AnyTypeValue: TValue read FAnyTypeValue write FAnyTypeValue;
    [MapperStreamable]
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
