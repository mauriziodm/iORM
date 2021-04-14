unit SchedaDatiAzienda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ComCtrls, Mask,
  ExtCtrls, bmpPanel, Buttons, MAURI_SB, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxCurrencyEdit, cxCheckBox, cxCalendar, Vcl.ActnMan,
  Vcl.ActnColorMaps;

type
  TDatiAziendaForm = class(TForm)
    ClientTopPanel: TbmpPanel;
    ClientArea: TScrollBox;
    PanelGruppo1: TPanel;
    LabelGruppo1: TLabel;
    Label13: TLabel;
    Label1: TLabel;
    Label15: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label16: TLabel;
    Label4: TLabel;
    Label14: TLabel;
    RichEdit1: TRichEdit;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit17: TDBEdit;
    PanelGruppo2: TPanel;
    LabelGruppo2: TLabel;
    Label17: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    RichEdit2: TRichEdit;
    DBEdit7: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    PanelGruppo3: TPanel;
    LabelGruppo3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    RichEdit3: TRichEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    PanelGruppo4: TPanel;
    LabelGruppo4: TLabel;
    Label11: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label12: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    RichEdit4: TRichEdit;
    DBEdit2: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    PanelGruppo5: TPanel;
    LabelGruppo5: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    RichEdit5: TRichEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit31: TDBEdit;
    Label33: TLabel;
    DBEdit32: TDBEdit;
    PanelGruppo6: TPanel;
    LabelGruppo6: TLabel;
    Label35: TLabel;
    RichEdit6: TRichEdit;
    DBEdit34: TDBEdit;
    Label24: TLabel;
    DBEdit33: TDBEdit;
    Label34: TLabel;
    DBEdit35: TDBEdit;
    Label36: TLabel;
    DBEdit36: TDBEdit;
    Label37: TLabel;
    DBEdit37: TDBEdit;
    RxSpeedButtonResetQuery: TSpeedButton;
    RxSpeedButtonVisualizza: TSpeedButton;
    RxSpeedButtonUscita: TSpeedButton;
    RxSpeedModifica: TSpeedButton;
    RxSpeedButtonNuovo: TSpeedButton;
    RxSpeedButtonElimina: TSpeedButton;
    RxSpeedButtonTrova: TSpeedButton;
    RxSpeedButtonStampa: TSpeedButton;
    RxSpeedButtonHelp: TSpeedButton;
    RxSpeedButtonFax: TSpeedButton;
    RxSpeedButtonMail: TSpeedButton;
    Label38: TLabel;
    DBEdit38: TDBEdit;
    cxDBRadioGroup1: TcxDBRadioGroup;
    Label39: TLabel;
    PanelGruppo7: TPanel;
    LabelGruppo7: TLabel;
    RichEdit7: TRichEdit;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    Label40: TLabel;
    Label41: TLabel;
    DBEdit39: TDBEdit;
    Label42: TLabel;
    Label43: TLabel;
    DBEdit40: TDBEdit;
    Label45: TLabel;
    Label46: TLabel;
    Label44: TLabel;
    Label47: TLabel;
    DBEdit41: TDBEdit;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    Label51: TLabel;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    Label52: TLabel;
    Label54: TLabel;
    eDatiTrasmittente_Enabled: TcxDBCheckBox;
    PanelDatiTrasmittente: TPanel;
    Label53: TLabel;
    DBEdit42: TDBEdit;
    Label55: TLabel;
    Label56: TLabel;
    DBEdit43: TDBEdit;
    Label57: TLabel;
    DBEdit44: TDBEdit;
    Label58: TLabel;
    DBEdit45: TDBEdit;
    eTerzoIntermediario_Enabled: TcxDBCheckBox;
    Label59: TLabel;
    PanelTerzoIntermediario: TPanel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    Label65: TLabel;
    Label66: TLabel;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    Label67: TLabel;
    Label68: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    TipoPersona: TcxDBRadioGroup;
    Label69: TLabel;
    DBEdit52: TDBEdit;
    Label70: TLabel;
    DBEdit53: TDBEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    PanelGruppo9: TPanel;
    LabelGruppo9: TLabel;
    RichEdit8: TRichEdit;
    DBEdit56: TDBEdit;
    Label71: TLabel;
    Label72: TLabel;
    DBEdit54: TDBEdit;
    Label73: TLabel;
    DBEdit55: TDBEdit;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    Label77: TLabel;
    DBEdit60: TDBEdit;
    Label78: TLabel;
    DBEdit61: TDBEdit;
    Label79: TLabel;
    DBEdit62: TDBEdit;
    Label81: TLabel;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    cxDBCheckBox2: TcxDBCheckBox;
    Label80: TLabel;
    DBEdit65: TDBEdit;
    Label82: TLabel;
    Label83: TLabel;
    DBEdit66: TDBEdit;
    Label84: TLabel;
    DBEdit67: TDBEdit;
    Label85: TLabel;
    DBEdit68: TDBEdit;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    Label86: TLabel;
    DBEdit69: TDBEdit;
    DBEdit70: TDBEdit;
    Label87: TLabel;
    Label88: TLabel;
    DBEdit71: TDBEdit;
    XPColorMap1: TXPColorMap;
    PanelGruppo8: TPanel;
    LabelGruppo8: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    RichEdit9: TRichEdit;
    DBEdit72: TDBEdit;
    DBEdit73: TDBEdit;
    cxDBCheckBox5: TcxDBCheckBox;
    Label89: TLabel;
    Label92: TLabel;
    DBEdit74: TDBEdit;
    Label93: TLabel;
    DBEdit75: TDBEdit;
    Label94: TLabel;
    DBEdit76: TDBEdit;
    cxDBCheckBox6: TcxDBCheckBox;
    cxDBCheckBox7: TcxDBCheckBox;
    cxDBCheckBox8: TcxDBCheckBox;
    cxDBComboBox1: TcxDBComboBox;
    cxDBComboBox2: TcxDBComboBox;
    Label95: TLabel;
    Label96: TLabel;
    DBEdit77: TDBEdit;
    Label97: TLabel;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure RxSpeedButtonHelpClick(Sender: TObject);
    procedure eDatiTrasmittente_EnabledPropertiesChange(Sender: TObject);
    procedure eTerzoIntermediario_EnabledPropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DatiAziendaForm: TDatiAziendaForm;

implementation

uses DataModule1, main, FormHelp;

{$R *.DFM}

procedure TDatiAziendaForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
     Close;
end;

procedure TDatiAziendaForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     IF RxSpeedModifica.Down then
     begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Abilita la modifica dei campi
          DM1.TableDatiAzienda.Edit;
          RxSpeedButtonUscita.Enabled        := False;
          DM1.ColoraTuttiCampi(DatiAziendaForm, COLOR_MODIFICA);
          // Focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := False;
          end;
       end;
     end else begin
       // Gestisce l'eccezione nel caso qualche cosa vada storto
       try
          // Disabilita la modifica dei campi
          DM1.TableDatiAzienda.Edit;
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               DM1.TableDatiAzienda.Post;
          end else if MR = mrNo then begin
               DM1.TableDatiAzienda.Cancel;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;

          RxSpeedButtonUscita.Enabled        := True;
          DM1.ColoraTuttiCampi(DatiAziendaForm, COLOR_NORMALE);
          // Focus sul primo campo editabile
          DBEdit2.SetFocus;
          DBEdit1.SetFocus;
          // Copia i codici di attivazione del teletrasporto nel file
          //  Param.ini in modo che siano disponibili anche per
          // il Guardian
          DM1.CopiaCodiciAttivazionePerGuardian;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
               // Riabilita la modifica dei campi
               DM1.TableDatiAzienda.Edit;
          end;
       end;
     end;
end;

procedure TDatiAziendaForm.FormCreate(Sender: TObject);
begin
   // IMposta i settaggi di visualizzazione della form
   MainForm.CaricaTemaClientForm(Self, ClientTopPanel, RxSpeedButtonUscita, RxSpeedButtonHelp, RxSpeedModifica, RxSpeedButtonNuovo, RxSpeedButtonElimina, RxSpeedButtonTrova, RxSpeedButtonResetQuery, RxSpeedButtonStampa, RxSpeedButtonFax, RxSpeedButtonMail, RxSpeedButtonVisualizza);
   // Colore normale (non modifica) nei campi
   DM1.ColoraTuttiCampi(DatiAziendaForm, COLOR_NORMALE);
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Dati azienda)';
   // IMposta la posizione della client area e i relativi margini
   MainForm.CalcolaDimensioniClientAreaChildForm(Self, ClientArea, True);
   ClientArea.ParentColor := True;

   // Imposta i colori dei pannelli
   PanelGruppo1.Color := COLOR_SUBPANEL_BG;
   PanelGruppo2.Color := COLOR_SUBPANEL_BG;
   PanelGruppo3.Color := COLOR_SUBPANEL_BG;
   PanelGruppo4.Color := COLOR_SUBPANEL_BG;

   LabelGruppo1.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo2.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo3.Color := COLOR_SUBPANEL_STEP_BG;
   LabelGruppo4.Color := COLOR_SUBPANEL_STEP_BG;

   LabelGruppo1.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo2.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo3.Font.Color := COLOR_SUBPANEL_STEP_FONT;
   LabelGruppo4.Font.Color := COLOR_SUBPANEL_STEP_FONT;

   // Attiva/Disattiva i pannelli dei dati aggiuntivi per la fattura elettronica PA
   eDatiTrasmittente_EnabledPropertiesChange(nil);
   eTerzoIntermediario_EnabledPropertiesChange(nil);

   // Refresh della tabella
   DM1.TableDatiAzienda.Refresh;

   // Carica l'icona del tipo documento visualizzato
   // PER IL MOMENTO NON ESISTE UN'ICONA DELLA CONFORMITA
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Impostazioni');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);
end;

procedure TDatiAziendaForm.FormShow(Sender: TObject);
begin
     DM1.FocusRefresh;
end;

procedure TDatiAziendaForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of

      // ESC
      27 : begin
         if RxSpeedButtonUscita.Enabled then begin
            RxSpeedButtonUscitaClick(Self);
         end;
      end;

      // F2 = Modifica
      113: begin
         if RxSpeedModifica.Enabled then begin
            RxSpeedModifica.Down := not RxSpeedModifica.Down;
            RxSpeedModificaClick(Self);
         end;
      end;

   end;
end;

procedure TDatiAziendaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;

   // Rende invisibile la LabelTipoDocumento e il relativo pulsante
   // e ripristina la IconaDocTipo precedente
   //  Prima ovviamente sblocca l'IconaDocTipo
   MainForm.BloccaIconaDocTipo(False, Name);
   MainForm.RipristinaIconaDocTipo;
   
   // Il pulsante Impostazioni deve tornare NON PREMUTO
   MainForm.SBImpostazioni.Down := False;
   // Il puntatore alla form := nil
   DatiAziendaForm := nil;
end;

procedure TDatiAziendaForm.DBEdit1Enter(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlEnter(Sender);
end;

procedure TDatiAziendaForm.DBEdit1Exit(Sender: TObject);
begin
   // Se è in modalità di Modifica...
   if RxSpeedModifica.Down then DM1.ControlExit(Sender);
end;


procedure TDatiAziendaForm.eDatiTrasmittente_EnabledPropertiesChange(
  Sender: TObject);
begin
  PanelDatiTrasmittente.Visible := eDatiTrasmittente_Enabled.Checked;
end;

procedure TDatiAziendaForm.eTerzoIntermediario_EnabledPropertiesChange(
  Sender: TObject);
begin
  PanelTerzoIntermediario.Visible := eTerzoIntermediario_Enabled.Checked;
end;

procedure TDatiAziendaForm.RxSpeedButtonHelpClick(Sender: TObject);
begin
   HelpForm.Aiuto('DATI AZIENDA');
end;


end.
