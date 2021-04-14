unit FormConfermaPrescrizFatta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, Buttons,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxCustomData, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TConfermaPrescrizFattaForm = class(TForm)
    cxLabel1: TcxLabel;
    fData: TcxDateEdit;
    Label1: TLabel;
    fNota: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    BtnSI: TBitBtn;
    BtnNO: TBitBtn;
    procedure BtnSIClick(Sender: TObject);
    procedure BtnNOClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    RI: Integer;
    DC: TcxCustomDataController;
    Index_ItemFatto, Index_ItemFattoData, Index_ItemFattoNote: Integer;
  end;

var
  ConfermaPrescrizFattaForm: TConfermaPrescrizFattaForm;

implementation

uses DateUtils, cxDataUtils;

{$R *.dfm}

{ TConfermaPrescrizFattaForm }


procedure TConfermaPrescrizFattaForm.BtnSIClick(Sender: TObject);
begin
  // Salva i dati sulla griglia delle prescrizioni
  DC.Values[RI,Index_ItemFatto] := True;
  DC.Values[RI,Index_ItemFattoData] := fData.Date;
  DC.Values[RI,Index_ItemFattoNote] := fNota.Text;
  // Chiude la form
  Close;
end;

procedure TConfermaPrescrizFattaForm.BtnNOClick(Sender: TObject);
begin
  // Annulla la risoluzione della prescrizione
  DC.Values[RI,Index_ItemFatto] := False;
  // Chiude la form
  Close;
end;

procedure TConfermaPrescrizFattaForm.FormShow(Sender: TObject);
begin
  // Carica la data se c'è (di solito non c'è)
  if (not VarIsNull(DC.Values[RI,Index_ItemFattoData])) and (DC.Values[RI,Index_ItemFattoData] <> 0) then
    fData.Date := DC.Values[RI,Index_ItemFattoData]
  else
    fData.Date := Today;
  // Carica la nota se c'è (di solito non c'è)
  fNota.Text := DC.DisplayTexts[RI,Index_ItemFattoNote];
  // Focus
  fData.SetFocus;
end;

end.

