unit FormConformWizard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelWizard, Buttons, StdCtrls, cxPC, cxControls,
  ExtCtrls, bmpPanel, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, ComCtrls, IB_Components, cxListBox,
  cxPCdxBarPopupMenu, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TConformWizardForm = class(TModelWizardForm)
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
    Label1: TLabel;
    Panel1: TPanel;
    BtnAvanti2: TSpeedButton;
    Panel2: TPanel;
    SpeedButton2: TSpeedButton;
    Label2: TLabel;
    Panel4: TPanel;
    SpeedButton4: TSpeedButton;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    RichEdit1: TRichEdit;
    Label139: TLabel;
    RichEdit2: TRichEdit;
    RichEdit3: TRichEdit;
    RichEdit4: TRichEdit;
    LabelTipoImpiantoSelezionato: TcxLabel;
    Panel5: TPanel;
    SpeedButton3: TSpeedButton;
    CBTipoImpianto: TcxListBox;
    ListBoxTimer: TTimer;
    procedure BtnAvanti1Click(Sender: TObject);
    procedure CBTipoImpiantoPropertiesInitPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CBTipoImpiantoDblClick(Sender: TObject);
    procedure ListBoxTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConformWizardForm: TConformWizardForm;

implementation

uses FormConformita, main, SchedaClienti, DataModule1, StrUtils;

{$R *.dfm}

procedure TConformWizardForm.BtnAvanti1Click(Sender: TObject);
begin
  case Self.WizardPageControl.ActivePageIndex  of
    1: begin
      if Trim(LeftStr(CBTipoImpianto.Items[CBTipoImpianto.ItemIndex], 100)) <> ''
      then LabelTipoImpiantoSelezionato.Caption := Trim(LeftStr(CBTipoImpianto.Items[CBTipoImpianto.ItemIndex], 100))
      else begin
        DM1.Messaggi('Creazione guidata Dichiarazione di Conformità', 'Per continuare è necessario selezionare un tipo di impianto.', '', [mbOk], 0, nil);
        Exit;
      end;
    end;
    // Se la pagina attuale è quella finale avvia la form della Conformità
    2: begin
      Application.CreateForm(TConformitaForm, ConformitaForm);
      ConformitaForm.Parent := MainForm;
      ConformitaForm.CodiceCliente  := ClientiForm.ClienteCorrente;
      ConformitaForm.CodicePratica  := ClientiForm.PraticaCorrente;
      ConformitaForm.DataPratica    := ClientiForm.DataPraticaCorrente;
      ConformitaForm.CodiceModello  := StrToInt(DM1.ExpArtToCodice(Trim(CBTipoImpianto.Items[CBTipoImpianto.ItemIndex])));
      ConformitaForm.Tag := 2;
      ConformitaForm.Show;
      // Chiude se stessa
      Self.Close;
    end;
  end;
  inherited;
end;

procedure TConformWizardForm.CBTipoImpiantoPropertiesInitPopup(
  Sender: TObject);
var
   Qry : TIB_Cursor;
   Sep: String;
begin
   Sep := DupeString(' ', 200);
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT CODICE, DESCMODELLO FROM CONFORM WHERE CODICE < 0 AND DATA = ''01/01/1900''');
      Qry.Open;
      with ((Sender as TcxComboBox).Properties as TcxComboBoxProperties) do begin
        Items.Clear;
        Items.Add('');
        while not Qry.Eof do begin
           Items.Add(Qry.FieldByName('DESCMODELLO').AsString + Sep + '{' + Qry.FieldByName('CODICE').AsString + '}');
           Qry.Next;
        end;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TConformWizardForm.FormShow(Sender: TObject);
var
   Qry : TIB_Cursor;
   Sep: String;
begin
  inherited;
   Sep := DupeString(' ', 130);
   // Carica l'elenco dei costruttori
   Qry := TIB_Cursor.Create(Self);
   try
      Qry.DatabaseName := DM1.ArcDBFile;
      Qry.IB_Connection := DM1.DBAzienda;
      Qry.SQL.Add('SELECT CODICE, DESCMODELLO FROM CONFORM WHERE CODICE < -1 AND DATA = ''01/01/1900'' AND DESCMODELLO IS NOT NULL');
      Qry.Open;
      with CBTipoImpianto do begin
        Items.Clear;
        Items.Add('ALTRO' + Sep + '{0}');
        while not Qry.Eof do begin
           Items.Add(Qry.FieldByName('DESCMODELLO').AsString + Sep + '{' + Qry.FieldByName('CODICE').AsString + '}');
           Qry.Next;
        end;
      end;
   finally
      Qry.Free;
   end;
end;

procedure TConformWizardForm.CBTipoImpiantoDblClick(Sender: TObject);
begin
  inherited;
  BtnAvanti1Click(BtnAvanti1);
end;

procedure TConformWizardForm.ListBoxTimerTimer(Sender: TObject);
begin
  inherited;
  BtnAvanti2.Enabled := CBTipoIMpianto.ItemIndex >= 0;
end;

end.
