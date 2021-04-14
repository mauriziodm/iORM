unit QRListinoNoBarCode;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBODataset, 
  grimgctrl;

type
  TListinoNoBarCodeQR = class(TQuickRep)
    QRBandArticoli: TQRBand;
    QRShapePrezzo: TQRPDFShape;
    QRShapeCodice: TQRPDFShape;
    QRShapeGruppo3: TQRPDFShape;
    QRShapeGruppo4: TQRPDFShape;
    QRShapeGruppo5: TQRPDFShape;
    QRLabelCodice: TQRLabel;
    QRDBTextCodiceArticolo: TQRDBText;
    QRLabelPrezzo: TQRLabel;
    QRDBTextPrezzo: TQRDBText;
    QRLabelCodiceFornitore: TQRLabel;
    QRDBTextCodiceFornitore: TQRDBText;
    PhotoArt_Vecchio: TQRGrImage;
    QRDBTextGruppo3: TQRDBText;
    QRDBTextGruppo4: TQRDBText;
    QRDBTextGruppo5: TQRDBText;
    QRMemoDescrizione: TQRMemo;
    QRShapeArt: TQRPDFShape;
    QRShapeLinea3: TQRPDFShape;
    QRShapeLinea4: TQRPDFShape;
    QRShapeLinea5: TQRPDFShape;
    QRBandHeader1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRLogoTopLeft: TQRGrImage;
    QRLogoTopRight: TQRGrImage;
    Gruppo1e2: TQRGroup;
    QRLabel1: TQRLabel;
    Gruppo3: TQRGroup;
    QRLabel2: TQRLabel;
    Gruppo4: TQRGroup;
    QRLabel3: TQRLabel;
    Gruppo5: TQRGroup;
    QRLabel4: TQRLabel;
    Gruppo6: TQRGroup;
    QRLabel5: TQRLabel;
    QRBandPiede: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QryArt: TIBOQuery;
    QryArtCODICEARTICOLO: TStringField;
    QryArtDESCRIZIONE: TMemoField;
    QryArtCODICEPHOTOART: TStringField;
    QryArtCODICEGRUPPO1: TIntegerField;
    QryArtCODICEGRUPPO2: TIntegerField;
    QryArtCODICEGRUPPO3: TIntegerField;
    QryArtCODICEGRUPPO4: TIntegerField;
    QryArtCODICEGRUPPO5: TIntegerField;
    QryArtCODICEGRUPPO6: TIntegerField;
    QryArtPREZZODILISTINO: TIBOFloatField;
    QryArtCATEGORIA1: TStringField;
    QryArtJOLLY1: TStringField;
    QryArtCODICEFORNITORE: TStringField;
    QryArtGRUPPO1: TStringField;
    QryArtGRUPPO2: TStringField;
    QryArtGRUPPO3: TStringField;
    QryArtGRUPPO4: TStringField;
    QryArtGRUPPO5: TStringField;
    QryArtGRUPPO6: TStringField;
    QryArtBARCODE: TStringField;
    QryInsertIndice: TIBOQuery;
    StringField1: TStringField;
    MemoField1: TMemoField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    IBOFloatField1: TIBOFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    QryEmptyIndex: TIBOQuery;
    StringField13: TStringField;
    MemoField2: TMemoField;
    StringField14: TStringField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    IBOFloatField2: TIBOFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    QryInsertIndiceForn: TIBOQuery;
    StringField25: TStringField;
    MemoField3: TMemoField;
    StringField26: TStringField;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    IBOFloatField3: TIBOFloatField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    QryEmptyIndexForn: TIBOQuery;
    StringField37: TStringField;
    MemoField4: TMemoField;
    StringField38: TStringField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    IntegerField21: TIntegerField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    IBOFloatField4: TIBOFloatField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    QryPA: TIBOQuery;
    QRDBTextScorta: TQRDBText;
    QryArtPREFERITO: TStringField;
    PhotoArt: TQRImage;
    QryArtCATALOGO_ORD: TIntegerField;
    QryArtCATALOGO_ORD1: TIntegerField;
    QryArtCATALOGO_ORD2: TIntegerField;
    QryArtCATALOGO_ORD3: TIntegerField;
    QryArtCATALOGO_ORD4: TIntegerField;
    QryArtCATALOGO_ORD5: TIntegerField;
    QryArtCATALOGO_ORD6: TIntegerField;
    QRLabelUM: TQRLabel;
    QRDBTextUM: TQRDBText;
    QryArtUNITADIMISURA: TStringField;
    QRLabelNoteAsterisco: TQRLabel;
    QRLabelMarca: TQRLabel;
    QRDBTextMARCA: TQRDBText;
    QryArtMARCA: TStringField;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Gruppo3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBandArticoliAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandArticoliBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure WinControlForm_1Close(Sender: TObject;
      var Action: TCloseAction);
    procedure Gruppo1e2AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandHeader1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QuickRepAfterPrint(Sender: TObject);
  private
     LastAvailableSpace: Integer;
     SaltoPagina: Boolean;
     // Flags che indicano se la prossima riga di articoli debba o meno
     //  visualizzare anche i gruppi.
     PrintGroup3, PrintGroup4, PrintGroup5: Boolean;
     // Flag che se impostato a True provoca un salto pagina
     ForzaSaltoPagina: Boolean;
     // Variabili per tenere traccia dell'ultima interruzione di gruppo inserita
     //  nelle tabelle per la generazione automatica degli indici del catalogo
     PrecGroupForIndice, PrecGroupForIndiceFornitori: String;
     // Bitmaps per la stampa dei loghi
     BmpTopLeftLogo, BmpTopRightLogo: TBitmap;
    procedure AggiornaTabellaIndice;
    procedure AggiornaTabellaIndiceForn;
    function ConvCoord(Coord: Integer; Fattore: Extended): Integer;
  public
     BM: TBitMap;
     procedure DoPDFExport;
  end;

var
  ListinoNoBarCodeQR: TListinoNoBarCodeQR;

implementation

uses JPeg, QRPDFFilt, Dialogs, Types, DataModule1;

{$R *.DFM}

procedure TListinoNoBarCodeQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Inizializza le query
   QryPA.Close;
   QryArt.Open;
   // Inizializza la posizione e il dimensionamento di alcuni elementi
   ForzaSaltoPagina := False;
   SaltoPagina := False;
   LastAvailableSpace := 0;

   Gruppo1e2.Height := 0;
   Gruppo3.Height := 0;
   Gruppo4.Height := 0;
   Gruppo5.Height := 0;

   QRShapeLinea3.Height := 0;
   QRShapeLinea4.Height := 0;
   QRShapeLinea5.Height := 0;
   QRShapeArt.Height := 1;

   QRShapeLinea3.Left := 0;
   QRShapeLinea4.Left := 0;
   QRShapeLinea5.Left := 0;

   QRShapeGruppo3.Left := 0;
   QRShapeGruppo4.Left := 0;
   QRShapeGruppo5.Left := 0;
   QRShapeArt.Left := 0;

   QRShapeLinea3.Width := QRBandArticoli.Width;
   QRShapeLinea4.Width := QRBandArticoli.Width;
   QRShapeLinea5.Width := QRBandArticoli.Width;
   QRShapeGruppo3.Width := QRBandArticoli.Width;
   QRShapeGruppo4.Width := QRBandArticoli.Width;
   QRShapeGruppo5.Width := QRBandArticoli.Width;
   QRShapeArt.Width := QRBandArticoli.Width;

   // Svuota la tabella dell'indice
   PrecGroupForIndice           := '';
   PrecGroupForIndiceFornitori  := '';
   QryEmptyIndex.ExecSQL;
   QryEmptyIndexForn.ExecSQL;

   // Caricamento delle bitmaps per la stampa dei loghi
   if FileExists(DM1.ArcDir + 'CatalogoTopLeft.bmp') then begin
     BmpTopLeftLogo := TBitmap.Create;
     BmpTopLeftLogo.LoadFromFile(DM1.ArcDir + 'CatalogoTopLeft.bmp');
   end;
   if FileExists(DM1.ArcDir + 'CatalogoTopRight.bmp') then begin
     BmpTopRightLogo := TBitmap.Create;
     BmpTopRightLogo.LoadFromFile(DM1.ArcDir + 'CatalogoTopRight.bmp');
   end;
end;


// Procedura che aggiorna la tabella per la generazione degli indici del catalogo.
procedure TListinoNoBarCodeQR.AggiornaTabellaIndice;
var
   Pagina: Integer;
   CurrGroupForIndice: String;
begin
   // Calcola la stringa per il confronto con l'ultimo gruppo inserito nell'indice
   //  in questo modo evito di registrare più volte lo stesso gruppo
   CurrGroupForIndice := QryArtCODICEGRUPPO1.AsString + QryArtCODICEGRUPPO2.AsString + QryArtCODICEGRUPPO3.AsString + QryArtCATALOGO_ORD1.AsString + QryArtCATALOGO_ORD2.AsString + QryArtCATALOGO_ORD3.AsString;
   // Infatti aggiorna la tabella per l'indice solo se diverso dal giro precedente altrimenti
   //  significa che inseriremmo una seconda volta un gruppo già inserito.
   if CurrGroupForIndice = PrecGroupForIndice then Exit;
   // Aggiorna la variabile globale che tiene traccia quale gruppo è stato inserito per
   //  ultimo nella tabella degli indici per evitare inserimenti multipli.
   PrecGroupForIndice := CurrGroupForIndice;
   // ==========================================================================
   // Aggiorna la tabella dell'indice
   // --------------------------------------------------------------------------
   // Calcola la pagina giusta anche in base al fatto che sia stato forzato un salto pagina oppure no
   Pagina := Self.PageNumber;
   if SaltoPagina or SaltoPagina then begin
     inc(Pagina);
   end;
   // Prepara la query per l'inserimento del dato
   if not QryInsertIndice.Prepared then QryInsertIndice.Prepare;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO1').Value      := QryArtCODICEGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO2').Value      := QryArtCODICEGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD1').Value      := QryArtCATALOGO_ORD1.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD2').Value      := QryArtCATALOGO_ORD2.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD3').Value      := QryArtCATALOGO_ORD3.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO1').Value := QryArtGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO2').Value := QryArtGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_PAGINA').Value             := Pagina;
   QryInsertIndice.ExecSQL;
   // ==========================================================================
end;


// Procedura che aggiorna la tabella per la generazione degli indici del catalogo.
procedure TListinoNoBarCodeQR.AggiornaTabellaIndiceForn;
var
   Pagina: Integer;
   CurrGroupForIndiceFornitori: String;
begin
   // Calcola la stringa per il confronto con l'ultimo gruppo inserito nell'indice
   //  in questo modo evito di registrare più volte lo stesso gruppo
   CurrGroupForIndiceFornitori := QryArtCODICEGRUPPO3.AsString + QryArtCODICEGRUPPO4.AsString+ QryArtCATALOGO_ORD3.AsString + QryArtCATALOGO_ORD4.AsString;
   // Infatti aggiorna la tabella per l'indice solo se diverso dal giro precedente altrimenti
   //  significa che inseriremmo una seconda volta un gruppo già inserito.
   if CurrGroupForIndiceFornitori = PrecGroupForIndiceFornitori then Exit;
   // Aggiorna la variabile globale che tiene traccia quale gruppo è stato inserito per
   //  ultimo nella tabella degli indici per evitare inserimenti multipli.
   PrecGroupForIndiceFornitori := CurrGroupForIndiceFornitori;
   // ==========================================================================
   // Aggiorna la tabella dell'indice
   // --------------------------------------------------------------------------
   // Calcola la pagina giusta anche in base al fatto che sia stato forzato un salto pagina oppure no
   Pagina := Self.PageNumber;
   if SaltoPagina or SaltoPagina then inc(Pagina);
   // Prepara la query per l'inserimento del dato
   if not QryInsertIndice.Prepared then QryInsertIndice.Prepare;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO4').Value      := QryArtCODICEGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CATALOGO_ORD3').Value      := QryArtCATALOGO_ORD3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CATALOGO_ORD4').Value      := QryArtCATALOGO_ORD4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO4').Value := QryArtGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_PAGINA').Value             := Pagina;
   QryInsertIndiceForn.ExecSQL;
   // ==========================================================================
end;


procedure TListinoNoBarCodeQR.Gruppo3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
   Pagina: Integer;
begin
   // Forza la stampa del gruppo attuale
   PrintGroup3 := True;
   // Provoca un salto pagina
   ForzaSaltoPagina := True;

{
   // ==========================================================================
   // Aggiorna la tabella dell'indice
   // --------------------------------------------------------------------------
   // Calcola la pagina giusta anche in base al fatto che sia stato forzato un salto pagina oppure no
   Pagina := Sender.ParentReport.PageNumber;
   if ForzaSaltoPagina or SaltoPagina then inc(Pagina);
   // Prepara la query per l'inserimento del dato
   if not QryInsertIndice.Prepared then QryInsertIndice.Prepare;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO1').Value      := QryArtCODICEGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO2').Value      := QryArtCODICEGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD1').Value      := QryArtCATALOGO_ORD1.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD2').Value      := QryArtCATALOGO_ORD2.Value;
   QryInsertIndice.Params.ParamByName('P_CATALOGO_ORD3').Value      := QryArtCATALOGO_ORD3.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO1').Value := QryArtGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO2').Value := QryArtGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_PAGINA').Value             := Pagina;
   QryInsertIndice.ExecSQL;
   // ==========================================================================
}
end;

procedure TListinoNoBarCodeQR.Gruppo4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
var
   Pagina: Integer;
begin
   // Forza la stampa del gruppo attuale
   PrintGroup4 := True;
{
   // ==========================================================================
   // Aggiorna la tabella dell'indice fornitori
   // --------------------------------------------------------------------------
   // Calcola la pagina giusta anche in base al fatto che sia stato forzato un salto pagina oppure no
   Pagina := Sender.ParentReport.PageNumber;
   if ForzaSaltoPagina or SaltoPagina then inc(Pagina);
   // Prepara la query per l'inserimento del dato
   if not QryInsertIndiceForn.Prepared then QryInsertIndiceForn.Prepare;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO4').Value      := QryArtCODICEGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CATALOGO_ORD3').Value      := QryArtCATALOGO_ORD3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CATALOGO_ORD4').Value      := QryArtCATALOGO_ORD4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO4').Value := QryArtGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_PAGINA').Value             := Pagina;
   QryInsertIndiceForn.ExecSQL;
   // ==========================================================================
}
end;

procedure TListinoNoBarCodeQR.Gruppo5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Forza la stampa del gruppo attuale
   PrintGroup5 := True;
end;

procedure TListinoNoBarCodeQR.Gruppo6BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   bs: TStream;
   Pic: TJPEGImage;
   PrecWidth, PrecHeight: Integer;
begin
{
   // ==========================================================================
   // PARTE CHE CARICA LA FOTO IN BMP (Messa peril momento che uso le BMP)
   // --------------------------------------------------------------------------
   BM := TBitMap.Create;

   Sender.Height := 0;

   try
      PhotoArt.Enabled := False;

      QryPA.Close;
      QryPA.Params[0].AsString := QryArtCODICEPHOTOART.AsString;
      QryPA.Open;
      if QryPA.Fields[0].IsNull then begin
         QryPA.Close;
         Exit;
      end;

      if not QryPA.FieldByName('JPEG').IsNull then begin
         // Field "image" is jpeg stored in database
         bs := QryPA.CreateBlobStream(QryPA.FieldByName('JPEG'), bmRead);
         try
            BM.LoadFromStream(bS);     // Load BMP from stream into Pic.
            PhotoArt.Enabled := True;
            PhotoArt.Picture.BitMap.Assign(BM);
         finally
            bs.Free;
         end;
      end;
   finally
      BM.Free;
   end;
   // ==========================================================================

   // Esce quì perchè il resto è per ora disabilitato perchè al momento uso foto BMP
   Exit;
}
   // ==========================================================================
   // PARTE PER LA CONVERSIONE DELLA GOTO JPEG IN BMP PER LA STAMPA
   // --------------------------------------------------------------------------
   BM := TBitMap.Create;
   Pic := TJPEGImage.Create;

   Sender.Height := 0;

   try
      PhotoArt.Enabled := False;

      QryPA.Close;
      QryPA.Params[0].AsString := QryArtCODICEPHOTOART.AsString;
      QryPA.Open;
      if QryPA.Fields[0].IsNull then begin
         QryPA.Close;
         Exit;
      end;

      if not QryPA.FieldByName('JPEG').IsNull then begin
         try try
            // Field "image" is jpeg stored in database
            bs := QryPA.CreateBlobStream(QryPA.FieldByName('JPEG'), bmRead);
            // VECCHIO ---------------------------------------------------------
            {
            Pic.LoadFromStream(bS);     // Load jpeg from stream into Pic.
            PhotoArt.Enabled := True;
            PhotoArt.Picture.BitMap.Assign(Pic);
            }
            // VECCHIO ---------------------------------------------------------

//            Pic.Transparent := False;
            Pic.LoadFromStream(bS);     // Load jpeg from stream into Pic.
//            BM.Transparent := False;
            BM.Assign(Pic);
            PhotoArt.Enabled := True;
//            PhotoArt.Stretch := False;
//            PrecWidth := PhotoArt.Width;
//            PrecHeight := PhotoArt.Height;
//            PhotoArt.Picture.Bitmap.Transparent := False;
//            PhotoArt.Picture.Bitmap.Width := BM.Width;
//            PhotoArt.Picture.Bitmap.Height := BM.Height;
//            PhotoArt.Picture.Bitmap.Canvas.Draw(0, 0, BM);
//            PhotoArt.Stretch := True;
//            PhotoArt.Width := PrecWidth;
//            PhotoArt.Height := PrecHeight;
         except
           PhotoArt.Enabled := False;
           ShowMessage('Errore caricando: ' + QryPA.FieldByName('CODICE').AsString);
           raise;
         end;
         finally
            bs.Free;
         end;
      end;
   finally
      FreeAndNil(Pic);
//      FreeAndNil(BM);
   end;
   // ==========================================================================
end;

procedure TListinoNoBarCodeQR.QRBandArticoliAfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
   R, BR: TRect;
   XF, YF: Extended;
   PropIndex, NuovaDimensioneAltroAsse: Double;
   DimensioneAltroAsse: Integer;
begin
// -----------------------------------------------------------------------------
   // Se la foto deve essere stampata...
   if PhotoArt.Enabled then begin
     // Memorizza i fattori di conversione delle coordinate
     XF := Sender.ParentReport.QRPrinter.XFactor;
     YF := Sender.ParentReport.QRPrinter.YFactor;

     // ========================================================================
     // Calcola il TRect della zona su cui deve essere stampata la fotografia
     // ------------------------------------------------------------------------
     R.Left := Round(Sender.BoundsRect.Left / Screen.PixelsPerInch * 254 * XF);
     R.Top := Round(Sender.ParentReport.CurrentY * YF) - Round(PhotoArt.Height / Screen.PixelsPerInch * 254 * YF);
     R.Right := R.Left + Round(PhotoArt.Width / Screen.PixelsPerInch * 254 * XF);
     R.Bottom := R.Top + Round(PhotoArt.Height / Screen.PixelsPerInch * 254 * YF);
     // ========================================================================

     // ========================================================================
     // Effettua il ridimensionamento della figura mantenendo le proporzioni tra l'asse X è Y
     // ------------------------------------------------------------------------
     // Se l'asse più lungo è l'asse X...
     if BM.Width > BM.Height then begin

       // Calcola l'indice di proporzione tra i due assi
       PropIndex := BM.Width / BM.Height;
       // Calcola la dimensione dell'asse da correggere relativa al TRect
       DimensioneAltroAsse := R.Bottom - R.Top;
       // Calcola la correzione da applicare all'asse da correggere per mantenere la figura in proporzione
       NuovaDimensioneAltroAsse := DimensioneAltroAsse / PropIndex;
       // Calcola la nuova posizione sull'asse da correggere in modo che la figura rimanga centrata
       //  sempre rispetto all'asse da correggere.
       R.Top := R.Top + Trunc((DimensioneAltroAsse - NuovaDimensioneAltroAsse) / 2);
       // Imposta anche la nuova dimensione dell'asse
       R.Bottom := R.Top + Trunc(NuovaDimensioneAltroAsse) + 1;

     // Se invece l'asse più lungo è l'asse Y
     end else if BM.Width < BM.Height then begin

       // Calcola l'indice di proporzione tra i due assi
       PropIndex := BM.Height / BM.Width;
       // Calcola la dimensione dell'asse da correggere relativa al TRect
       DimensioneAltroAsse := R.Right - R.Left;
       // Calcola la correzione da applicare all'asse da correggere per mantenere la figura in proporzione
       NuovaDimensioneAltroAsse := DimensioneAltroAsse / PropIndex;
       // Calcola la nuova posizione sull'asse da correggere in modo che la figura rimanga centrata
       //  sempre rispetto all'asse da correggere.
       R.Left := R.Left + Trunc((DimensioneAltroAsse - NuovaDimensioneAltroAsse) / 2);
       // Imposta anche la nuova dimensione dell'asse
       R.Right := R.Left + Trunc(NuovaDimensioneAltroAsse) + 1;

     end;
     // ========================================================================

     // ========================================================================
     // Effettua il tracciamento
     // ------------------------------------------------------------------------
     Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, BM);
     // Distrugge la bitmap
     FreeAndNil(BM);
     // ========================================================================
   end;
// -----------------------------------------------------------------------------
   PhotoArt.Enabled := False;
   QryPA.Close;
end;

procedure TListinoNoBarCodeQR.QRBandArticoliBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
var
   YY: Integer;
   R: TRect;
begin
   // Se il Flag  ForzaSaltoPagina = True Provoca forzatamente un salto di pagina
   // prima della stampa dell'articolo attuale
   // NB: Però non esegue il salto pagina se si tratta del primo articolo
   //      della prima pagina.
   if ForzaSaltoPagina  and (not QryArt.Bof) then ListinoNoBarCodeQR.NewPage;
   ForzaSaltoPagina := False;

//   ShowMessage('Before Current Y:   ' + IntToStr(Sender.ParentReport.CurrentY));
   // Inizializzazione
   YY := 0;
   // Fa in modo che ci sia un piccolo spazion verticale bianco prima delle bande
   //  dei gruppi per questioni estetiche
//   if (PrintGroup3 or PrintGroup4 or PrintGroup5) and (not SaltoPagina) then Inc(YY, 3);
   if (PrintGroup3 or PrintGroup4 or PrintGroup5) then Inc(YY, 3);
   // Se è appena stato stampato un gruppo oppure si deve stampare
   //  la fotografia dell'articolo, disegna una riga orizzontale a tutta
   //  larghezza, altrimenti con Left = al Left della Label del codice articolo
   if PrintGroup3 or PrintGroup4 or PrintGroup5 or PhotoArt.Enabled then begin
      QRShapeArt.Width      := QRBandArticoli.Width;
      QRShapeArt.Left       := 0;
      QRShapeArt.Pen.Style  := psSolid;
   end else begin
      QRShapeArt.Width := QRBandArticoli.Width - QRLabelCodice.Left;
      QRShapeArt.Left  := QRLabelCodice.Left;
      QRShapeArt.Pen.Style  := psDot;
   end;
   // IN base ai flags appositi decide se stampare i gruppi o meno.
   if PrintGroup3 then begin
//      PrintGroup3 := False;  // NB: Spostato in fondo per problemi alla generazione degli indici
      QRShapeLinea3.Enabled := True;
      QRShapeGruppo3.Enabled := True;
      QRDBTextGruppo3.Enabled := True;
      QRShapeLinea3.Top := YY;
//      Inc(YY, 1);
      QRShapeGruppo3.Top := YY;
      Inc(YY, 1);
      QRDBTextGruppo3.Top := YY-2;
      Inc(YY, QRShapeGruppo3.Height-2);
   end else begin
      QRShapeLinea3.Enabled := False;
      QRShapeGruppo3.Enabled := False;
      QRDBTextGruppo3.Enabled := False;
   end;
   if PrintGroup4 then begin
//      PrintGroup4 := False;  // NB: Spostato in fondo per problemi alla generazione degli indici
      QRShapeLinea4.Enabled := True;
      QRShapeGruppo4.Enabled := True;
      QRDBTextGruppo4.Enabled := True;
      QRShapeLinea4.Top := YY;
//      Inc(YY, 1);
      QRShapeGruppo4.Top := YY;
      Inc(YY, 1);
      QRDBTextGruppo4.Top := YY-1;
      Inc(YY, QRShapeGruppo4.Height-2);
   end else begin
      QRShapeLinea4.Enabled := False;
      QRShapeGruppo4.Enabled := False;
      QRDBTextGruppo4.Enabled := False;
   end;
   if PrintGroup5 then begin
      PrintGroup5 := False;
      QRShapeLinea5.Enabled := True;
      QRShapeGruppo5.Enabled := True;
      QRDBTextGruppo5.Enabled := True;
      QRShapeLinea5.Top := YY;
//      Inc(YY, 1);
      QRShapeGruppo5.Top := YY;
      Inc(YY, 1);
      QRDBTextGruppo5.Top := YY-1;
      Inc(YY, QRShapeGruppo5.Height-2);
   end else begin
      QRShapeLinea5.Enabled := False;
      QRShapeGruppo5.Enabled := False;
      QRDBTextGruppo5.Enabled := False;
   end;

   // Poi posiziona i dati dell'articolo
   QRShapeArt.Top := YY;

   Inc(YY, 1);

   PhotoArt.Top := YY;

   Inc(YY, 0);

   // Prende i dati per il memo compatibile con il filtro PDF dal campo
   QRMemoDescrizione.Lines.Text := QryArtDescrizione.AsString;

{
   // Posiziona i dati anagrafici dell'articolo corrente
   QRShapeCodice.Top := YY;
   QRLabelCodice.Top := YY;
   QRDBTextCodiceArticolo.Top := YY;
   QRMemoDescrizione.Top := YY;
   QRShapePrezzo.Top := YY;
   QRLabelPrezzo.Top := YY;
   QRDBTextPrezzo.Top := YY;
   QRLabelCodiceFornitore.Top := YY;
   QRDBTextCodiceFornitore.Top := YY + 1;
   QRDBTextScorta.Top := YY-1;
}

   Inc(YY, (QRLabelCodiceFornitore.Height + 1));

   // Poi se è un rigo di cui stampare la foto, aumenta la dimensione verticale della banda
   //  dell'articolo corrente
   if PhotoArt.Enabled then begin
      QRBandArticoli.Height := PhotoArt.Top + PhotoArt.Height + 1;
   end else begin
      QRBandArticoli.Height := YY + 2;
   end;

   YY := QRBandArticoli.Height - QRDBTextCodiceArticolo.Height + 2;

   // Posiziona i dati anagrafici dell'articolo corrente
   QRShapeCodice.Top := YY;
   QRLabelCodice.Top := YY + 1;
   QRDBTextCodiceArticolo.Top := YY;
   QRMemoDescrizione.Top := YY;
   QRShapePrezzo.Top := YY;
   QRLabelPrezzo.Top := YY;
   QRDBTextPrezzo.Top := YY;
   QRLabelCodiceFornitore.Top := YY + 1;
   QRDBTextCodiceFornitore.Top := YY + 2;
   QRLabelUM.Top := YY + 1;
   QRDBTextUM.Top := YY;
   QRDBTextScorta.Top := YY-1;

   // Se non c'è il prezzo non ci deve essere nemmeno il simbolo dell'euro
   //  e nemmeno la fascia verde, al loro posto ci vogliono la marca
   if (not QryArtPREZZODILISTINO.IsNull) and (QryArtPREZZODILISTINO.Value <> 0) then begin
     QRLabelPrezzo.Enabled  := True;
     QRShapePrezzo.Enabled  := True;
     QRDBTextPrezzo.Enabled := True;
     QRDBTextScorta.Enabled := True;
     QRLabelNoteAsterisco.Enabled := True;
     QRLabelMarca.Enabled   := False;
     QRDBTextMARCA.Enabled  := False;
   end else begin
     QRLabelPrezzo.Enabled  := False;
     QRShapePrezzo.Enabled  := False;
     QRDBTextPrezzo.Enabled := False;
     QRDBTextScorta.Enabled := False;
     QRLabelNoteAsterisco.Enabled := False;
     QRLabelMarca.Top       := QRLabelPrezzo.Top;
     QRDBTextMARCA.Top      := QRDBTextPrezzo.Top;
     QRLabelMarca.Enabled   := True;
     QRDBTextMARCA.Enabled  := True;
   end;

   QRLabelPrezzo.Enabled := (not QryArtPREZZODILISTINO.IsNull) and (QryArtPREZZODILISTINO.Value <> 0);
   QRShapePrezzo.Enabled := QRLabelPrezzo.Enabled;

   // Fa in modo che gli sfondini del codice e del prezzo comincino dall'inizio fino alla fine
   QRShapeCodice.Top := QRShapeArt.Top;
   QRShapeCodice.Height := QRBandArticoli.Height - QRShapeArt.Top + 2;
   QRShapePrezzo.Top := QRShapeArt.Top;
   QRShapePrezzo.Height := QRBandArticoli.Height - QRShapeArt.Top + 2;

   //Fa in modo che le linee orizzontali finiscano con insieme allo sfondino del prezzo
   QRShapeLinea3.Width  := QRShapePrezzo.Left + QRShapePrezzo.Width;
   QRShapeLinea4.Width  := QRShapeLinea3.Width;
   QRShapeLinea5.Width  := QRShapeLinea3.Width;
   QRShapeGruppo3.Width := QRShapeLinea3.Width;
   QRShapeGruppo4.Width := QRShapeLinea3.Width;
   QRShapeGruppo5.Width := QRShapeLinea3.Width;
   QRShapeArt.Width     := QRShapeLinea3.Width - QRShapeArt.Left;

   // ==========================================================================
   // Parte per la gestione corretta del salto pagina perchè quando avevo messo
   //  l'abilitazione delle bande dei gruppi ad inizio pagina nell'evento OnStartPage
   //  non funzionava bene (agiva un articolo dopo).
   //  Così invece funziona bene
   // --------------------------------------------------------------------------
   LastAvailableSpace := (Sender.Owner as TQuickRep).AvailableSpace;
   if ((LastAvailableSpace - Round(Sender.Size.Height)) < 0) and (not SaltoPagina) then begin
     SaltoPagina     := True;
     PrintGroup3     := True;
     PrintGroup4     := True;
     PrintGroup5     := True;
     QRBandArticoliBeforePrint(Sender, PrintBand);
   end;
   // ==========================================================================
   // Aggiorna la tabella per la generazione degli indici del catalogo
   //  nel caso si debba stampare la relativa banda del titolo del gruppo
   //  NB: Sono arrivato a questa posizione dopo molti tentativi e molti problemi
   //      adesos funziona ed evitare di spostarla
   if PrintGroup3 then begin
     AggiornaTabellaIndice;
     PrintGroup3 := False;
   end;
   if PrintGroup4 then begin
     AggiornaTabellaIndiceForn;
     PrintGroup4 := False;
   end;
   SaltoPagina     := False;
   // Disabilita la stampa dell'asterisco alla DX se il valore non è
   //  un asterisco altrimenti per la toscana venivano tutte 'F'
   QRDBTextScorta.Enabled := (QRDBTextScorta.DataSet.FieldByName(QRDBTextScorta.DataField).AsString = '*');
end;

procedure TListinoNoBarCodeQR.DoPDFExport;
var
    aPDFFilt : TQRPDFDocumentFilter;
begin
   aPDFFilt := TQRPDFDocumentFilter.Create('c:\Listino.pdf');
   try
      // set filter properties
      aPDFFilt.TextOnTop := true;
      aPDFFilt.LeftMargin := -10;
//      aPDFFilt.AddFontMap( 'Bookman-Old-Style:Times' );
      ListinoNoBarCodeQR.ExportToFilter( aPDFFilt );
   finally
      aPDFFilt.free;
   end;
end;

procedure TListinoNoBarCodeQR.WinControlForm_1Close(Sender: TObject;
  var Action: TCloseAction);
begin
  ListinoNoBarCodeQR := nil;
end;

procedure TListinoNoBarCodeQR.Gruppo1e2AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Provoca un salto pagina
   ForzaSaltoPagina := True;
end;

// Funzione che converte le posizioni/dimensioni dei componenti per il tracciamento diretto delle immagini
//  sul canvas della pagina da stampare. Fatto per risolvere il problema della stampa dei quadrati neri
function TListinoNoBarCodeQR.ConvCoord(Coord:Integer; Fattore:Extended): Integer;
begin
  Result := Round(Coord / Screen.PixelsPerInch * 254 * Fattore);
end;

procedure TListinoNoBarCodeQR.QRBandHeader1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
var
   R: TRect;
   XF, YF: Extended;
   AltezzaLogo, LarghezzaLogo: Integer;
begin
  // Inizializzazione
  // Memorizza i fattori di conversione delle coordinate
  XF := Sender.ParentReport.QRPrinter.XFactor;
  YF := Sender.ParentReport.QRPrinter.YFactor;

  // ===========================================================================
  // TRACCIAMENTO LOGO SUPERIORE SINISTRO
  // ---------------------------------------------------------------------------
  // Ovviamente solo se è stata specificata una bitmap
  if Assigned(BmpTopLeftLogo) then begin
    // I loghi hanno un'altezza fissa di 50 pixels
    AltezzaLogo := 50;
    // Calcola la larghezza del logo in modo da adattarla alla pagina
    //  mantenendolo in proporzione.
    LarghezzaLogo := Trunc(BmpTopLeftLogo.Width * AltezzaLogo / BmpTopLeftLogo.Height);
    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left   := ConvCoord(QRBandHeader1.Left+QRLogoTopLeft.Left, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
    R.Top    := ConvCoord(QRBandHeader1.Top+QRLogoTopLeft.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
    R.Right  := R.Left + ConvCoord(LarghezzaLogo, XF);
    R.Bottom := R.Top + ConvCoord(AltezzaLogo, YF);
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, BmpTopLeftLogo);
  end;
  // ===========================================================================

  // ===========================================================================
  // TRACCIAMENTO LOGO SUPERIORE DESTRO
  // ---------------------------------------------------------------------------
  // Ovviamente solo se è stata specificata una bitmap
  if Assigned(BmpTopRightLogo) then begin
    // I loghi hanno un'altezza fissa di 50 pixels
    AltezzaLogo := 50;
    // Calcola la larghezza del logo in modo da adattarla alla pagina
    //  mantenendolo in proporzione.
    LarghezzaLogo := Trunc(BmpTopRightLogo.Width * AltezzaLogo / BmpTopRightLogo.Height);
    // Calcola il TRect della zona su cui deve essere stampata la fotografia
    R.Left   := ConvCoord(QRBandHeader1.Left+QRBandHeader1.Width-LarghezzaLogo-12, XF) - Round(Sender.ParentReport.QRPrinter.LeftWaste*XF);
    R.Top    := ConvCoord(QRBandHeader1.Top+QRLogoTopRight.Top, YF) - Round(Sender.ParentReport.QRPrinter.TopWaste*YF);
    R.Right  := R.Left + ConvCoord(LarghezzaLogo, XF);
    R.Bottom := R.Top + ConvCoord(AltezzaLogo, YF);
    // Effettua il tracciamento
    Sender.ParentReport.QRPrinter.Canvas.StretchDraw(R, BmpTopRightLogo);
  end;
  // ===========================================================================
end;

procedure TListinoNoBarCodeQR.QuickRepAfterPrint(Sender: TObject);
begin
  // Distrugge le bitmap per la stampa dei loghi
  if Assigned(BmpTopLeftLogo) then FreeAndNil(BmpTopLeftLogo);
  if Assigned(BmpTopRightLogo) then FreeAndNil(BmpTopRightLogo);
end;

end.
