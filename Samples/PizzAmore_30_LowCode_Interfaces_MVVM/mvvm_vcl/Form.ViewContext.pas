unit Form.ViewContext;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.StdActions.CloseQueryRepeater;

type
  TViewContextForm = class(TForm)
    ioCloseQueryRepeater1: TioCloseQueryRepeater;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
