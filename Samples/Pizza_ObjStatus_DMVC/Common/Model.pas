unit Model;

interface

uses
  iORM.Attributes, FMX.Graphics, System.SysUtils, iORM.CommonTypes, ObjMapper.Attributes;

type

  [ioEntity('PIZZE')]
  TPizza = class
  private
    FName: String;
    [MapperStreamable]
    FImg: TBitmap;
    FID: Integer;
    FObjectStatus: TioObjectStatus;
    procedure SetImg(const Value: TBitmap);
  public
    constructor Create;
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Name:String read FName write FName;
    property Img:TBitmap read FImg write SetImg;
    property ObjStatus: TioObjectStatus read FObjectStatus write FObjectStatus;
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

procedure TPizza.SetImg(const Value: TBitmap);
begin
  if Value = FImg then Exit;
  if Assigned(FImg) then FreeAndNil(FImg);
  FImg := Value;
end;

end.
