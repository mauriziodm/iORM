unit FormPuzzleToolsGas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormPuzzleTools, ImgList, cxContainer, cxEdit,
  IB_Components, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLabel,
  dxNavBar, cxPC, cxControls, ExtCtrls, bmpPanel, cxCurrencyEdit,
  cxGraphics, cxPCdxBarPopupMenu, cxLookAndFeels, cxLookAndFeelPainters,
  cxClasses;

type
  TPuzzleToolsGasForm = class(TPuzzleToolsForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PuzzleToolsGasForm: TPuzzleToolsGasForm;

implementation

{$R *.dfm}

procedure TPuzzleToolsGasForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  PuzzleToolsGasForm := nil;
end;

end.
