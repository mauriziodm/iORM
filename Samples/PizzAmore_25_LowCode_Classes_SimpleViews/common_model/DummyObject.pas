unit DummyObject;

interface

uses
  iORM.Attributes

  ;


type
  [ioEntity('VERYLONGTABLENAME')]
  TDummyObject = class
  private
    FName: String;
    FID: Integer;
    [ioField('VeryVeryVeryLongPropertyName')]
    [ioIndex]
    FLongPropertyName: string;
  public
    property ID: Integer read FID write FID;
    property Name: String read FName write FName;
    property LongPropertyName: string read FLongPropertyName write FLongPropertyName;
  end;

implementation

end.
