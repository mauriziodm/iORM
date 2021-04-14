unit FormSelezioneStato;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, cxStyles, Forms,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxTextEdit, cxMemo, cxCurrencyEdit, cxDropDownEdit, cxCheckBox,
  cxDBLookupComboBox, cxButtonEdit, DB, cxDBData, IBODataset, cxGridLevel,
  cxGridDBTableView, cxGridCardView, cxGridCustomTableView,
  cxGridTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, Buttons, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator,
  cxGridCustomLayoutView;

type
  TSelezioneStatoForm = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    QueryStatiDocumenti: TIBOQuery;
    SourceQueryStatiDocumenti: TDataSource;
    QueryStatiDocumentiDESCRIZIONE: TStringField;
    QueryStatiDocumentiTIPODOCUMENTO: TStringField;
    QueryStatiDocumentiFOREGROUND: TStringField;
    QueryStatiDocumentiBACKGROUND: TStringField;
    QueryStatiDocumentiNOTE: TStringField;
    QueryStatiDocumentiSINCHRO: TStringField;
    GridList: TcxGrid;
    tvList: TcxGridDBTableView;
    lvList: TcxGridLevel;
    tvListDESCRIZIONE: TcxGridDBColumn;
    tvListNOTE: TcxGridDBColumn;
    tvListTIPODOCUMENTO: TcxGridDBColumn;
    tvListFOREGROUND: TcxGridDBColumn;
    tvListBACKGROUND: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EseguiQueryStatiDocumenti;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tvListDblClick(Sender: TObject);
    procedure tvListKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvListCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);

    public
       // Contiene i riferimenti ai campi da modificare e il tipo di documento
       //  con cui filtrare gli stati.
       TipoDocumento : String;
       Tabella : TIBODataSet;
  end;

var
  SelezioneStatoForm: TSelezioneStatoForm;

implementation

uses DataModule1, main, SchedaClienti, SchedaTesti;

{$R *.DFM}



procedure TSelezioneStatoForm.EseguiQueryStatiDocumenti;
begin
   QueryStatiDocumenti.Close;
   QueryStatiDocumenti.SQL.Clear;
   QueryStatiDocumenti.SQL.Add('SELECT *');
   QueryStatiDocumenti.SQL.Add('FROM Stati');
   if TipoDocumento <> '' then begin
     QueryStatiDocumenti.SQL.Add('WHERE');
     QueryStatiDocumenti.SQL.Add('TipoDocumento = ''' + TipoDocumento + '''');
   end;
   if not QueryStatiDocumenti.Prepared then QueryStatiDocumenti.Prepare;
   QueryStatiDocumenti.Open;
end;




procedure TSelezioneStatoForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TSelezioneStatoForm.FormShow(Sender: TObject);
begin
   // Esegue la query che farà visualizzare solamente gli stati
   //  relativi al tipo di documento appropriato.
   EseguiQueryStatiDocumenti;
   GridList.SetFocus;
end;

procedure TSelezioneStatoForm.BitBtn1Click(Sender: TObject);
begin
   tvListDblClick(Self);
end;

procedure TSelezioneStatoForm.BitBtn2Click(Sender: TObject);
begin
   Close;
end;

procedure TSelezioneStatoForm.FormCreate(Sender: TObject);
begin
   // IMposta la caption della form in base al nome del programma impostato nella variabile 'NomeApplicazione'
   Caption := MainForm.NomeApplicazione + ' - (Stato documento)';
end;

procedure TSelezioneStatoForm.tvListDblClick(Sender: TObject);
begin
  // In base al chiamante...
  case Tag of
    // Chiamata senza indicare il chiamante (Tag) ma indicando il Dataset destinazione della selezione.
    0:begin
      // Assegna ai campi puntati dalle variabili globali i valori
      //  relativi allo stato selezionato.
      Tabella.FieldByName('StatoDescrizione').Value := QueryStatiDocumenti.FieldByName('Descrizione').Value;
      if QueryStatiDocumenti.FieldByName('TipoDocumento').AsString <> 'Scadenze' then begin
        Tabella.FieldByName('StatoForeground').Value  := QueryStatiDocumenti.FieldByName('Foreground').Value;
        Tabella.FieldByName('StatoBackground').Value  := QueryStatiDocumenti.FieldByName('Background').Value;
      end;
    end;
    // Cambio cumulativo dello stato dei documneti dall'ELENCO DOCUMENTI
    999:begin
      ClientiForm.SetStatoDocumentiSelezionati(QueryStatiDocumenti.FieldByName('Descrizione').Value);
    end;
    // Cambio cumulativo dello stato dei documneti dal GIORNALE DI MAGAZZINO
    998:begin
      ClientiForm.SetStatoDocumentiSelezionatiGM(QueryStatiDocumenti.FieldByName('Descrizione').Value);
    end;
    // Cambio cumulativo dello stato delle scadenze
    997:begin
      ClientiForm.SetStatoScadenzeSelezionate(QueryStatiDocumenti.FieldByName('Descrizione').Value);
    end;
    // Cambio cumulativo dello stato della primanota
    996:begin
      ClientiForm.SetStatoPrimenoteSelezionate(QueryStatiDocumenti.FieldByName('Descrizione').Value);
    end;
  end;
  Close;
end;

procedure TSelezioneStatoForm.tvListKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   // Se viene premuto il INVIO con il focus nella griglia
   //  è come se fosse stato fatto doppio click.
   if key = 13 then tvListDblClick(Self);
end;

procedure TSelezioneStatoForm.tvListCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
  Foreg, Backg: string;
begin
  Foreg := Trim(AViewInfo.GridRecord.DisplayTexts[tvListFOREGROUND.Index]);
  Backg := Trim(AViewInfo.GridRecord.DisplayTexts[tvListBACKGROUND.Index]);
  // Se non è il campo in highlight lo visualizza del colore appropriato in base
  //  allo stato, altrimenti lo fà visualizzare come di default.
  if not AViewInfo.GridRecord.Selected then begin
    if Foreg <> '' then ACanvas.Font.Color   := DM1.StrToColor(Foreg, clBlack);
    if Backg <> '' then ACanvas.Brush.Color  := DM1.StrToColor(Backg, clSilver);
  end;
end;

end.
