unit FormGC_CreaFattura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, Buttons, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TGC_CreaFatturaForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    eTipoRicarico: TcxRadioGroup;
    Panel1: TPanel;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GC_CreaFatturaForm: TGC_CreaFatturaForm;

implementation

{$R *.dfm}

end.
