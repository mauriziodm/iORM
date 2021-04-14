unit FormTipiOreDipendenti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelBase, ExtCtrls, bmpPanel, cxStyles,
  cxGraphics, cxEdit, DB,
  cxDBData, cxTextEdit, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, StdCtrls, IB_Components, IBODataset,
  cxCustomData, cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TTipiOreDipendentiForm = class(TModelBaseForm)
    QryS1: TIBOQuery;
    SourceS1: TDataSource;
    QryS2: TIBOQuery;
    SourceS2: TDataSource;
    QryS3: TIBOQuery;
    SourceS3: TDataSource;
    PanelSottocantieri: TPanel;
    LabelPanelSottopraticheCaption: TLabel;
    Bevel10: TBevel;
    GridS1: TcxGrid;
    tvS1: TcxGridDBTableView;
    tvS1DESCRIZIONE: TcxGridDBColumn;
    lvS1: TcxGridLevel;
    GridS2: TcxGrid;
    tvS2: TcxGridDBTableView;
    tvS2DESCRIZIONE: TcxGridDBColumn;
    lvS2: TcxGridLevel;
    GridS3: TcxGrid;
    tvS3: TcxGridDBTableView;
    tvS3DESCRIZIONE: TcxGridDBColumn;
    lvS3: TcxGridLevel;
    QryS1DESCRIZIONE: TStringField;
    QryS1TIPO: TStringField;
    QryS2DESCRIZIONE: TStringField;
    QryS2TIPO: TStringField;
    QryS3DESCRIZIONE: TStringField;
    QryS3TIPO: TStringField;
    tvS1TIPO: TcxGridDBColumn;
    tvS2TIPO: TcxGridDBColumn;
    tvS3TIPO: TcxGridDBColumn;
    procedure RxSpeedButtonUscitaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxSpeedModificaClick(Sender: TObject);
    procedure tvS1CustomDrawColumnHeader(Sender: TcxGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
      var ADone: Boolean);
    procedure tvS1CustomDrawGroupCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableCellViewInfo;
      var ADone: Boolean);
    procedure tvS1CustomDrawPartBackground(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxCustomGridCellViewInfo;
      var ADone: Boolean);
    procedure QryS1BeforePost(DataSet: TDataSet);
    procedure QryS2BeforePost(DataSet: TDataSet);
    procedure QryS3BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QryS1BeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TipiOreDipendentiForm: TTipiOreDipendentiForm;

implementation

uses main, DataModule1;

{$R *.dfm}

procedure TTipiOreDipendentiForm.RxSpeedButtonUscitaClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TTipiOreDipendentiForm.FormShow(Sender: TObject);
begin
  inherited;
  QryS1.Open;
  QryS2.Open;
  QryS3.Open;
end;

procedure TTipiOreDipendentiForm.RxSpeedModificaClick(Sender: TObject);
var
   MR:TModalResult;
begin
     inherited;
     // A seconda che il tasto sia abbassato o meno svolge la funzione di
     //  attivare la modifica dei campi o disabilitarla.
     if RxSpeedModifica.Down then begin
       // Tenta di abilitare la modifica dell'archivio; se non ci riesce rimette
       //  tutto a posto.
       try
          // Aggiunge un livello di bloccaggio dell'IconaDocTipo per disabilitare il MainMenu
          MainForm.BloccaIconaDocTipo(True, Name);
          RxSpeedButtonUscita.Enabled        := False;
          // Sposta il focus sul primo campo editabile
          GridS2.SetFocus;
          GridS1.SetFocus;
          // Visualizza le griglie dei sottocantieri in modalità di etiding
          tvS1.Styles.Background   := DM1.tvBackgroundModifica;
          tvS1.Styles.ContentEven  := DM1.tvContentEvenModifica;
          tvS1.Styles.ContentOdd   := DM1.tvContentOddModifica;
          tvS2.Styles.Background   := DM1.tvBackgroundModifica;
          tvS2.Styles.ContentEven  := DM1.tvContentEvenModifica;
          tvS2.Styles.ContentOdd   := DM1.tvContentOddModifica;
          tvS3.Styles.Background   := DM1.tvBackgroundModifica;
          tvS3.Styles.ContentEven  := DM1.tvContentEvenModifica;
          tvS3.Styles.ContentOdd   := DM1.tvContentOddModifica;
          // Rende editabili le griglie dei sottocantiero
          DM1.GridEdit(tvS1, True);
          DM1.GridEdit(tvS2, True);
          DM1.GridEdit(tvS3, True);
          // Se il focus è su una griglia di sottocantiere abilita i pulsanti di
          //  modifica elimina
          if GridS1.Focused or GridS2.Focused or GridS3.Focused then begin
            RxSpeedButtonNuovo.Enabled := True;
            RxSpeedButtonElimina.Enabled := True;
          end;
          // Avvia la transazione
          DM1.DBAzienda.StartTransaction;
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
          // Chiede di confermare le modifiche o di annullare l'operazione
          MR := DM1.ConfermaModifiche;
          if MR = mrYes then begin
               // Eseguq il commit
               DM1.DBAzienda.Commit;
          end else if MR = mrNo then begin
               // Esegue il Rollback
               DM1.DBAzienda.RollBack;
          end else begin
               RxSpeedModifica.Down := True;
               Exit;
          end;
          // Toglie un livello di bloccaggio dell'IconaDocTipo per riabilitare il MainMenu
          MainForm.BloccaIconaDocTipo(False, Name);
          RxSpeedButtonUscita.Enabled        := True;
          // Visualizza le griglie dei sottocantieri come NON editabili
          tvS1.Styles.Background  := DM1.tvBackground;
          tvS1.Styles.ContentEven := DM1.tvContentEven;
          tvS1.Styles.ContentOdd  := DM1.tvContentOdd;
          tvS2.Styles.Background  := DM1.tvBackground;
          tvS2.Styles.ContentEven := DM1.tvContentEven;
          tvS2.Styles.ContentOdd  := DM1.tvContentOdd;
          tvS3.Styles.Background  := DM1.tvBackground;
          tvS3.Styles.ContentEven := DM1.tvContentEven;
          tvS3.Styles.ContentOdd  := DM1.tvContentOdd;
          // Rende NON editabili le griglie dei sottocantiero
          DM1.GridEdit(tvS1, False);
          DM1.GridEdit(tvS2, False);
          DM1.GridEdit(tvS3, False);
          // Disabilita i pulsanti nuovo e elimina usati per i sottocantieri
          RxSpeedButtonNuovo.Enabled := False;
          RxSpeedButtonElimina.Enabled := False;
       except
          on E: Exception do begin
               MessageBeep(0);
               MessageDlg(E.Message, mtError, [mbOK], 0);
               RxSpeedModifica.Down := True;
          end;
       end;
     end;
end;

procedure TTipiOreDipendentiForm.tvS1CustomDrawColumnHeader(
  Sender: TcxGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawColumnHeader(Sender, ACanvas, AViewInfo, ADone);
end;

procedure TTipiOreDipendentiForm.tvS1CustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawGroupCell(Sender, ACanvas, AViewInfo, ADone, '');
end;

procedure TTipiOreDipendentiForm.tvS1CustomDrawPartBackground(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxCustomGridCellViewInfo; var ADone: Boolean);
begin
  inherited;
   // Richiama la gestione predefinita dell'evento
   DM1.QGridCustomDrawPartBackground((Sender as TcxGridTableView), ACanvas, AViewInfo, ADone);
end;

procedure TTipiOreDipendentiForm.QryS1BeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if DM1.Messaggi('Elimina', 'Eliminare la voce selezionata?', '', [mbYes, mbNo], 0, nil) <> mrYes then
    Abort;
end;

procedure TTipiOreDipendentiForm.QryS1BeforePost(DataSet: TDataSet);
begin
  inherited;
  QryS1TIPO.Value := 'OREDIP1';
end;

procedure TTipiOreDipendentiForm.QryS2BeforePost(DataSet: TDataSet);
begin
  inherited;
  QryS2TIPO.Value := 'OREDIP2';
end;

procedure TTipiOreDipendentiForm.QryS3BeforePost(DataSet: TDataSet);
begin
  inherited;
  QryS3TIPO.Value := 'OREDIP3';
end;

procedure TTipiOreDipendentiForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipiOreDipendentiForm := nil;
  // Il pulsante Impostazioni deve tornare NON PREMUTO
  //  NB: Questa riga l'ho messa perchè penso che questo tipo di form
  //       verrà usato solo per form che fanno parte delle impostazioni
  MainForm.SBImpostazioni.Down := False;
end;

end.
