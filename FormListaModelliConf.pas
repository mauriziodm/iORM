unit FormListaModelliConf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelLista, 
  cxEdit, DB, cxDBData, IBODataset, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, StdCtrls, ExtCtrls,
  bmpPanel, cxTextEdit, Buttons, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters,
  cxNavigator;

type
  TListaModelliConfForm = class(TModelListaForm)
    QCODICE: TIntegerField;
    QDESCMODELLO: TStringField;
    tvQCODICE: TcxGridDBColumn;
    tvQDESCMODELLO: TcxGridDBColumn;
    procedure RxSpeedButtonVisualizzaClick(Sender: TObject); Override;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxSpeedButtonNuovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ListaModelliConfForm: TListaModelliConfForm;

implementation

uses FormConformita, main, DataModule1;

{$R *.dfm}

procedure TListaModelliConfForm.RxSpeedButtonVisualizzaClick(
  Sender: TObject);
begin
  DM1.ShowWait(MainForm.NomeApplicazione, 'Apertura in corso...');
  try
    inherited;
    Application.CreateForm(TConformitaForm, ConformitaForm);
    ConformitaForm.Parent := MainForm;
    ConformitaForm.CodiceConformita := QCODICE.AsInteger;
    ConformitaForm.DataConformita := StrToDate('01/01/1900');
    ConformitaForm.IsDocModel := True;
    ConformitaForm.Tag := 1;
    ConformitaForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

procedure TListaModelliConfForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  // Il pulsante Impostazioni deve tornare NON PREMUTO
  MainForm.SBImpostazioni.Down := False;
  // Mette a nil il suo puntatore
  ListaModelliConfForm := nil;
end;

procedure TListaModelliConfForm.RxSpeedButtonNuovoClick(Sender: TObject);
begin
  DM1.ShowWait(MainForm.NomeApplicazione, 'Apertura in corso...');
  try
    inherited;
    Application.CreateForm(TConformitaForm, ConformitaForm);
    ConformitaForm.Parent := MainForm;
    ConformitaForm.IsDocModel := True;
    ConformitaForm.Tag := 2;
    ConformitaForm.Show;
  finally
    DM1.CloseWait;
  end;
end;

end.
