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
    property ID: Integer read FID write FID;
    property Description: String read FDescription write FDescription;
    property Price: Currency read FPrice write FPrice;
  end;

implementation

end.
