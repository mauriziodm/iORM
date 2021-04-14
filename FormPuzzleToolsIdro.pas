unit FormPuzzleToolsIdro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormPuzzleTools, ImgList, cxContainer, cxEdit,
  IB_Components, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  dxNavBar, cxPC, cxControls, ExtCtrls, bmpPanel, cxCurrencyEdit,
  cxGraphics, cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses;

type
  TPuzzleToolsIdroForm = class(TPuzzleToolsForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PuzzleToolsIdroForm: TPuzzleToolsIdroForm;

implementation

{$R *.dfm}

procedure TPuzzleToolsIdroForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PuzzleToolsIdroForm := nil;
end;

end.
