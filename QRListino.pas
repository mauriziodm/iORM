unit QRListino;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, DB, IBODataset, 
  grimgctrl;

type
  TListinoQR = class(TQuickRep)
    QryArt: TIBOQuery;
    QRBandArticoli: TQRBand;
    QRLabelCodice: TQRLabel;
    QRDBTextCodiceArticolo: TQRDBText;
    QryPA: TIBOQuery;
    QRBandHeader1: TQRBand;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBTextGruppo3: TQRDBText;
    QRDBTextGruppo4: TQRDBText;
    QRDBTextGruppo5: TQRDBText;
    Gruppo6: TQRGroup;
    Gruppo1e2: TQRGroup;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    Gruppo3: TQRGroup;
    Gruppo4: TQRGroup;
    Gruppo5: TQRGroup;
    QRLabelPrezzo: TQRLabel;
    QRDBTextPrezzo: TQRDBText;
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
    QryArtGRUPPO1: TStringField;
    QryArtGRUPPO2: TStringField;
    QryArtGRUPPO3: TStringField;
    QryArtGRUPPO4: TStringField;
    QryArtGRUPPO5: TStringField;
    QryArtGRUPPO6: TStringField;
    QRLabelConfezione: TQRLabel;
    QRDBTextConfezione: TQRDBText;
    QRLabelClasse: TQRLabel;
    QRDBTextClasse: TQRDBText;
    QRLabelCodiceFornitore: TQRLabel;
    QRDBTextCodiceFornitore: TQRDBText;
    QryArtCODICEFORNITORE: TStringField;
    PhotoArt: TQRGrImage;
    QRGrImageLogoAzienda: TQRGrImage;
    QRShapeGruppo3: TQRPDFShape;
    QRShapeGruppo4: TQRPDFShape;
    QRShapeGruppo5: TQRPDFShape;
    QRMemoDescrizione: TQRMemo;
    QRShapeArt: TQRPDFShape;
    QRShapeLinea3: TQRPDFShape;
    QRShapeLinea4: TQRPDFShape;
    QRShapeLinea5: TQRPDFShape;
    QRShapeCodice: TQRPDFShape;
    QRShapePrezzo: TQRPDFShape;
    QryArtBARCODE: TStringField;
    QRGrImage1: TQRGrImage;
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
    QRBandPiede: TQRBand;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRSysData1: TQRSysData;
    QryArtDS: TDataSource;
    procedure WinControlForm_1Close(Sender: TObject;
      var Action: TCloseAction);
    procedure QRBandArticoliAfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo6BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure Gruppo3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo4AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure Gruppo5AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure QRBandArticoliBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
     LastAvailableSpace: Integer;
     SaltoPagina: Boolean;
     // Flags che indicano se la prossima riga di articoli debba o meno
     //  visualizzare anche i gruppi.
     PrintGroup3, PrintGroup4, PrintGroup5: Boolean;
  public
     BM: TBitMap;
     procedure DoPDFExport;
  end;

var
  ListinoQR: TListinoQR;

implementation

uses JPeg, QRPDFFilt, Dialogs;

{$R *.DFM}

procedure TListinoQR.DoPDFExport;
var
    aPDFFilt : TQRPDFDocumentFilter;
begin
   aPDFFilt := TQRPDFDocumentFilter.Create('c:\Listino.pdf');
   try
      // set filter properties
      aPDFFilt.TextOnTop := true;
      aPDFFilt.LeftMargin := -10;
//      aPDFFilt.AddFontMap( 'Bookman-Old-Style:Times' );
      ListinoQR.ExportToFilter( aPDFFilt );
   finally
      aPDFFilt.free;
   end;
end;

procedure TListinoQR.WinControlForm_1Close(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TListinoQR.QRBandArticoliAfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   PhotoArt.Enabled := False;
   QryPA.Close;
end;

procedure TListinoQR.Gruppo6BeforePrint(Sender: TQRCustomBand; var PrintBand: Boolean);
var
   bs: TStream;
   Pic: TJPEGImage;
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
         // Field "image" is jpeg stored in database
         bs := QryPA.CreateBlobStream(QryPA.FieldByName('JPEG'), bmRead);
         try
            Pic.LoadFromStream(bS);     // Load jpeg from stream into Pic.
            PhotoArt.Enabled := True;
            PhotoArt.Picture.BitMap.Assign(Pic);
         finally
            bs.Free;
         end;
      end;
   finally
      Pic.Free;
      BM.Free;
   end;
   // ==========================================================================
end;

procedure TListinoQR.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
   // Inizializza le query
   QryPA.Close;
   QryArt.Open;
   // Inizializza la posizione e il dimensionamento di alcuni elementi
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
   QryEmptyIndex.ExecSQL;
   QryEmptyIndexForn.ExecSQL;
end;

procedure TListinoQR.Gruppo3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Forza la stampa del gruppo attuale
   PrintGroup3 := True;
   // ==========================================================================
   // Aggiorna la tabella dell'indice
   // --------------------------------------------------------------------------
   if not QryInsertIndice.Prepared then QryInsertIndice.Prepare;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO1').Value      := QryArtCODICEGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO2').Value      := QryArtCODICEGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO1').Value := QryArtGRUPPO1.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO2').Value := QryArtGRUPPO2.Value;
   QryInsertIndice.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndice.Params.ParamByName('P_PAGINA').Value             := Sender.ParentReport.PageNumber;
   QryInsertIndice.ExecSQL;
   // ==========================================================================
end;

procedure TListinoQR.Gruppo4AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Forza la stampa del gruppo attuale
   PrintGroup4 := True;
   // ==========================================================================
   // Aggiorna la tabella dell'indice fornitori
   // --------------------------------------------------------------------------
   if not QryInsertIndiceForn.Prepared then QryInsertIndiceForn.Prepare;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO3').Value      := QryArtCODICEGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_CODICEGRUPPO4').Value      := QryArtCODICEGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO3').Value := QryArtGRUPPO3.Value;
   QryInsertIndiceForn.Params.ParamByName('P_DESCRIZIONEGRUPPO4').Value := QryArtGRUPPO4.Value;
   QryInsertIndiceForn.Params.ParamByName('P_PAGINA').Value             := Sender.ParentReport.PageNumber;
   QryInsertIndiceForn.ExecSQL;
   // ==========================================================================
end;

procedure TListinoQR.Gruppo5AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
   // Forza la stampa del gruppo attuale
   PrintGroup5 := True;
end;

procedure TListinoQR.QRBandArticoliBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var
   YY: Integer;
begin
   // Inizializzazione
   YY := 0;
   // Se è appena stato stampato un gruppo oppure si deve stampare
   //  la fotografia dell'articolo, disegna una riga orizzontale a tutta
   //  larghezza, altrimenti con Left = al Left della Label del codice articolo
   if PrintGroup3 or PrintGroup4 or PrintGroup5 or PhotoArt.Enabled then begin
      QRShapeArt.Width := QRBandArticoli.Width;
      QRShapeArt.Left  := 0;
   end else begin
      QRShapeArt.Width := QRBandArticoli.Width - QRLabelCodice.Left;
      QRShapeArt.Left  := QRLabelCodice.Left;
   end;
   // IN base ai flags appositi decide se stampare i gruppi o meno.
   if PrintGroup3 then begin
      PrintGroup3 := False;
      QRShapeLinea3.Enabled := True;
      QRShapeGruppo3.Enabled := True;
      QRDBTextGruppo3.Enabled := True;
      QRShapeLinea3.Top := YY;
//      Inc(YY, 1);
      QRShapeGruppo3.Top := YY;
      Inc(YY, 1);
      QRDBTextGruppo3.Top := YY+1;
      Inc(YY, QRDBTextGruppo3.Height);
   end else begin
      QRShapeLinea3.Enabled := False;
      QRShapeGruppo3.Enabled := False;
      QRDBTextGruppo3.Enabled := False;
   end;
   if PrintGroup4 then begin
      PrintGroup4 := False;
      QRShapeLinea4.Enabled := True;
      QRShapeGruppo4.Enabled := True;
      QRDBTextGruppo4.Enabled := True;
      QRShapeLinea4.Top := YY;
//      Inc(YY, 1);
      QRShapeGruppo4.Top := YY;
      Inc(YY, 1);
      QRDBTextGruppo4.Top := YY+1;
      Inc(YY, QRDBTextGruppo4.Height);
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
      QRDBTextGruppo5.Top := YY+1;
      Inc(YY, QRDBTextGruppo5.Height);
   end else begin
      QRShapeLinea5.Enabled := False;
      QRShapeGruppo5.Enabled := False;
      QRDBTextGruppo5.Enabled := False;
   end;
   // Poi posiziona i dati dell'articolo
   QRShapeArt.Top := YY;

   Inc(YY, 2);

   PhotoArt.Top := YY;

   Inc(YY, 4);

   // Prende i dati per il memo compatibile con il filtro PDF dal campo
   QRMemoDescrizione.Lines.Text := QryArtDescrizione.AsString;

//   QRBarcode.Top := YY;
   QRShapeCodice.Top := YY;
   QRLabelCodice.Top := YY;
   QRDBTextCodiceArticolo.Top := YY;
   QRMemoDescrizione.Top := YY;
   QRShapePrezzo.Top := YY;
   QRLabelPrezzo.Top := YY;
   QRDBTextPrezzo.Top := YY;

   Inc(YY, (QRLabelCodice.Height + 1));

   QRLabelCodiceFornitore.Top := YY;
   QRDBTextCodiceFornitore.Top := YY + 1;
   QRLabelConfezione.Top := YY;
   QRDBTextConfezione.Top := YY;
   QRLabelClasse.Top := YY;
   QRDBTextClasse.Top := YY;

   Inc(YY, (QRLabelCodiceFornitore.Height + 1));

   // Poi se è un rigo di cui stampare la foto, aumenta la dimensione verticale della banda
   //  dell'articolo corrente
   if PhotoArt.Enabled then begin
      QRBandArticoli.Height := PhotoArt.Top + PhotoArt.Height + 1;
   end else begin
      QRBandArticoli.Height := YY + 5;
   end;

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
     SaltoPagina     := False;
   end else begin
     SaltoPagina     := False;
   end;
   // ==========================================================================
end;

end.
