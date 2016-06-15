unit Model;

interface

uses
  iORM.Attributes, FMX.Graphics, System.SysUtils, iORM.CommonTypes;

type

  [ioTable('PIZZE')]
  TPizza = class
  private
    FName: String;
    FImg: TBitmap;
    FID: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Name:String read FName write FName;
    property Img:TBitmap read FImg write FImg;
  end;

implementation

{ TPizza }

constructor TPizza.Create;
begin
  inherited;
  FImg := TBitmap.Create;
end;

destructor TPizza.Destroy;
begin
  FImg.Free;
  inherited;
end;

end.
