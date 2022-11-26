unit Form.ViewContext;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge,
  iORM.StdActions.CloseQueryRepeater;

type
  TFormViewContext = class(TForm)
    ioCloseQueryRepeater1: TioCloseQueryRepeater;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TFormViewContext.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

end.
