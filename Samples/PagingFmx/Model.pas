unit Model;

interface

uses
  iORM.Attributes;

type

  [ioEntity]
  TArticle = class
  private
    FID: Integer;
    FDescription: String;
    FPrice: Currency;
  public
    constructor Create;
    property ID: Integer read FID write FID;
    property Description: String read FDescription write FDescription;
    property Price: Currency read FPrice write FPrice;
  end;

implementation

uses
  Winapi.Windows;

{ TArticle }

constructor TArticle.Create;
begin
//  Sleep(10);
end;

end.
