unit FatturaPA_DM;

interface
uses
  System.SysUtils, System.Classes, SchedaPreventiviOrdini,
  XMLIntf, DB, IBODataset, Vcl.Dialogs, Xml.Xmldom, DForce.Mini.ei,
  DForce.ei.Invoice.Base, Xml.Win.msxmldom, IB_Components;

const
  XSL_FILE_NAME = 'fatturapa_v1.1.xsl';


type
  TFatturaPA = class(TDataModule)
    QrySogg: TIBOQuery;
    QrySoggCODICE: TIntegerField;
    QrySoggRAGIONESOCIALE: TStringField;
    QrySoggINDIRIZZO: TStringField;
    QrySoggNUMCIVICO: TStringField;
    QrySoggSCALA: TStringField;
    QrySoggPIANO: TStringField;
    QrySoggINTERNO: TStringField;
    QrySoggPALAZZO: TStringField;
    QrySoggCODICEISTATCOMUNE: TStringField;
    QrySoggCITTA: TStringField;
    QrySoggCAP: TStringField;
    QrySoggPROVINCIA: TStringField;
    QrySoggTELEFONO: TStringField;
    QrySoggFAX: TStringField;
    QrySoggCELLULARE: TStringField;
    QrySoggCHIEDEREDI: TStringField;
    QrySoggSCONTO: TSmallintField;
    QrySoggINDIRIZZODESTINAZMERCI: TStringField;
    QrySoggNUMCIVICODESTINAZMERCI: TStringField;
    QrySoggCODICEISTATCOMUNEDESTINAZMERCI: TStringField;
    QrySoggCITTADESTINAZMERCI: TStringField;
    QrySoggCAPDESTINAZMERCI: TStringField;
    QrySoggPROVINCIADESTINAZMERCI: TStringField;
    QrySoggLISTINO: TSmallintField;
    QrySoggCONTOCORRENTE: TStringField;
    QrySoggPAGAMENTO: TIntegerField;
    QrySoggCLIENTEFORNITORE: TStringField;
    QrySoggCODICEIVA: TIntegerField;
    QrySoggPARTITAIVA: TStringField;
    QrySoggCODICEFISCALE: TStringField;
    QrySoggSITOINTERNET: TStringField;
    QrySoggATTIVITASVOLTA: TStringField;
    QrySoggDATANASCITA: TDateTimeField;
    QrySoggLUOGONASCITA: TStringField;
    QrySoggSESSO: TStringField;
    QrySoggTELEX: TStringField;
    QrySoggCATEGORIA1: TStringField;
    QrySoggCATEGORIA2: TStringField;
    QrySoggCATEGORIA3: TStringField;
    QrySoggCATEGORIA4: TStringField;
    QrySoggCATEGORIA5: TStringField;
    QrySoggJOLLY1: TStringField;
    QrySoggJOLLY2: TStringField;
    QrySoggJOLLY3: TStringField;
    QrySoggJOLLY4: TStringField;
    QrySoggJOLLY5: TStringField;
    QrySoggJOLLY6: TStringField;
    QrySoggJOLLY7: TStringField;
    QrySoggJOLLY8: TStringField;
    QrySoggJOLLY9: TStringField;
    QrySoggJOLLY10: TStringField;
    QrySoggJOLLY11: TStringField;
    QrySoggJOLLY12: TStringField;
    QrySoggJOLLY13: TStringField;
    QrySoggJOLLY14: TStringField;
    QrySoggJOLLY15: TStringField;
    QrySoggJOLLY16: TStringField;
    QrySoggJOLLY17: TStringField;
    QrySoggJOLLY18: TStringField;
    QrySoggJOLLY19: TStringField;
    QrySoggJOLLY20: TStringField;
    QrySoggJOLLY21: TStringField;
    QrySoggJOLLY22: TStringField;
    QrySoggJOLLY23: TStringField;
    QrySoggJOLLY24: TStringField;
    QrySoggJOLLY25: TStringField;
    QrySoggJOLLY26: TStringField;
    QrySoggJOLLY27: TStringField;
    QrySoggJOLLY28: TStringField;
    QrySoggJOLLY29: TStringField;
    QrySoggJOLLY30: TStringField;
    QrySoggJOLLY31: TStringField;
    QrySoggJOLLY32: TStringField;
    QrySoggJOLLY33: TStringField;
    QrySoggJOLLY34: TStringField;
    QrySoggJOLLY35: TStringField;
    QrySoggJOLLY36: TStringField;
    QrySoggJOLLY37: TStringField;
    QrySoggJOLLY38: TStringField;
    QrySoggJOLLY39: TStringField;
    QrySoggJOLLY40: TStringField;
    QrySoggJOLLY41: TStringField;
    QrySoggJOLLY42: TStringField;
    QrySoggJOLLY43: TStringField;
    QrySoggJOLLY44: TStringField;
    QrySoggJOLLY45: TStringField;
    QrySoggJOLLY46: TStringField;
    QrySoggJOLLY47: TStringField;
    QrySoggJOLLY48: TStringField;
    QrySoggJOLLY49: TStringField;
    QrySoggJOLLY50: TStringField;
    QrySoggNOTE: TMemoField;
    QrySoggNOTEPRIVATE: TMemoField;
    QrySoggCODICERIF: TIntegerField;
    QrySoggRAGSOCRIF: TStringField;
    QrySoggINDIRIZZORIF: TStringField;
    QrySoggNUMCIVICORIF: TStringField;
    QrySoggCITTARIF: TStringField;
    QrySoggCAPRIF: TStringField;
    QrySoggPROVINCIARIF: TStringField;
    QrySoggTITOLO: TStringField;
    QrySoggABI: TStringField;
    QrySoggCAB: TStringField;
    QrySoggCODICEDESTINAZMERCI: TIntegerField;
    QrySoggRAGSOCDESTINAZMERCI: TStringField;
    QrySoggEMAIL: TStringField;
    QrySoggSINCHRO: TStringField;
    QrySoggSALTAMESE1: TStringField;
    QrySoggSALTAMESE2: TStringField;
    QrySoggSALTAMESE3: TStringField;
    QrySoggSALTAMESE4: TStringField;
    QrySoggSALTAMESE5: TStringField;
    QrySoggSALTAMESE6: TStringField;
    QrySoggSALTAMESE7: TStringField;
    QrySoggSALTAMESE8: TStringField;
    QrySoggSALTAMESE9: TStringField;
    QrySoggSALTAMESE10: TStringField;
    QrySoggSALTAMESE11: TStringField;
    QrySoggSALTAMESE12: TStringField;
    QrySoggSALTAMESESPOSTAALGIORNO: TIntegerField;
    QrySoggSPOSTASCADALGIORNO: TIntegerField;
    QrySoggADDEBITASPESE: TStringField;
    QrySoggCIN: TStringField;
    QrySoggSPESEINCASSO: TIBOFloatField;
    QrySoggSTATODESCRIZIONE: TStringField;
    QrySoggSTATOFOREGROUND: TStringField;
    QrySoggSTATOBACKGROUND: TStringField;
    QrySoggFORNITORECONLISTINO: TStringField;
    QrySoggIMPORTOFIDO: TIBOFloatField;
    QrySoggAGENTE: TStringField;
    QrySoggAGENTE2: TStringField;
    QrySoggAGENTE3: TStringField;
    QrySoggAGENTE4: TStringField;
    QrySoggRITACCPERC: TIBOFloatField;
    QrySoggCOM_SMS: TStringField;
    QrySoggCOM_EMAIL: TStringField;
    QrySoggCOM_LETTERA: TStringField;
    QrySoggESTERO: TStringField;
    QrySoggESTERO_CODICE: TStringField;
    QrySoggESTERO_DESCRIZIONE: TStringField;
    QrySoggESTERO_SIGLA: TStringField;
    QrySoggPA_CODICEDESTINATARIO: TStringField;
    QrySoggPA_RIFAMMINISTRAZIONE: TStringField;
    QrySoggNAZIONESIGLA: TStringField;
    QrySoggNOME: TStringField;
    QrySoggCOGNOME: TStringField;
    QrySoggTIPOPERSONA: TStringField;
    QrySoggCODICEEORI: TStringField;
    QrySoggESIGIBILITAIVA: TStringField;
    SD1: TSaveDialog;
    QryCausali: TIBOQuery;
    QryCausaliPA_TIPODOCUMENTO: TStringField;
    QryScad: TIBOQuery;
    QryScadTIPO: TStringField;
    QryScadCODICE: TIntegerField;
    QryScadDATASCADENZA: TDateTimeField;
    QryScadCLIENTE: TIntegerField;
    QryScadTIPODOC: TStringField;
    QryScadNUMDOC: TIntegerField;
    QryScadREGISTRO: TStringField;
    QryScadDATADOC: TDateTimeField;
    QryScadIMPORTO: TIBOFloatField;
    QryScadIMPORTOPAGATO: TIBOFloatField;
    QryScadPRATICA: TIntegerField;
    QryScadNOTE: TStringField;
    QryScadPRATICA2: TIntegerField;
    QryScadPRATICA3: TIntegerField;
    QryScadDATAPRATICA1: TDateTimeField;
    QryScadDATAPRATICA2: TDateTimeField;
    QryScadDATAPRATICA3: TDateTimeField;
    QryScadRICEVUTABANCARIA: TStringField;
    QryScadABI: TStringField;
    QryScadCAB: TStringField;
    QryScadPRESENTATA: TStringField;
    QryScadPRESENTATABANCA: TStringField;
    QryScadPARTITAIVACLI: TStringField;
    QryScadINSOLUTO: TStringField;
    QryScadSPESEPROTESTO: TIBOFloatField;
    QryScadAGENTE: TStringField;
    QryScadAGENTE2: TStringField;
    QryScadAGENTE3: TStringField;
    QryScadAGENTE4: TStringField;
    QryScadSTATODESCRIZIONE: TStringField;
    QryScadDATAPAGAMENTO: TDateTimeField;
    QryScadIBAN: TStringField;
    QryScadPA_CONDIZIONIPAGAMENTOSIGLA: TStringField;
    QryScadPA_MODALITAPAGAMENTOSICLA: TStringField;
    QryScadABI_1: TStringField;
    QryScadCAB_1: TStringField;
    QryScadBANCA: TStringField;
    QryScadDESCBREVE: TStringField;
    QryScadMIABANCA: TStringField;
    QryScadSINCHRO: TStringField;
    QryScadBANCACODSIA: TStringField;
    QryScadBANCANOMESUPPORTO: TStringField;
    QryScadBANCACC: TStringField;
    QryScadBANCACIN: TStringField;
    QryScadBANCABIC: TStringField;
    QryScadBANCAIBAN: TStringField;
    QrySoggPEC: TStringField;
    QrySoggESTERO_UE: TStringField;
    QrySoggDISABILITACONTROLLOCODFISC: TStringField;
    QrySoggREGIMEFISCALESIGLA: TStringField;
  private
    FFatturaPA: IeiInvoice;
    FDocumento: TPreventiviOrdiniForm;
    FFormatSettings: TFormatSettings;
    FCurrentNode: IXMLNode;
  protected
    function IsPA: Boolean;
    function IsCedenteCessionarioInverted(const ATD: String): Boolean;
    procedure ControllaPresenzaCodiceCIG;
    function PostElaborazione(Nome: shortstring; AggiungiXSL: Boolean): Boolean;
    procedure OpenQueries;
    function GetNextProgressivoInvio: Integer;
    function GetNaturaIVA(ACodiceIVA: Integer): String;
    procedure ControllaAbilitazioneAliquotaIVA(ACodiceIVA: Integer);
    function GetTipoDocumento: String;
    function GetNumeroDocumento: String;
    function GetTipoRitenuta: String;
    function GetBolloVirtuale: String;
    function GetNomeFile: String;
    function IsIvaZero(const ACodiceIVA: Integer): Boolean;
    procedure GetPrimaIvaNonZero(var ACodiceIVA: Integer; var AAliquotaIVA: double);
    function CalcolaImportoSconto(const AImportoDaScontare, AScontoPerc: double): double;
    function AdattaRiferimentoNormativo(ADescrizioneIVA: String): String;
    // Funzioni per verificare se il valore è assegnato oppure no
    function IsAssignedString(const AValue: String): Boolean;
    function IsAssignedInteger(const AValue: Integer; const AZeroPermitted: Boolean = False): Boolean;
    function IsAssignedFloat(const AValue: double; const AZeroPermitted: Boolean = False): Boolean;
    function IsAssignedDateTime(const AValue: TDateTime): Boolean;
    function IsAssigned(const AValue: Variant; const AZeroPermitted: Boolean = False): Boolean; overload;
    function IsAssigned(const AField: TField; const AZeroPermitted: Boolean = False): Boolean; overload;
    // Procedure per scrivere il valore nella fattura PA con la giusta conversione e adattamenti
    function SetValueString(const APropertyName: String; AValue: String; AMaxLength: Integer = 0; const AMinLength: Integer = 0): Boolean;
    function SetValueInteger(const APropertyName: String; const AValue: Integer): Boolean;
    function SetValueFloat(const APropertyName: String; AValue: double; ADecimals: Byte = 0; const AZeroPermitted: Boolean = False;
      const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetValueFloat(const APropertyName: String; const AValue: Variant; ADecimals: Byte = 0; const AZeroPermitted: Boolean = False;
      const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetValueDateTime(const APropertyName: String; const AValue: TDateTime): Boolean;
    // Funzione che utilizza tutte le precedenti da utilizare per verificare e scrivere contemporaneamente
    // i valori nella fattura PA e contemporaneamente (per alcuni valori) verificarne l'assegnazione o meno.
    function SetValue(const APropertyName: String; AValue: Variant; const ADecimalsOrMaxLength: Integer = 0; const AZeroPermitted: Boolean = False;
      const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetValue(const APropertyName: String; const AField: TField; const ADecimalsOrMaxLength: Integer = 0; const AZeroPermitted: Boolean = False;
      const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetValueStr(const APropertyName: String; AValue: Variant; const AMaxLength, AMinLength: Integer): Boolean; overload;
    function SetValueStr(const APropertyName: String; const AField: TField; const AMaxLength, AMinLength: Integer): Boolean; overload;
    function SetRequiredValue(const APropertyName: String; const AValue: Variant; const ADecimalsOrMaxLength: Integer = 0;
      const AZeroPermitted: Boolean = False; const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetRequiredValue(const APropertyName: String; const AField: TField; const ADecimalsOrMaxLength: Integer = 0; const AZeroPermitted: Boolean = False;
      const AAbsoluteValue: Boolean = False): Boolean; overload;
    function SetRequiredValueStr(const APropertyName: String; const AValue: Variant; const AMaxLength, AMinLength: Integer): Boolean; overload;
    function SetRequiredValueStr(const APropertyName: String; const AField: TField; const AMaxLength, AMinLength: Integer): Boolean; overload;
    // Elaborazione pattern
    procedure Compila_Sconto(const AScontoMaggiorazioneListNode: IXMLScontoMaggiorazioneTypeList; const AScontoPercentuale, AScontoImporto: double); overload;
    procedure Compila_Sconto(const AScontoMaggiorazioneListNode: IXMLScontoMaggiorazioneTypeList; const AScontoPercentuale, AScontoImporto: Variant); overload;
    procedure Compila_DocumentiCorrelati(const DocumentiCorrelatiTypeList: IXMLDatiDocumentiCorrelatiTypeList; ATipoDocumento: String);
    procedure Compila_RiferimentoNumeroLineaType(const RiferimentoNumeroLineaTypeList: IXMLRiferimentoNumeroLineaTypeList;
      const ACommaDelimitedInputStringVariant: Variant);
    procedure Compila_DatiSAL(const ADatiSALTypeList: IXMLDatiSALTypeList; const ACommaDelimitedInputStringVariant: Variant);
    procedure Compila_DatiDDT(const DatiDDTTypeList: IXMLDatiDDTTypeList);
    // Elaborazione del documento elettronica per sezioni
    procedure Compila_Header;
    procedure Compila_Header_DatiTrasmissione;
    procedure Compila_Header_CedentePrestatore;
    procedure Compila_Header_CessionarioCommittente;
    procedure Compila_Header_CedentePrestatoreInvertito;
    procedure Compila_Header_CessionarioCommittenteInvertito;
    procedure Compila_Header_TerzoIntermediario;
    procedure Compila_Header_SoggettoEmittente;
    procedure Compila_Body;
    procedure Compila_Body_DatiGenerali_DatiGeneraliDocumento(ABody: IXMLFatturaElettronicaBodyType);
    procedure Compila_Body_DatiBeniServizi_DettaglioLinee(ABody: IXMLFatturaElettronicaBodyType);
    procedure Compila_Body_DatiBeniServizi_DatiRiepilogo(ADatiRiepilogoTypeList: IXMLDatiRiepilogoTypeList; ADettaglioIVAIndex: Byte);
    procedure Compila_Body_DatiPagamento(ADatiPagamentoTypeList: IXMLDatiPagamentoTypeList);
    procedure Compila_Body_Allegati(AAllegatiTypeList: IXMLAllegatiTypeList);
    // Proprietà
    property Documento: TPreventiviOrdiniForm read FDocumento;
    property CurrentNode: IXMLNode read FCurrentNode write FCurrentNode;
  public
    constructor Create(ADocumento: TPreventiviOrdiniForm); overload;
    procedure CompilaFatturaElettronica;
    function SaveToFile: Boolean;
    procedure SendToProvider;
    class function NotificationToString(const ANotificationType, ANotificationXML: string): string;
    class function SetNotificationHide(const AID: Integer; const AHide: Boolean): Boolean;
    class function SetNotificationDone(const AID: Integer; const ADone: Boolean): Boolean;
    class function DeleteNotification(const AID: Integer): Boolean;
    class function IsReadOnly(const ATipoDoc, AStatus: String): boolean;
    class function CanDelete(const ATipoDoc, AStatus: String): boolean;
  end;

implementation

uses
  DataModule1, System.Variants, System.StrUtils, cxCustomData,
  FormAllegati, Soap.EncdDecd, XMLDoc, Xml.XMLConst, System.IniFiles,
  IdGlobalProtocols, IB_Session, DForce.ei.Utils.Sanitizer,
  DataModule2, DForce.Mini.ei.Notification.Interfaces,
  DForce.Mini.ei.Notification.Factory, DForce.ei.Encoding, Controls;

{ %CLASSGROUP 'System.Classes.TPersistent' }

{$R *.dfm}
{ TFatturaPA }

function TFatturaPA.PostElaborazione(Nome: shortstring; AggiungiXSL: Boolean): Boolean;
var
  Xml: TStringList;
begin
  try
    Xml := TStringList.Create;
    try
      Xml.LoadFromFile(Nome);

      // Aggiunge le righe iniziali (Versione 1.1)
      // xml[0] := '<?xml version="1.0" encoding="UTF-8"?>';
      // xml.Insert(1, '<p:FatturaElettronica versione="1.1"');
      // xml.Insert(2, 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"');
      // xml.Insert(3, 'xmlns:p="http://www.fatturapa.gov.it/sdi/fatturapa/v1.1"');
      // xml.Insert(4, 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">');

      // Aggiunge le righe iniziali (Versione 1.2)
      Xml[0] := '<?xml version="1.0" encoding="UTF-8"?>';
      Xml.Insert(1, '<p:FatturaElettronica versione="FPR12"');
      Xml.Insert(2, 'xmlns:ds="http://www.w3.org/2000/09/xmldsig#"');
      Xml.Insert(3, 'xmlns:p="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2"');
      Xml.Insert(4, 'xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"');
      Xml.Insert(5, 'xsi:schemaLocation="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2 fatturaordinaria_v1.2.xsd ">');

      // Se abilitato aggiunge il riferimento al file XSL
      if AggiungiXSL then
        Xml.Insert(1, '<?xml-stylesheet type="text/xsl" href="fatturapa_v1.2.xsl"?>');
      // Aggiunge "p:" alla fine nel Tag di chiusura
      Xml[Xml.Count - 1] := StuffString(Xml[Xml.Count - 1], 3, 0, 'p:');
      Xml.Text := UTF8Encode(Xml.Text);
      Xml.SaveToFile(Nome);
    finally
      Xml.Free;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TFatturaPA.AdattaRiferimentoNormativo(ADescrizioneIVA: String): String;
var
  LDummyInt: Integer;
begin
  ADescrizioneIVA := Trim(ADescrizioneIVA);
  Result := ADescrizioneIVA;
  // Elimina il carattere "%", ".", ","
  ADescrizioneIVA := ReplaceStr(ADescrizioneIVA, '%', '');
  ADescrizioneIVA := ReplaceStr(ADescrizioneIVA, '.', '');
  ADescrizioneIVA := ReplaceStr(ADescrizioneIVA, ',', '');
  // Se a questo punto rimangono solo cifre significa che, come descrizione IVA, si era
  // messo solo l'aliquota IVA eventualmente con il carattere "%" alla fine (quindi un'aliquota IVA normale)
  // e in questo caso non ritorna nulla come riferimento normativo da inserire nella fattura elettronica
  if TryStrToInt(ADescrizioneIVA, LDummyInt) then
    Result := '';
end;

function TFatturaPA.CalcolaImportoSconto(const AImportoDaScontare, AScontoPerc: double): double;
begin
  Result := DM1.Arrotonda(AImportoDaScontare / 100 * AScontoPerc, FormatSettings.CurrencyDecimals)
end;

class function TFatturaPA.CanDelete(const ATipoDoc, AStatus: String): boolean;
begin
  Result := (  (ATipoDoc <> 'Fattura') and (ATipoDoc <> 'Nota_accre')  )
    or (AStatus = '') or (AStatus = 'rtReadyToSend');
end;

procedure TFatturaPA.CompilaFatturaElettronica;
begin
  // Compilazione HEADER
  Self.OpenQueries;
  Self.Compila_Header;
  Self.Compila_Body;
end;

constructor TFatturaPA.Create(ADocumento: TPreventiviOrdiniForm);
begin
  inherited Create(nil);
  FDocumento := ADocumento;
  FFatturaPA := ei.NewInvoice;
  // Set the FormatSettings
  FFormatSettings.Create;
  FFormatSettings.DecimalSeparator := '.';
  FFormatSettings.ThousandSeparator := ',';
end;

class function TFatturaPA.DeleteNotification(const AID: Integer): Boolean;
var
  Qry: TIB_Cursor;
begin
  Result := False;
  if DM1.Messaggi('ELIMINA NOTIFICA', 'Eliminare la notifica selezionata?', '', [mbYes, mbNo], 0, nil) <> mrYes then
    Exit;
  if DM1.Messaggi('ELIMINA NOTIFICA', 'ATTENZIONE!!!'#13#13#13'Questa operazione sarà subito definitiva.'#13#13'Proseguire?',
    'NB: Se si è all''interno di un documento e questa operazione sarà definitiva, anche se poi si decide di non confermare le modifiche del documento stesso.',
    [mbYes, mbNo], 0, nil) <> mrYes then
    Exit;
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('DELETE FROM PRVORDCL_FE WHERE ID = ' + IntTostr(AID));
    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TFatturaPA.GetBolloVirtuale: String;
begin
  if Documento.QryDocumentoBOLLOVIRTUALE.AsString = 'T' then
    Result := 'SI'
  else
    raise Exception.Create('Nella fattura elettronica è ammesso solo il bollo virtuale');
end;

function TFatturaPA.GetNaturaIVA(ACodiceIVA: Integer): String;
var
  Qry: TIB_Cursor;
begin
  // Se è un rigo di riferimento...
  if ACodiceIVA = -9 then
    ACodiceIVA := Documento.DocIvaDefault.Codice;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // IMposta la query che preleva i dati del sistema di backup
    Qry.SQL.Add('SELECT PA_NATURA FROM ALIQIVA WHERE CODICEIVA = ' + IntTostr(ACodiceIVA));
    Qry.Open;
    Result := Qry.Fields[0].AsString;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TFatturaPA.GetNextProgressivoInvio: Integer;
var
  Qry: TIB_Cursor;
begin
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // IMposta la query che preleva i dati del sistema di backup
    Qry.SQL.Add('SELECT gen_id(PA_PROGRESSIVOINVIO, 1) FROM RDB$DATABASE');
    Qry.Open;
    Result := Qry.Fields[0].Value;
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

function TFatturaPA.GetNomeFile: String;
begin
  // Effettua alcuni controlli
  if Trim(DM1.TableDatiAziendaCODICEFISCALE.AsString) = '' then
    raise Exception.Create('Campo "Codice Fiscale" (Dati azienda) non valido!');
  if Trim(DM1.TableDatiAziendaNAZIONESIGLA.AsString) = '' then
    raise Exception.Create('Campo "Sigla nazione" (Dati azienda) non valido!');
  if (FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ProgressivoInvio = '') or
    (FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ProgressivoInvio = '-1') then
    raise Exception.Create('Progressivo invio non valido!');
  // Compila il nome del file
  Result := Uppercase(DM1.TableDatiAziendaNAZIONESIGLA.AsString) + Uppercase(DM1.TableDatiAziendaCODICEFISCALE.AsString) + '_' +
    FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ProgressivoInvio;
end;

function TFatturaPA.GetNumeroDocumento: String;
begin
  // Numero
  Result := Trim(Documento.QryDocumentoNUMORDPREV.AsString);
  // Registro/sezionale
  if Trim(Documento.QryDocumentoREGISTRO.AsString) <> '-' then
    Result := Result + Trim(Documento.QryDocumentoREGISTRO.AsString);
end;

procedure TFatturaPA.GetPrimaIvaNonZero(var ACodiceIVA: Integer; var AAliquotaIVA: double);
begin
  if Documento.QryDocumentoTOTALEIMPONIBILE1.AsFloat <> 0 then
  begin
    ACodiceIVA := Documento.QryDocumentoCODICEIVA1.AsInteger;
    AAliquotaIVA := Documento.QryDocumentoALIQUOTAIVA1.AsInteger;
  end
  else if Documento.QryDocumentoTOTALEIMPONIBILE2.AsFloat <> 0 then
  begin
    ACodiceIVA := Documento.QryDocumentoCODICEIVA2.AsInteger;
    AAliquotaIVA := Documento.QryDocumentoALIQUOTAIVA2.AsInteger;
  end
  else if Documento.QryDocumentoTOTALEIMPONIBILE3.AsFloat <> 0 then
  begin
    ACodiceIVA := Documento.QryDocumentoCODICEIVA3.AsInteger;
    AAliquotaIVA := Documento.QryDocumentoALIQUOTAIVA3.AsInteger;
  end
  else if Documento.QryDocumentoTOTALEIMPONIBILE4.AsFloat <> 0 then
  begin
    ACodiceIVA := Documento.QryDocumentoCODICEIVA4.AsInteger;
    AAliquotaIVA := Documento.QryDocumentoALIQUOTAIVA4.AsInteger;
  end
  else
  // Se non ci sono righe di castelletto IVA con imponibilie <> 0 allora ritorna
  // l'aliquota iva di default del documento/cliente
  begin
    ACodiceIVA := Documento.DocIvaDefault.Codice;
    AAliquotaIVA := Documento.DocIvaDefault.AliquotaIVA;
  end;
end;

function TFatturaPA.GetTipoDocumento: String;
begin
  // Determinazione del tipo di documento
  if (not QryCausali.Eof) and (QryCausaliPA_TIPODOCUMENTO.AsString <> '') then
    Result := QryCausaliPA_TIPODOCUMENTO.AsString
  else
  begin
    if Documento.QryDocumentoTIPODOCUMENTO.AsString = 'Fattura' then
      Result := 'TD01'
    else if Documento.QryDocumentoTIPODOCUMENTO.AsString = 'Nota_accre' then
      Result := 'TD04'
    else
      raise Exception.Create('Non è stato possibile determinare il TipoDocumento (2.1.1.1)');
  end;
end;

function TFatturaPA.GetTipoRitenuta: String;
begin
  if QrySoggTIPOPERSONA.AsString = 'F' then
    Result := 'RT01'
  else if QrySoggTIPOPERSONA.AsString = 'G' then
    Result := 'RT02';
end;

procedure TFatturaPA.Compila_Body;
var
  ABody: IXMLFatturaElettronicaBodyType;
begin
  ABody := FFatturaPA.FatturaElettronicaBody.Add;
  Self.Compila_Body_DatiGenerali_DatiGeneraliDocumento(ABody);
  Self.Compila_DocumentiCorrelati(ABody.DatiGenerali.DatiOrdineAcquisto, 'Ordine di acquisto');
  Self.Compila_DocumentiCorrelati(ABody.DatiGenerali.DatiContratto, 'Contratto');
  Self.Compila_DocumentiCorrelati(ABody.DatiGenerali.DatiConvenzione, 'Convenzione');
  Self.Compila_DocumentiCorrelati(ABody.DatiGenerali.DatiRicezione, 'Procedura di ricezione');
  Self.Compila_DocumentiCorrelati(ABody.DatiGenerali.DatiFattureCollegate, 'Fattura collegata');
  Self.Compila_DatiSAL(ABody.DatiGenerali.DatiSAL, Documento.QryDocumentoDATISAL_RIFERIMENTOFASE.AsString);
  Self.Compila_DatiDDT(ABody.DatiGenerali.DatiDDT);
  Self.Compila_Body_DatiBeniServizi_DettaglioLinee(ABody);
  Self.Compila_Body_DatiBeniServizi_DatiRiepilogo(ABody.DatiBeniServizi.DatiRiepilogo, 1); // DettaglioIVA 1
  Self.Compila_Body_DatiBeniServizi_DatiRiepilogo(ABody.DatiBeniServizi.DatiRiepilogo, 2); // DettaglioIVA 2
  Self.Compila_Body_DatiBeniServizi_DatiRiepilogo(ABody.DatiBeniServizi.DatiRiepilogo, 3); // DettaglioIVA 3
  Self.Compila_Body_DatiBeniServizi_DatiRiepilogo(ABody.DatiBeniServizi.DatiRiepilogo, 4); // DettaglioIVA 4
  Self.Compila_Body_DatiPagamento(ABody.DatiPagamento);
  Self.Compila_Body_Allegati(ABody.Allegati);
end;

procedure TFatturaPA.Compila_Body_Allegati(AAllegatiTypeList: IXMLAllegatiTypeList);
var
  FileExt: String;
  FullPathFileName: String;
  LStream: TMemoryStream;
  Encoded: AnsiString;
begin
  LStream := TMemoryStream.Create;
  try
    Documento.AllegatiForm.QryAllegati.DisableControls;
    Documento.AllegatiForm.QryAllegati.First;
    // Cicla per tutti gli allegati al documento
    while not Documento.AllegatiForm.QryAllegati.Eof do
    begin
      // Se il documento non è da allegare continua e passa al prossimo
      if (Documento.AllegatiForm.QryAllegatiPA_ALLEGA.AsString = 'T') and (Documento.AllegatiForm.QryAllegatiFILE_BLOB_PRESENT.AsString = 'T') then
      begin
        // Crea il nodo per l'allegato e lo imposta
        CurrentNode := AAllegatiTypeList.Add;
        // NomeAttachment
        SetRequiredValue('NomeAttachment', Documento.AllegatiForm.QryAllegatiFILE_NAME, 60);
        // AlgoritmoCompressione
        FileExt := Uppercase(Trim(Documento.AllegatiForm.QryAllegatiFILE_EXT.AsString));
        if (FileExt = 'ZIP') or (FileExt = 'RAR') or (FileExt = 'ARJ') or (FileExt = 'LZH') or (FileExt = '7Z') or (FileExt = 'GZIP') or (FileExt = 'JAR') or
          (FileExt = 'GZ') then
          SetValue('AlgoritmoCompressione', FileExt, 10)
          // FormatoAttachment  (se non compresso)
        else
          SetValue('FormatoAttachment', FileExt, 10);
        // DescrizioneAttachment
        SetValue('DescrizioneAttachment', Documento.AllegatiForm.QryAllegatiNOTE, 100);
        // Attachment
        FullPathFileName := Documento.AllegatiForm.GetFileFromDatabase(Documento.AllegatiForm.QryAllegatiANNOPROT.AsString,
          Documento.AllegatiForm.QryAllegatiNUMPROT.AsInteger, Documento.AllegatiForm.QryAllegatiREVPROT.AsInteger,
          Documento.AllegatiForm.QryAllegatiFILE_NAME.AsString);
        LStream.LoadFromFile(FullPathFileName);
        LStream.Position := 0;
        Encoded := EncodeBase64(LStream.Memory, LStream.Size);
        SetRequiredValue('Attachment', Encoded, 9999999999);
      end;
      // Avanti il prossimo
      Documento.AllegatiForm.QryAllegati.Next;
    end;
  finally
    LStream.Free;
    Documento.AllegatiForm.QryAllegati.EnableControls;
  end;
end;

procedure TFatturaPA.Compila_Body_DatiBeniServizi_DatiRiepilogo(ADatiRiepilogoTypeList: IXMLDatiRiepilogoTypeList; ADettaglioIVAIndex: Byte);
var
  CodiceIVA: Variant;
  AliquotaIVA: double;
  LRiferimentoNormativo: String;
  SpeseAccessorie: double;
  TotaleImponibile: double;
  LNaturaIva, LEsigibilitaIVA: String;
  function GetFieldValue(const AFieldName: String; AFieldNameIndex: Integer): Variant;
  begin
    Result := Documento.QryDocumento.FieldByName(AFieldName + IntTostr(AFieldNameIndex)).Value;
  end;
  procedure CheckSplitPaymentAndReverseCharge;
  begin
    // NB: NON DEVE ESSERE POSSIBILE UNA FATTURA IN CUI CI SIA LO SPLI PAYMENT E IL REVERSE CHARGE INSIEME
    if (LEsigibilitaIVA = 'S') and (LeftStr(LNaturaIva, 2) = 'N6') then
      raise Exception.Create
        ('Il documento non può essere contemporaneamente con scissione dei pagamenti (split payment) e inversione contabile (reverse charge)');
  end;

begin
  // Carica alcuni dati in delle variabili per comodità
  CodiceIVA := GetFieldValue('CODICEIVA', ADettaglioIVAIndex);
  // Se il dettaglio IVA attuale non è valorizzato esce
  if VarIsNull(CodiceIVA) or (CodiceIVA = 0) then
    Exit;
  // Se l'aliquota IVA attuale non è abilitata ferma tutto
  ControllaAbilitazioneAliquotaIVA(CodiceIVA);
  // Carica alcuni dati in delle variabili per comodità
  SpeseAccessorie := Documento.QryDocumentoSPESE.Value;
  AliquotaIVA := GetFieldValue('ALIQUOTAIVA', ADettaglioIVAIndex);
  TotaleImponibile := GetFieldValue('TOTALEIMPONIBILE', ADettaglioIVAIndex);
  // Se l'ImponibileIVA attuale = 0 non inserisce la sezione
  // NB: ELIMINATO QUESTE RIGHE PER DARE LA POSSIBILITA' DI FARE FATTURE ELETTRONICHE CON TOTALEDOCUMENTO = ZERO
  // if TotaleImponibile = 0 then
  // Exit;
  // Se invece è un dettaglio IVA valido crea il nodo
  CurrentNode := ADatiRiepilogoTypeList.Add;
  // Prosegue con l'assegnazione dei dati per questo dettaglio IVA
  SetRequiredValue('AliquotaIVA', AliquotaIVA, 2, True);
  if AliquotaIVA = 0 then
  begin
    LNaturaIva := GetNaturaIVA(CodiceIVA);
    SetRequiredValueStr('Natura', LNaturaIva, 4, 2);
  end;
  // Assegna le spese accessorie solo se il CodiceIVA del dettaglio IVA attuale corrisponde
  // all'aliquota IVA di default del documento e se ovviamente tali spese ci sono
  if (SpeseAccessorie <> 0) and (CodiceIVA = Documento.DocIvaDefault.Codice) then
    SetRequiredValue('SpeseAccessorie', SpeseAccessorie, 2);
  // Arrotondamento
  SetRequiredValue('ImponibileImporto', TotaleImponibile, 2, True);
  SetRequiredValue('Imposta', GetFieldValue('IMPORTOIVA', ADettaglioIVAIndex), 2, True);
  // Esigibilità IVA
  LEsigibilitaIVA := Documento.QryDocumentoSPLITPAYMENT.AsString;
  SetValue('EsigibilitaIVA', LEsigibilitaIVA, 1);
  // NB: NON DEVE ESSERE POSSIBILE UNA FATTURA IN CUI CI SIA LO SPLI PAYMENT E IL REVERSE CHARGE INSIEME
  CheckSplitPaymentAndReverseCharge;
  // NB: Per evitare il problema del codice mpndezza (ampersend) dovuto al carattere
  // "%" ma volendo lasciare la possiblità di inserire un RiferimentoNormativo anche
  // per le aliquota IVA normali (quelle con alituota <> 0) come ci ha chiesto la Carola
  // dela Idrotecna (altrimenti non gli davano i rimborsi IVA)...
  LRiferimentoNormativo := AdattaRiferimentoNormativo(GetFieldValue('DESCRIZIONEIVA', ADettaglioIVAIndex));
  if LRiferimentoNormativo <> '' then
    SetValue('RiferimentoNormativo', LRiferimentoNormativo, 100);
  // OLD CODE -------------------------------------
  // NB: Per evitare il problema del codice mpndezza (ampersend) dovuto al carattere
  // "%" e visto che in realtà questo campo serve solo se si è in un caso di
  // "non imponibile", "esente" ecc. faccio che lo compiliamo solo
  // se l'aliquota IVA = 0
  // if AliquotaIVA = 0 then
  // SetValue('RiferimentoNormativo', GetFieldValue('DESCRIZIONEIVA', ADettaglioIVAIndex), 100);
  // OLD CODE -------------------------------------
end;

procedure TFatturaPA.Compila_Body_DatiBeniServizi_DettaglioLinee(ABody: IXMLFatturaElettronicaBodyType);
var
  I: Integer;
  DC: TcxCustomDataController;
  LImportoRigo, LPrzUnitNetto, LQta: double;
  CodiceIVA, CodiceIvaNonZero: Integer;
  AliquotaIVA, AliquotaIvaNonZero: double;
  LRigoNode: IXMLDettaglioLineeType;
  IsRigoRiferimento, LStmImporto, LRigoNoCalc: Boolean;
  LDescrizione, LValue: String;
  LFormatSettings: TFormatSettings;
  // Spese accessorie
  procedure AggiungiSpese;
  var
    LQta: double;
  begin
    LRigoNode := ABody.DatiBeniServizi.DettaglioLinee.Add;
    CurrentNode := LRigoNode;
    Inc(I);
    SetRequiredValue('NumeroLinea', I);
    SetValue('TipoCessionePrestazione', 'AC', 2);
    SetRequiredValue('Descrizione', 'Spese accessorie', 1000);
    LQta := 1;
    SetValue('Quantita', LQta, 4);
    SetRequiredValue('PrezzoUnitario', Documento.QryDocumentoSPESE, DM1.DecMicroPrz, True);
    SetRequiredValue('PrezzoTotale', Documento.QryDocumentoSPESE, DM1.DecMicroPrz, True);

    CodiceIVA := Documento.DocIvaDefault.Codice;
    AliquotaIVA := Documento.DocIvaDefault.AliquotaIVA;
    SetRequiredValue('AliquotaIVA', AliquotaIVA, 2, True);
    if AliquotaIVA = 0 then
      SetRequiredValueStr('Natura', Self.GetNaturaIVA(CodiceIVA), 4, 2);

  end;
// Bollo
  procedure AggiungiBollo;
  var
    LQta: double;
  begin
    LRigoNode := ABody.DatiBeniServizi.DettaglioLinee.Add;
    CurrentNode := LRigoNode;
    Inc(I);
    SetRequiredValue('NumeroLinea', I);
    // SetValue('TipoCessionePrestazione', 'AC', 2);
    SetRequiredValue('Descrizione', 'Rimborso bollo', 1000);
    LQta := 1;
    SetValue('Quantita', LQta, 4);
    SetRequiredValue('PrezzoUnitario', Documento.QryDocumentoBOLLOIMPORTO, DM1.DecMicroPrz, True);
    SetRequiredValue('PrezzoTotale', Documento.QryDocumentoBOLLOIMPORTO, DM1.DecMicroPrz, True);

    CodiceIVA := DM1.TableProgressivi2BOLLOCODICEIVA.AsInteger;
    AliquotaIVA := DM1.TableProgressivi2BOLLOALIQUOTAIVA.AsFloat;
    SetRequiredValue('AliquotaIVA', AliquotaIVA, 2, True);
    if AliquotaIVA = 0 then
      SetRequiredValueStr('Natura', Self.GetNaturaIVA(CodiceIVA), 4, 2);
  end;
// Altri Dati Gestionali
  procedure AggiungiAltriDatiGestionali;
  var
    LTipoDato: String;
    LDettaglioLineeNode: IXMLDettaglioLineeType;
  begin
    LDettaglioLineeNode := CurrentNode as IXMLDettaglioLineeType;
    // Se ci sono altri dati gestionali da compilare...
    LTipoDato := Trim(Documento.QryDocumentoADG1_TIPODATO.AsString);
    if LTipoDato <> '' then
    begin
      CurrentNode := LDettaglioLineeNode.AltriDatiGestionali.Add;
      SetRequiredValue('TipoDato', LTipoDato, 10);
      SetValue('RiferimentoTesto', Documento.QryDocumentoADG1_RIFERIMENTOTESTO, 60);
      SetValue('RiferimentoNumero', Documento.QryDocumentoADG1_RIFERIMENTONUMERO);
      SetValue('RiferimentoData', Documento.QryDocumentoADG1_RIFERIMENTODATA);
    end;
    // Se ci sono altri dati gestionali da compilare...
    LTipoDato := Trim(Documento.QryDocumentoADG2_TIPODATO.AsString);
    if LTipoDato <> '' then
    begin
      CurrentNode := LDettaglioLineeNode.AltriDatiGestionali.Add;
      SetRequiredValue('TipoDato', LTipoDato, 10);
      SetValue('RiferimentoTesto', Documento.QryDocumentoADG2_RIFERIMENTOTESTO, 60);
      SetValue('RiferimentoNumero', Documento.QryDocumentoADG2_RIFERIMENTONUMERO);
      SetValue('RiferimentoData', Documento.QryDocumentoADG2_RIFERIMENTODATA);
    end;
    // Se ci sono altri dati gestionali del RIGO da copmilare...
    LTipoDato := Trim(VarToStr(DC.Values[I, Documento.tvCorpoADG1_TIPODATO.Index]));
    if LTipoDato <> '' then
    begin
      CurrentNode := LDettaglioLineeNode.AltriDatiGestionali.Add;
      SetRequiredValue('TipoDato', LTipoDato, 10);
      SetValue('RiferimentoTesto', DC.Values[I, Documento.tvCorpoADG1_RIFERIMENTOTESTO.Index], 60);
      SetValue('RiferimentoNumero', DC.Values[I, Documento.tvCorpoADG1_RIFERIMENTONUMERO.Index]);
      SetValue('RiferimentoData', DC.Values[I, Documento.tvCorpoADG1_RIFERIMENTODATA.Index]);
    end;
  end;

begin
  // Setup FormatSettings
  LFormatSettings := TFormatSettings.Create;
  LFormatSettings.CurrencyString := 'EUR';
  LFormatSettings.CurrencyDecimals := DM1.DecMicroPrz;
  // Carica il riferimento alla prima aliquota IVA del castelletto con imponibilt <> 0
  GetPrimaIvaNonZero(CodiceIvaNonZero, AliquotaIvaNonZero);
  // Per comodità
  DC := Documento.tvCorpo.DataController;
  // Cicla per tutti i righi del documento
  for I := 0 to DC.RecordCount - 1 do
  begin
    // Carica alcuni flag sul rigo
    LRigoNoCalc := RightStr(VarToStr(DC.Values[I, Documento.tvCorpoROWTYPE.Index]), 1) = TIPORIGODOC_CHAR_GRAYED;
    LStmImporto := LRigoNoCalc and (VarToStr(DC.Values[I, Documento.tvCorpoROWPRINTPRICES.Index]) = 'T');
    // Carica la Qta per comodità
    LQta := 0;
    if not VarIsNull(DC.Values[I, Documento.tvCorpoQTA.Index]) then
      LQta := DC.Values[I, Documento.tvCorpoQTA.Index];
    // Carica l'importo del rigo per comodità
    // Carica il prezzo uintario netto per comodità
    LImportoRigo := 0;
    LPrzUnitNetto := 0;
    if not VarIsNull(DC.Values[I, Documento.tvCorpoIMPORTORIGO.Index]) then
    begin
      LImportoRigo := DC.Values[I, Documento.tvCorpoIMPORTORIGO.Index];
      if LQta <> 0 then
        LPrzUnitNetto := DM1.Arrotonda(LImportoRigo / LQta, DM1.DecMicroPrz);
    end;

    // Carica l'aliquotaIVA del rigo per comodità
    // NB: Se è un rigo di riferimento carica l'IVA di default del
    // documento
    CodiceIVA := DC.Values[I, Documento.tvCorpoCODICEIVA.Index];
    IsRigoRiferimento := CodiceIVA = (-9);
    if IsRigoRiferimento then
    begin
      CodiceIVA := CodiceIvaNonZero;
      AliquotaIVA := AliquotaIvaNonZero;
    end
    else
      AliquotaIVA := DC.Values[I, Documento.tvCorpoALIQUOTAIVA.Index];
// --------------- CODICE DISABILITATO PER FATTURA ELETTRONICA VER. 1.6.1 -----------------
    // Se l'aliquota IVA appena assegnata è di un rigo del castelletto
    // con imponibile = 0 allora la cambia con la prima che ha importo
    // <> 0. Questo perchè la fattura elettronica viene scartata se
    // nella sezione DatiRiepilogo c'è un'aliquota IVA con imponibile = 0
//    if IsIvaZero(CodiceIVA) then
//    begin
//      CodiceIVA := CodiceIvaNonZero;
//      AliquotaIVA := AliquotaIvaNonZero;
//    end;
// --------------- CODICE DISABILITATO PER FATTURA ELETTRONICA VER. 1.6.1 -----------------

    // Aggiunge il nodo per il rigo corrente e lo riempie
    LRigoNode := ABody.DatiBeniServizi.DettaglioLinee.Add;
    CurrentNode := LRigoNode;
    SetRequiredValue('NumeroLinea', I + 1);
    if LImportoRigo < 0 then
      SetValue('TipoCessionePrestazione', 'SC', 2);
    if VarToStr(DC.Values[I, Documento.tvCorpoCODICEARTICOLOSTM.Index]) <> '' then
    begin
      CurrentNode := LRigoNode.CodiceArticolo.Add;
      SetRequiredValue('CodiceTipo', 'Codice articolo', 35);
      SetRequiredValue('CodiceValore', DC.Values[I, Documento.tvCorpoCODICEARTICOLOSTM.Index], 35);
    end;
    CurrentNode := LRigoNode;
    // Compone la descrizione
    LDescrizione := VarToStr(DC.Values[I, Documento.tvCorpoDESCRIZIONE.Index]);
    if LStmImporto and (LPrzUnitNetto <> 0) then
      LDescrizione := LDescrizione + ' (' + FloatToStrF(LPrzUnitNetto, ffCurrency, 15, DM1.DecMicroPrz, LFormatSettings) + ')';
    SetRequiredValue('Descrizione', LDescrizione, 1000);
    // Se il prezzo unitario è diverso da zero allora imposta il parametro "AZeroPermitted" := True
    // in modo che se la Qtà era nulla la mette a <era automaticamente altrimenti dava un errore
    // alla validazione della fattura elettronica
    if VarIsNull(DC.Values[I, Documento.tvCorpoPREZZOUNITARIO.Index]) or (DC.Values[I, Documento.tvCorpoPREZZOUNITARIO.Index] = 0) then
      SetValue('Quantita', DC.Values[I, Documento.tvCorpoQTA.Index], 4)
    else
      SetValue('Quantita', DC.Values[I, Documento.tvCorpoQTA.Index], 4, True);
    SetValue('UnitaMisura', DC.Values[I, Documento.tvCorpoUNITADIMISURA.Index], 10);
    // DataInizioPeriodo
    // DataFinePeriodo
    // Se il RowType finisce con il carattere che indica che i prezzi e gli importi del rigo devono essere
    // visualizzati in grigio o cmq in secondo piano...
    if not LRigoNoCalc then
    // Mette gli importi solo se il rigo è ti tipo normale oppure TC_Totale
    // if VarIsNull(DC.Values[I,Documento.tvCorpoROWTYPE.Index])
    // or (DC.Values[I,Documento.tvCorpoROWTYPE.Index] = '')
    // or (DC.Values[I,Documento.tvCorpoROWTYPE.Index] = TIPORIGODOC_TC_Totale)
    // then
    begin
      SetRequiredValue('PrezzoUnitario', DC.Values[I, Documento.tvCorpoPREZZOUNITARIO.Index], DM1.DecMicroPrz, True);
      Self.Compila_Sconto(LRigoNode.ScontoMaggiorazione, DC.Values[I, Documento.tvCorpoSCONTORIGO.Index], 0);
      Self.Compila_Sconto(LRigoNode.ScontoMaggiorazione, DC.Values[I, Documento.tvCorpoSCONTORIGO2.Index], 0);
      Self.Compila_Sconto(LRigoNode.ScontoMaggiorazione, DC.Values[I, Documento.tvCorpoSCONTORIGO3.Index], 0);
      CurrentNode := LRigoNode;
      SetRequiredValue('PrezzoTotale', LImportoRigo, DM1.DecMicroPrz, True);
    end
    else
    begin
      SetRequiredValue('PrezzoUnitario', Null, DM1.DecMicroPrz, True);
      SetRequiredValue('PrezzoTotale', Null, DM1.DecMicroPrz, True);
    end;
    SetRequiredValue('AliquotaIVA', AliquotaIVA, 2, True);
    if AliquotaIVA = 0 then
      SetRequiredValueStr('Natura', Self.GetNaturaIVA(CodiceIVA), 4, 2);
    if not IsRigoRiferimento then
      SetValue('RiferimentoAmministrazione', DC.Values[I, Documento.tvCorpoNOTERIGO.Index], 20);
    // AltriDatiGestionali
    AggiungiAltriDatiGestionali;
  end;

  // Se ci sono spese nel campo SPESE della fattura...
  if Documento.QryDocumentoSPESE.AsFloat <> 0 then
    AggiungiSpese;
  // Se c'è il bollo
  if (Documento.QryDocumentoBOLLOIMPORTO.AsFloat <> 0) and (Documento.QryDocumentoBOLLOADDEBITAINFATTURA.AsString = 'T') then
    AggiungiBollo;
end;

procedure TFatturaPA.Compila_Body_DatiGenerali_DatiGeneraliDocumento(ABody: IXMLFatturaElettronicaBodyType);
begin
  // Se è una PA e manca il codice CIG blocca tutto
  ControllaPresenzaCodiceCIG;
  // Body.DatiGenerali.DatiGeneraliDocumento
  CurrentNode := ABody.DatiGenerali.DatiGeneraliDocumento;
  SetRequiredValueStr('TipoDocumento', Self.GetTipoDocumento, 4, 4);
  SetRequiredValue('Divisa', 'EUR', 3);
  SetRequiredValue('Data', Documento.QryDocumentoDATADOCUMENTO);
  SetRequiredValue('Numero', Self.GetNumeroDocumento, 20);
  // Body.DatiGenerali.DatiGeneraliDocumento.DatiRitenuta
  if Self.IsAssigned(Documento.QryDocumentoRITACCPERC) then
  begin
    // Crea il nodo per la ritenuta attuale e ne assegna i valori
//    CurrentNode := ABody.DatiGenerali.DatiGeneraliDocumento.DatiRitenuta;
    CurrentNode := ABody.DatiGenerali.DatiGeneraliDocumento.DatiRitenuta.Add;
    SetRequiredValueStr('TipoRitenuta', Self.GetTipoRitenuta, 4, 4);
    SetRequiredValue('ImportoRitenuta', Documento.QryDocumentoRITACC, 2, False, True);
    SetRequiredValue('AliquotaRitenuta', Documento.QryDocumentoRITACCPERC, 2);
    SetRequiredValue('CausalePagamento', Documento.QryDocumentoRITACCCAUSALEPAGAMENTOSIGLA770S, 2);
  end;
  // Body.DatiGenerali.DatiGeneraliDocumento.DatiBollo
  if Self.IsAssigned(Documento.QryDocumentoBOLLOIMPORTO) then
  begin
    CurrentNode := ABody.DatiGenerali.DatiGeneraliDocumento.DatiBollo;
    SetRequiredValueStr('BolloVirtuale', Self.GetBolloVirtuale, 2, 2);
    SetRequiredValue('ImportoBollo', Documento.QryDocumentoBOLLOIMPORTO, 2);
  end;
  // Body.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione
  // NB: Calcola e compila gli eventuali sconti/abbuoni finali
  Self.Compila_Sconto(ABody.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione, Documento.QryDocumentoABBUONOPERC.AsFloat, Documento.QryDocumentoABBUONO.AsFloat);
  // NB: Calcola e compile gli eventuali sconti per le 4 aliquote IVA possibili (NB: ORA IN DISUSO)
  Self.Compila_Sconto(ABody.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione, 0, Self.CalcolaImportoSconto(Documento.QryDocumentoTOTALERIGHI1.AsFloat,
    Documento.QryDocumentoSCONTOALIQUOTA1.AsFloat));
  Self.Compila_Sconto(ABody.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione, 0, Self.CalcolaImportoSconto(Documento.QryDocumentoTOTALERIGHI2.AsFloat,
    Documento.QryDocumentoSCONTOALIQUOTA2.AsFloat));
  Self.Compila_Sconto(ABody.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione, 0, Self.CalcolaImportoSconto(Documento.QryDocumentoTOTALERIGHI3.AsFloat,
    Documento.QryDocumentoSCONTOALIQUOTA3.AsFloat));
  Self.Compila_Sconto(ABody.DatiGenerali.DatiGeneraliDocumento.ScontoMaggiorazione, 0, Self.CalcolaImportoSconto(Documento.QryDocumentoTOTALERIGHI4.AsFloat,
    Documento.QryDocumentoSCONTOALIQUOTA4.AsFloat));
  // Body.DatiGenerali.DatiGeneraliDocumento
  CurrentNode := ABody.DatiGenerali.DatiGeneraliDocumento;
  SetValue('ImportoTotaleDocumento', Documento.QryDocumentoTOTALEDOCUMENTO, 2);
  SetValue('Causale', Documento.QryDocumentoCAUSALE, 200);
end;

procedure TFatturaPA.Compila_Body_DatiPagamento(ADatiPagamentoTypeList: IXMLDatiPagamentoTypeList);
var
  ADatiPagamentoType: IXMLDatiPagamentoType;
  LTotaleImportoPagamenti: double;
begin
  LTotaleImportoPagamenti := 0;
  // Se non ci sono scadenze esce
  if (DM1.TableProgressivi2FE_SCADENZE.AsString <> 'T') or QryScad.Eof then
    Exit;
  // Se arriva qui significa che ci sono scadenze e quindi
  // aggiunge il nodo (l'unico) dei DatiPagamento
  ADatiPagamentoType := ADatiPagamentoTypeList.Add;
  CurrentNode := ADatiPagamentoType;
  SetRequiredValueStr('CondizioniPagamento', QryScadPA_CONDIZIONIPAGAMENTOSIGLA, 4, 4);
  // Cicla per tutte le scadenze del documento
  while not QryScad.Eof do
  begin
    // Crea il nodo per la scadenza attuale e ne assegna i valori
    CurrentNode := ADatiPagamentoType.DettaglioPagamento.Add;
    SetRequiredValueStr('ModalitaPagamento', QryScadPA_MODALITAPAGAMENTOSICLA, 4, 4);
    SetValue('DataScadenzaPagamento', QryScadDATASCADENZA);
    SetRequiredValue('ImportoPagamento', QryScadIMPORTO, 2);
    SetValue('IstitutoFinanziario', QryScadBANCA, 80);
    SetValueStr('IBAN', QryScadIBAN, 34, 15);
    SetValueStr('ABI', QryScadABI, 5, 5);
    SetValueStr('CAB', QryScadCAB, 5, 5);
    SetValueStr('BIC', QryScadBANCABIC, 11, 8);
    // Aggiorna l'importo totale dei pagamente quale controllo per essere sicuri che non ci siano più scadenze del dovuto
    LTotaleImportoPagamenti := LTotaleImportoPagamenti + QryScadIMPORTO.AsFloat;
    // Avanti il prossimo
    QryScad.Next;
  end;
  // Se l'importo totale dei pagamenti è superiore al totale del documento ovviamente c'è qualcosa che non va
  //  NB: Aggiunto il "DM.Arrotonda" perchè è capitato un caso con una fattura della termoidraulica riccionese (fatt. 414/01 del 24/09/2020 - TANARI)
  //       dell'importo di 2309,28 nel quale il totale delle scadence (sempre 2309,28) risultava maggiore del dotale documento mentre invece
  //       ovviamente 2309,28 non è maggiore di 2309,28 bensi uguale, così ho risolto.
  if DM1.Arrotonda(LTotaleImportoPagamenti, FormatSettings.CurrencyDecimals) > DM1.Arrotonda(Documento.QryDocumentoTOTALEDAPAGARE.AsFloat,
  FormatSettings.CurrencyDecimals) then
    raise Exception.Create('ATTENZIONE!!!'#13#13'L''importo complessivo dei pagamenti è superiore al totale del documento.');
end;

procedure TFatturaPA.Compila_DatiDDT(const DatiDDTTypeList: IXMLDatiDDTTypeList);
var
  I: Integer;
  DC: TcxCustomDataController;
begin
  DC := Documento.TableViewDDTCorr.DataController;
  // Cicla per tutti i documenti correlati e se ne trova del tipo specificato
  // li aggiunge al tracciato.
  for I := 0 to DC.RecordCount - 1 do
  begin
    // Aggiunge il nodo per il documento correlato corrente
    CurrentNode := DatiDDTTypeList.Add;
    // Carica i dati
    SetRequiredValue('NumeroDDT', DC.Values[I, Documento.TableViewDDTCorr_Numero.Index], 20);
    SetRequiredValue('DataDDT', DC.Values[I, Documento.TableViewDDTCorr_Data.Index]);
    // Compila dil riferimento a Numero Linee che riceve coma stringa di numeri interi
    // separati da virgola
    Self.Compila_RiferimentoNumeroLineaType((CurrentNode as IXMLDatiDDTType).RiferimentoNumeroLinea,
      DC.Values[I, Documento.TableViewDDTCorr_RifNumLinea.Index]);
  end;
end;

procedure TFatturaPA.Compila_DatiSAL(const ADatiSALTypeList: IXMLDatiSALTypeList; const ACommaDelimitedInputStringVariant: Variant);
var
  AStringList: TStrings;
  I: Integer;
begin
  AStringList := TStringList.Create;
  try
    AStringList.CommaText := VarToStr(ACommaDelimitedInputStringVariant);
    for I := 0 to AStringList.Count - 1 do
    begin
      CurrentNode := ADatiSALTypeList.Add;
      SetRequiredValue('RiferimentoFase', StrToInt(AStringList[I]));
    end;
  finally
    AStringList.Free;
  end;
end;

procedure TFatturaPA.Compila_DocumentiCorrelati(const DocumentiCorrelatiTypeList: IXMLDatiDocumentiCorrelatiTypeList; ATipoDocumento: String);
var
  I: Integer;
  DC: TcxCustomDataController;
begin
  DC := Documento.TableViewDocCorr.DataController;
  // Cicla per tutti i documenti correlati e se ne trova del tipo specificato
  // li aggiunge al tracciato.
  for I := 0 to DC.RecordCount - 1 do
  begin
    if (VarToStr(DC.Values[I, Documento.TableViewDocCorr_Tipo.Index]) <> ATipoDocumento) or
      (Trim(VarToStr(DC.Values[I, Documento.TableViewDocCorr_IDDoc.Index])) = '') then
      Continue;
    // Aggiunge il nodo per il documento correlato corrente
    CurrentNode := DocumentiCorrelatiTypeList.Add;
    // Compila dil riferimento a Numero Linee che riceve coma stringa di numeri interi
    // separati da virgola
    Self.Compila_RiferimentoNumeroLineaType((CurrentNode as IXMLDatiDocumentiCorrelatiType).RiferimentoNumeroLinea,
      DC.Values[I, Documento.TableViewDocCorr_RifNumLinea.Index]);
    // Continua con gli altri normali assegnamenti
    SetRequiredValue('IdDocumento', DC.Values[I, Documento.TableViewDocCorr_IDDoc.Index], 20);
    SetValue('Data', DC.Values[I, Documento.TableViewDocCorr_Data.Index]);
    SetValue('NumItem', DC.Values[I, Documento.TableViewDocCorr_NumItem.Index], 20);
    SetValue('CodiceCUP', DC.Values[I, Documento.TableViewDocCorr_CUP.Index], 15);
    SetValue('CodiceCIG', DC.Values[I, Documento.TableViewDocCorr_CIG.Index], 15);
  end;
end;

procedure TFatturaPA.Compila_Header;
begin
  Self.Compila_Header_DatiTrasmissione;
  // Se stiamo emettendo una autofattura di tipo TD16, TD17, TD18, TD19, TD20
  //  allora cedente/prestatore e cessionario/committente vanno invertiti,
  //  in pratica l'autofattura di integrazione deve essere come la fattura
  //  alla quale fa riferimento però con il campo "SoggettoEmittente" impostato
  //  a 'CC' per indicare che la fattura è stata emessa dal cessionario committente.
  if IsCedenteCessionarioInverted(Self.GetTipoDocumento) then
  begin
    Self.Compila_Header_CedentePrestatoreInvertito;
    // RAppresentanteFiscale (invertito)
    Self.Compila_Header_CessionarioCommittenteInvertito;
    // Self.Compila_Header_TerzoIntermediarioInvertito;  // Non c'è per ora
  end
  else
  begin
    Self.Compila_Header_CedentePrestatore;
    // RAppresentanteFiscale
    Self.Compila_Header_CessionarioCommittente;
    Self.Compila_Header_TerzoIntermediario;
  end;
  // SoggettoEmittente
  Compila_Header_SoggettoEmittente;
end;

procedure TFatturaPA.Compila_Header_SoggettoEmittente;
begin
  CurrentNode := FFatturaPA.FatturaElettronicaHeader;
  // Se il tipo documento è un TD16, TD17, TD18, TD19, TD20
  //  allora il SoggettoEmittente deve essere 'CC', il cedente/prestatore deve essere quello originario
  //  della fattura di riferimento e il cessionario/committente il cessionario della fattura originaria.
  //  NB: Sembra che invece il TD21 non debba essere così ma sia il cedente che il cessionario siano
  //       la stessa azienda
  if IsCedenteCessionarioInverted(Self.GetTipoDocumento) then
    SetValue('SoggettoEmittente', 'CC', 2)
  else
  // Se non si è nel caso precedente e la fattura è emessa da un terzo intermediario allora
  //  come SoggettoEmittente si mette 'TZ'
  if DM1.TableDatiAziendaTERZOINT_ENABLED.AsString = 'T' then
    SetValue('SoggettoEmittente', 'TZ', 2);
end;

procedure TFatturaPA.Compila_Header_CedentePrestatore;
begin
  // Header.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA;
  SetRequiredValueStr('IdPaese', DM1.TableDatiAziendaNAZIONESIGLA, 2, 2);
  SetRequiredValue('IdCodice', DM1.TableDatiAziendaP_IVA, 28);
  // Header..CedentePrestatore.DatiAnagrafici
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
  SetValueStr('CodiceFiscale', DM1.TableDatiAziendaCODICEFISCALE, 16, 11);
  // Header.CedentePrestatore.DatiAnagrafici.Anagrafica
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.Anagrafica;
  if DM1.TableDatiAziendaTIPOPERSONA.AsString = 'F' then
  begin
    SetRequiredValue('Nome', DM1.TableDatiAziendaTITOLARENOME, 60);
    SetRequiredValue('Cognome', DM1.TableDatiAziendaTITOLARECOGNOME, 60);
  end
  else
    SetRequiredValue('Denominazione', DM1.TableDatiAziendaRAGIONESOCIALE, 80);
  // SetValueStr('Titolo', DM1.TableDatiAziendaTITOLOONORIFICO, 10, 2);  // Per adesso non c'è
  SetValueStr('CodEORI', DM1.TableDatiAziendaCOD_EORI, 17, 13);
  // Header.CedentePrestatore.DatiAnagrafici
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
  // AlboProfessionale
  // ProvinciaAlbo
  // NumeroIscrizioneAlbo
  // DataIscrizioneAlbo
  SetRequiredValueStr('RegimeFiscale', DM1.TableDatiAziendaREGIMEFISCALESIGLA, 4, 4);

  // Header.CedentePrestatore.Sede
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.Sede;
  SetRequiredValue('Indirizzo', DM1.TableDatiAziendaINDIRIZZO, 60);
  SetValue('NumeroCivico', DM1.TableDatiAziendaNUMCIVICO, 8);
  SetRequiredValueStr('CAP', DM1.TableDatiAziendaCAP, 5, 5);
  SetRequiredValue('Comune', DM1.TableDatiAziendaCITTA, 60);
  SetValueStr('Provincia', DM1.TableDatiAziendaPROVINCIA, 2, 2);
  SetRequiredValueStr('Nazione', DM1.TableDatiAziendaNAZIONESIGLA, 2, 2);

  // Header.CedentePrestatore.IscrizioneREA
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.IscrizioneREA;
  if SetValueStr('Ufficio', DM1.TableDatiAziendaREA_UFFICIO, 2, 2) then
  begin
    SetRequiredValue('NumeroREA', DM1.TableDatiAziendaREA_NUMERO, 20);
    SetValue('CapitaleSociale', DM1.TableDatiAziendaREA_CAPITALESOCIALE, 2);
    // NB: Nonostante debba essere lungo almeno 4 caratteri non ho usato il SetValueStr perchè in realtà è un valore numerico
    SetValueStr('SocioUnico', DM1.TableDatiAziendaREA_SOCIOUNICOSIGLA, 2, 2);
    SetRequiredValueStr('StatoLiquidazione', DM1.TableDatiAziendaREA_STATOLIQUIDAZIONESIGLA, 2, 2);
  end;

  // Header.CedentePrestatore.Contatti
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.Contatti;
  SetValueStr('Telefono', DM1.TableDatiAziendaTELEFONO, 12, 5);
  SetValueStr('Fax', DM1.TableDatiAziendaFAX, 12, 5);
  SetValueStr('Email', DM1.TableDatiAziendaEMAIL, 256, 7);

  // Header.CedentePrestatore
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore;
  SetValue('RiferimentoAmministrazione', QrySoggPA_RIFAMMINISTRAZIONE, 20);
end;

procedure TFatturaPA.Compila_Header_CedentePrestatoreInvertito;
begin
  // Controllo Codice FIscale e Partita IVA
  DM2.ControlloCodiceFiscalePartitaIva(QrySoggNOME.AsString, QrySoggCOGNOME.AsString, QrySoggCODICEFISCALE.AsString, QrySoggPARTITAIVA.AsString,
    QrySoggNAZIONESIGLA.AsString, QrySoggTIPOPERSONA.AsString, True, (QrySoggDISABILITACONTROLLOCODFISC.AsString = 'T'));
  // Header.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.IdFiscaleIVA;
  SetRequiredValueStr('IdPaese', QrySoggNAZIONESIGLA, 2, 2);
  SetRequiredValue('IdCodice', QrySoggPARTITAIVA, 28);
  // Header..CedentePrestatore.DatiAnagrafici
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
  SetValueStr('CodiceFiscale', QrySoggCODICEFISCALE, 16, 11);
  // Header.CedentePrestatore.DatiAnagrafici.Anagrafica
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici.Anagrafica;
  if QrySoggTIPOPERSONA.AsString = 'F' then
  begin
    SetRequiredValue('Nome', QrySoggNOME, 60);
    SetRequiredValue('Cognome', QrySoggCOGNOME, 60);
  end
  else
    SetRequiredValue('Denominazione', QrySoggRAGIONESOCIALE, 80);
  SetValueStr('Titolo', QrySoggTITOLO, 10, 2);
  SetValueStr('CodEORI', QrySoggCODICEEORI, 17, 13);
  // Header.CedentePrestatore.DatiAnagrafici
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.DatiAnagrafici;
  // AlboProfessionale
  // ProvinciaAlbo
  // NumeroIscrizioneAlbo
  // DataIscrizioneAlbo
  SetRequiredValueStr('RegimeFiscale', QrySoggREGIMEFISCALESIGLA, 4, 4);
  // Header.CedentePrestatore.Sede
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.Sede;
  SetRequiredValue('Indirizzo', QrySoggINDIRIZZO, 60);
  SetValue('NumeroCivico', QrySoggNUMCIVICO, 8);
  SetRequiredValueStr('CAP', QrySoggCAP, 5, 5);
  SetRequiredValue('Comune', QrySoggCITTA, 60);
  SetValueStr('Provincia', QrySoggPROVINCIA, 2, 2);
  SetRequiredValueStr('Nazione', QrySoggNAZIONESIGLA, 2, 2);
// ================================================================================================
// L'iscrizione REA non è presente nei soggetti e non è un dato rpevisto dall'art. 21 del DPR 633/72
// ------------------------------------------------------------------------------------------------
////   Header.CedentePrestatore.IscrizioneREA
//  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.IscrizioneREA;
//  if SetValueStr('Ufficio', DM1.TableDatiAziendaREA_UFFICIO, 2, 2) then
//  begin
//    SetRequiredValue('NumeroREA', DM1.TableDatiAziendaREA_NUMERO, 20);
//    SetValue('CapitaleSociale', DM1.TableDatiAziendaREA_CAPITALESOCIALE, 2);
//    // NB: Nonostante debba essere lungo almeno 4 caratteri non ho usato il SetValueStr perchè in realtà è un valore numerico
//    SetValueStr('SocioUnico', DM1.TableDatiAziendaREA_SOCIOUNICOSIGLA, 2, 2);
//    SetRequiredValueStr('StatoLiquidazione', DM1.TableDatiAziendaREA_STATOLIQUIDAZIONESIGLA, 2, 2);
//  end;
// ================================================================================================
// ================================================================================================
// Il blocco contatti ho preferito non metterlo anche se i dati di sono nel soggetto
//  potrebbero esserci dati non corretti visto che molti fanno casino e visto che
//  questo blocco non è obbligatorio...
// ------------------------------------------------------------------------------------------------
//  // Header.CedentePrestatore.Contatti
//  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore.Contatti;
//  SetValueStr('Telefono', DM1.TableDatiAziendaTELEFONO, 12, 5);
//  SetValueStr('Fax', DM1.TableDatiAziendaFAX, 12, 5);
//  SetValueStr('Email', DM1.TableDatiAziendaEMAIL, 256, 7);
// ================================================================================================
// ================================================================================================
// Credo che il "Riferimento Amministrazione" sia meglio non metterlo in una autofattura
// ------------------------------------------------------------------------------------------------
//  // Header.CedentePrestatore
//  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CedentePrestatore;
//  SetValue('RiferimentoAmministrazione', QrySoggPA_RIFAMMINISTRAZIONE, 20);
// ================================================================================================
end;

procedure TFatturaPA.Compila_Header_CessionarioCommittente;
begin
  // Controllo Codice FIscale e Partita IVA
  DM2.ControlloCodiceFiscalePartitaIva(QrySoggNOME.AsString, QrySoggCOGNOME.AsString, QrySoggCODICEFISCALE.AsString, QrySoggPARTITAIVA.AsString,
    QrySoggNAZIONESIGLA.AsString, QrySoggTIPOPERSONA.AsString, True, (QrySoggDISABILITACONTROLLOCODFISC.AsString = 'T'));
  // NB: Il blocco della PartitaIVA non è obbligatorio
  // NB: Per quanto riguarda il codice fiscale invece è obbligatorio solo
  // se non è stata specificata la partita IVA in quanto ci sono enti che
  // hanno solo il codice fiscale (non la partita IVA) e in questo caso
  // è obbligatorio
  if IsAssigned(QrySoggPARTITAIVA) then
  begin
    // Header.CessionarioCommittente.DatiAnagrafici.IdFiscaleIVA
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici.IdFiscaleIVA;
    SetRequiredValueStr('IdPaese', QrySoggNAZIONESIGLA, 2, 2);
    SetRequiredValue('IdCodice', QrySoggPARTITAIVA, 28);
    // Header.CessionarioCommittente.DatiAnagrafici
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici;
    SetValueStr('CodiceFiscale', QrySoggCODICEFISCALE, 16, 11);
  end
  else
  begin
    // Header.CessionarioCommittente.DatiAnagrafici
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici;
    SetRequiredValue('CodiceFiscale', QrySoggCODICEFISCALE, 16);
  end;
  // Header.CessionarioCommittente.DatiAnagrafici.Anagrafica
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici.Anagrafica;
  if QrySoggTIPOPERSONA.AsString = 'F' then
  begin
    SetRequiredValue('Nome', QrySoggNOME, 60);
    SetRequiredValue('Cognome', QrySoggCOGNOME, 60);
  end
  else
    SetRequiredValue('Denominazione', QrySoggRAGIONESOCIALE, 80);
  SetValueStr('Titolo', QrySoggTITOLO, 10, 2);
  SetValueStr('CodEORI', QrySoggCODICEEORI, 17, 13);
  // Header.CessionarioCommittente.Sede
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.Sede;
  SetRequiredValue('Indirizzo', QrySoggINDIRIZZO, 60);
  SetValue('NumeroCivico', QrySoggNUMCIVICO, 8);
  SetRequiredValueStr('CAP', QrySoggCAP, 5, 5);
  SetRequiredValue('Comune', QrySoggCITTA, 60);
  SetValueStr('Provincia', QrySoggPROVINCIA, 2, 2);
  SetRequiredValueStr('Nazione', QrySoggNAZIONESIGLA, 2, 2);
end;

procedure TFatturaPA.Compila_Header_CessionarioCommittenteInvertito;
begin
// ====================================================================================================
// Essendo noi in questo caso il cessionario/committente non effettua i controlli
// ----------------------------------------------------------------------------------------------------
//  // Controllo Codice FIscale e Partita IVA
//  DM2.ControlloCodiceFiscalePartitaIva(QrySoggNOME.AsString, QrySoggCOGNOME.AsString, QrySoggCODICEFISCALE.AsString, QrySoggPARTITAIVA.AsString,
//    QrySoggNAZIONESIGLA.AsString, QrySoggTIPOPERSONA.AsString, True, (QrySoggDISABILITACONTROLLOCODFISC.AsString = 'T'));
// ====================================================================================================
  // NB: Il blocco della PartitaIVA non è obbligatorio
  // NB: Per quanto riguarda il codice fiscale invece è obbligatorio solo
  // se non è stata specificata la partita IVA in quanto ci sono enti che
  // hanno solo il codice fiscale (non la partita IVA) e in questo caso
  // è obbligatorio
  if IsAssigned(DM1.TableDatiAziendaP_IVA) then
  begin
    // Header.CessionarioCommittente.DatiAnagrafici.IdFiscaleIVA
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici.IdFiscaleIVA;
    SetRequiredValueStr('IdPaese', DM1.TableDatiAziendaNAZIONESIGLA, 2, 2);
    SetRequiredValue('IdCodice', DM1.TableDatiAziendaP_IVA, 28);
    // Header.CessionarioCommittente.DatiAnagrafici
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici;
    SetValueStr('CodiceFiscale', DM1.TableDatiAziendaCODICEFISCALE, 16, 11);
  end
  else
  begin
    // Header.CessionarioCommittente.DatiAnagrafici
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici;
    SetRequiredValue('CodiceFiscale', DM1.TableDatiAziendaCODICEFISCALE, 16);
  end;
  // Header.CessionarioCommittente.DatiAnagrafici.Anagrafica
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.DatiAnagrafici.Anagrafica;
  if DM1.TableDatiAziendaTIPOPERSONA.AsString = 'F' then
  begin
    SetRequiredValue('Nome', DM1.TableDatiAziendaTITOLARENOME, 60);
    SetRequiredValue('Cognome', DM1.TableDatiAziendaTITOLARECOGNOME, 60);
  end
  else
    SetRequiredValue('Denominazione', DM1.TableDatiAziendaRAGIONESOCIALE, 80);
//  SetValueStr('Titolo', QrySoggTITOLO, 10, 2);  // Per adesso non c'è
  SetValueStr('CodEORI', DM1.TableDatiAziendaCOD_EORI, 17, 13);
  // Header.CessionarioCommittente.Sede
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.CessionarioCommittente.Sede;
  SetRequiredValue('Indirizzo', DM1.TableDatiAziendaINDIRIZZO, 60);
  SetValue('NumeroCivico', DM1.TableDatiAziendaNUMCIVICO, 8);
  SetRequiredValueStr('CAP', DM1.TableDatiAziendaCAP, 5, 5);
  SetRequiredValue('Comune', DM1.TableDatiAziendaCITTA, 60);
  SetValueStr('Provincia', DM1.TableDatiAziendaPROVINCIA, 2, 2);
  SetRequiredValueStr('Nazione', DM1.TableDatiAziendaNAZIONESIGLA, 2, 2);
end;

procedure TFatturaPA.Compila_Header_DatiTrasmissione;
var
  LCodiceDestinatario: String;
  LInverted: Boolean;
begin
  // Header.DatiTrasmissione.IDTrasmittente
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.IdTrasmittente;
  if DM1.TableDatiAziendaDATITRASMIT_ENABLED.AsString = 'T' then
  begin
    SetRequiredValueStr('IdPaese', DM1.TableDatiAziendaDATITRASMIT_IDPAESE, 2, 2);
    SetRequiredValue('IdCodice', DM1.TableDatiAziendaDATITRASMIT_IDCODICE, 28);
  end
  else
  begin
    SetRequiredValueStr('IdPaese', DM1.TableDatiAziendaNAZIONESIGLA, 2, 2);
    SetRequiredValue('IdCodice', DM1.TableDatiAziendaCODICEFISCALE, 28);
  end;
  // Header.DatiTrasmissione
  // NB: Nel progressivo invio mette un numero provvisorio e poi lo riassegna giusto alla fine
  // subito prima di salvare il file, in questo modo evito di perdere dei numeri in caso
  // di errori nella compilazione del documento elettronico.
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione;
  SetRequiredValue('ProgressivoInvio', -1);
  // In base al tipo di cliente (PA o no) imposta il formato trasmissione corretto
  if IsPA then
    SetRequiredValue('FormatoTrasmissione', 'FPA12', 5)
  else
    SetRequiredValue('FormatoTrasmissione', 'FPR12', 5);
  // =====================================================
  // Imposta il CodiceDestinatario
  // -----------------------------------------------------
  // Se stiamo emettendo una autofattura di tipo TD16, TD17, TD18, TD19, TD20
  //  allora cedente/prestatore e cessionario/committente vanno invertiti,
  //  in pratica l'autofattura di integrazione deve essere come la fattura
  //  alla quale fa riferimento però con il campo "SoggettoEmittente" impostato
  //  a 'CC' per indicare che la fattura è stata emessa dal cessionario committente.
  LInverted := IsCedenteCessionarioInverted(Self.GetTipoDocumento);
  if LInverted then
    LCodiceDestinatario := DM1.TableDatiAziendaFE_CODICEDESTINATARIO.AsString
  else
    LCodiceDestinatario := Trim(QrySoggPA_CODICEDESTINATARIO.AsString);

  if IsPA and not LInverted then
  begin
    if (Length(LCodiceDestinatario) <> 6) then
      raise Exception.Create(Format('Codice destinatario "%s" non valido (PA)', [LCodiceDestinatario]));
    SetRequiredValue('CodiceDestinatario', LCodiceDestinatario, 6)
  end
  else
  begin
    if LCodiceDestinatario <> '' then
    begin
      if (Length(LCodiceDestinatario) <> 7) then
        raise Exception.Create(Format('Codice destinatario "%s" non valido (B2B o autofattura)', [LCodiceDestinatario]));
    end
    else if Trim(QrySoggNAZIONESIGLA.AsString) <> 'IT' then
      LCodiceDestinatario := 'XXXXXXX'
    else
      LCodiceDestinatario := '0000000';
    SetRequiredValue('CodiceDestinatario', LCodiceDestinatario, 7);
  end;
  // =====================================================
  // Header.DatiTrasmissione.ContattiTrasmittente
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ContattiTrasmittente;
  if DM1.TableDatiAziendaDATITRASMIT_ENABLED.AsString = 'T' then
  begin
    SetValueStr('Telefono', DM1.TableDatiAziendaDATITRASMIT_TELEFONO, 12, 5);
    SetValueStr('Email', DM1.TableDatiAziendaDATITRASMIT_EMAIL, 256, 7);
  end
  else
  begin
    SetValueStr('Telefono', DM1.TableDatiAziendaTELEFONO, 12, 5);
    SetValueStr('Email', DM1.TableDatiAziendaEMAIL, 256, 7);
  end;
  // PECDEstinatario
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione;
  SetValueStr('PECDestinatario', QrySoggPEC, 256, 7);
end;

procedure TFatturaPA.Compila_Header_TerzoIntermediario;
begin
  // Se non abilitato esce subito
  if DM1.TableDatiAziendaTERZOINT_ENABLED.AsString <> 'T' then
    Exit;
  // Header.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici.IdFiscaleIVA
  if Self.IsAssigned(DM1.TableDatiAziendaTERZOINT_IDPAESE) or Self.IsAssigned(DM1.TableDatiAziendaTERZOINT_IDCODICE) then
  begin
    CurrentNode := FFatturaPA.FatturaElettronicaHeader.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici.IdFiscaleIVA;
    SetRequiredValueStr('IdPaese', DM1.TableDatiAziendaTERZOINT_IDPAESE, 2, 2);
    SetRequiredValue('IdCodice', DM1.TableDatiAziendaTERZOINT_IDCODICE, 28);
  end;
  // Header.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici;
  SetValueStr('CodiceFiscale', DM1.TableDatiAziendaTERZOINT_CODICEFISCALE, 16, 11);
  // Header.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici.Anagrafica;
  CurrentNode := FFatturaPA.FatturaElettronicaHeader.TerzoIntermediarioOSoggettoEmittente.DatiAnagrafici.Anagrafica;
  if DM1.TableDatiAziendaTERZOINT_TIPOPERSONA.AsString = 'F' then
  begin
    SetRequiredValue('Nome', DM1.TableDatiAziendaTERZOINT_NOME, 60);
    SetRequiredValue('Cognome', DM1.TableDatiAziendaTERZOINT_COGNOME, 60);
  end
  else
    SetRequiredValue('Denominazione', DM1.TableDatiAziendaTERZOINT_DENOMINAZIONE, 80);
  SetValueStr('Titolo', DM1.TableDatiAziendaTERZOINT_TITOLO, 10, 2);
  SetValueStr('CodEORI', DM1.TableDatiAziendaTERZOINT_CODEORI, 17, 13);
  // Header.SoggettoEmittente
  CurrentNode := FFatturaPA.FatturaElettronicaHeader;
  SetValue('SoggettoEmittente', 'TZ', 2);
end;

procedure TFatturaPA.Compila_RiferimentoNumeroLineaType(const RiferimentoNumeroLineaTypeList: IXMLRiferimentoNumeroLineaTypeList;
  const ACommaDelimitedInputStringVariant: Variant);
var
  AStringList: TStrings;
  I: Integer;
begin
  AStringList := TStringList.Create;
  try
    AStringList.CommaText := VarToStr(ACommaDelimitedInputStringVariant);
    for I := 0 to AStringList.Count - 1 do
      RiferimentoNumeroLineaTypeList.Add(StrToInt(AStringList[I]))
  finally
    AStringList.Free;
  end;
end;

procedure TFatturaPA.Compila_Sconto(const AScontoMaggiorazioneListNode: IXMLScontoMaggiorazioneTypeList; const AScontoPercentuale, AScontoImporto: Variant);
var
  AScontoPercentualeValue, AScontoImportoValue: double;
begin
  AScontoPercentualeValue := 0;
  if not VarIsNull(AScontoPercentuale) then
    AScontoPercentualeValue := AScontoPercentuale;
  AScontoImportoValue := 0;
  if not VarIsNull(AScontoImporto) then
    AScontoImportoValue := AScontoImporto;
  Self.Compila_Sconto(AScontoMaggiorazioneListNode, AScontoPercentualeValue, AScontoImportoValue);
end;

procedure TFatturaPA.ControllaAbilitazioneAliquotaIVA(ACodiceIVA: Integer);
var
  Qry: TIB_Cursor;
begin
  // Se è un rigo di riferimento...
  if (ACodiceIVA = -9) or (ACodiceIVA = 0) then
    Exit;
  Qry := TIB_Cursor.Create(Self);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    // IMposta la query che preleva i dati del sistema di backup
    Qry.SQL.Add('SELECT DESCRIZIONEIVA, PA_NATURA, ENABLED FROM ALIQIVA WHERE CODICEIVA = ' + IntTostr(ACodiceIVA));
    Qry.Open;
    // Solleva una eccezione se la natura IVA trovata non è abilitata
    if Qry.FieldByName('ENABLED').AsString <> 'T' then
      raise Exception.Create(Trim(Format('Aliquota IVA non abilitata: %d-%s %s', [ACodiceIVA, Qry.FieldByName('DESCRIZIONEIVA').AsString, Qry.FieldByName('PA_NATURA').AsString])));
    Qry.Close;
  finally
    Qry.Free;
  end;
end;

procedure TFatturaPA.ControllaPresenzaCodiceCIG;
begin
  if IsPA and not Documento.CodiceCIGPresente then
    raise Exception.Create('Manca il codice CIG'#13#13'NB: Il codice CIG è obbligatorio in caso di fattura ad una Pubblica Amministrazione');
end;

procedure TFatturaPA.Compila_Sconto(const AScontoMaggiorazioneListNode: IXMLScontoMaggiorazioneTypeList; const AScontoPercentuale, AScontoImporto: double);
var
  ATipoSconto: String;
begin
  // Determina se si tratta di sconto o maggiorazione e se non si tratta ne di uno
  // ne dell'altro esce
  if (AScontoPercentuale > 0) or (AScontoImporto > 0) then
    ATipoSconto := 'SC'
  else if (AScontoPercentuale < 0) or (AScontoImporto < 0) then
    ATipoSconto := 'MG'
  else
    Exit;
  // Se arriva qui genera il nuovo nodo sconto e lo riempie (NB: Valori assoluti)
  CurrentNode := AScontoMaggiorazioneListNode.Add;
  SetRequiredValue('Tipo', ATipoSconto, 2);
  SetValue('Percentuale', Abs(AScontoPercentuale), 2);
  SetValue('Importo', Abs(AScontoImporto), 2);
end;

function TFatturaPA.IsAssigned(const AValue: Variant; const AZeroPermitted: Boolean): Boolean;
begin
  // Init
  Result := False;
  // Prima di tutto verifica se il valore è nulla nel qual caso
  // esce subito e ritorna False
  if VarIsNull(AValue) then
    Exit;
  // Altrimenti in base al tipo di valore contenuto ne verifica l'assegnazione o meno
  // ed eventualmente scrive il valore nella fattura elettronica PA
  case VarType(AValue) of
    varUString, varString, varOleStr, varUStrArg, varStrArg:
      Result := Self.IsAssignedString(AValue);
    varSmallInt, varInteger, varShortint, varByte, varWord, varLongword, varInt64:
      Result := Self.IsAssignedInteger(AValue, AZeroPermitted);
    varSingle, varDouble, varCurrency:
      Result := Self.IsAssignedFloat(AValue, AZeroPermitted);
    varDate:
      Result := Self.IsAssignedDateTime(AValue);
  end;
end;

function TFatturaPA.IsAssigned(const AField: TField; const AZeroPermitted: Boolean): Boolean;
begin
  Result := Self.IsAssigned(AField.Value, AZeroPermitted);
end;

function TFatturaPA.IsAssignedDateTime(const AValue: TDateTime): Boolean;
begin
  Result := Self.IsAssignedFloat(AValue);
end;

function TFatturaPA.IsAssignedFloat(const AValue: double; const AZeroPermitted: Boolean): Boolean;
begin
  Result := (AValue <> 0) or AZeroPermitted;
end;

function TFatturaPA.IsAssignedInteger(const AValue: Integer; const AZeroPermitted: Boolean): Boolean;
begin
  Result := Self.IsAssignedFloat(AValue, AZeroPermitted);
end;

function TFatturaPA.IsAssignedString(const AValue: String): Boolean;
begin
  Result := (Trim(AValue) <> '');
end;

function TFatturaPA.IsCedenteCessionarioInverted(const ATD: String): Boolean;
begin
  result := (ATD='TD16')or(ATD='TD17')or(ATD='TD18')or(ATD='TD19')or(ATD='TD20');
end;

function TFatturaPA.IsIvaZero(const ACodiceIVA: Integer): Boolean;
var
  LCodiceIvaField, LTotaleImponibileField: TField;
  I: Integer;
begin
  for I := 1 to 4 do
  begin
    LCodiceIvaField := Documento.QryDocumento.FieldByName('CODICEIVA' + IntTostr(I));
    if LCodiceIvaField.IsNull or (LCodiceIvaField.AsInteger = 0) then
      Continue;
    if LCodiceIvaField.AsInteger = ACodiceIVA then
    begin
      LTotaleImponibileField := Documento.QryDocumento.FieldByName('TOTALEIMPONIBILE' + IntTostr(I));
      Result := LTotaleImponibileField.IsNull or (LTotaleImponibileField.AsFloat = 0);
      Exit;
    end;
  end;
end;

function TFatturaPA.IsPA: Boolean;
begin
  Result := QrySoggTIPOPERSONA.AsString = 'P';
end;

class function TFatturaPA.IsReadOnly(const ATipoDoc, AStatus: String): boolean;
var
  LO: TMemIniFile;
begin
  LO := TMemIniFile.Create(DM1.Repository_Layouts.FullLocalFileName);
  try
    // Se si tratta di fatture o note di credito e sono state già inviate/ricevute allora le rende NON MODIFICABILI
    Result := (  (ATipoDoc = 'Fattura') or (ATipoDoc = 'Fatt.acqui') or (ATipoDoc = 'Nota_accre') or (ATipoDoc = 'N.C.fornit')  )
      and (AStatus <> '') and (AStatus <> 'rtRejectedByProvider') and (AStatus <> 'rtSDIMessageNS') and (AStatus <> 'rtSDIMessageNERejected');
    // Se in base alle verifiche precedenti sono NON MODIFICABILI controlla anche l'apposito parametro
    //  del layouts.ini che permette di modificarle ugualmente
    if Result and LO.ReadBool(ATipoDoc, 'FattureElettronicheInviateRicevuteModificabili', False) then
    begin
      DM1.Messaggi('Levante', 'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13'A T T E N Z I O N E !!!'#13#13'La fattura elettronica è già stata inviata/ricevuta.'#13#13'Eventuali variazioni NON MODIFICHERANNO'' il relativo file XML.', '', [mbOK], 0, nil);
      Result := False;
    end;
  finally
    LO.Free;
  end;
end;

class function TFatturaPA.NotificationToString(const ANotificationType, ANotificationXML: string): string;
  function ExtractNS: string;
  var
    LNS: IeiNotificationNSmini;
    I: Integer;
  begin
    if ANotificationXML = '' then
      Exit;
    LNS := TeiNotificationMiniFactory.NewNotificationNSFromString(ANotificationXML);
    Result := '----------------------------------------------------------------------';
    Result := Result + Format(#13'NOTIFICA DI SCARTO (%d errori presenti)', [LNS.ListaErrori.Errore.Count]);
    for I := 0 to LNS.ListaErrori.Errore.Count - 1 do
    begin
      Result := Result + #13'----------------------------------------------------------------------';
      Result := Result + #13 + 'Codice......: ' + LNS.ListaErrori.Errore[I].Codice;
      Result := Result + #13 + 'Messaggio...: ' + LNS.ListaErrori.Errore[I].Descrizione;
      Result := Result + #13 + 'Suggerimento: ' + LNS.ListaErrori.Errore[I].Suggerimento;
    end;
    Result := Result + #13'----------------------------------------------------------------------';
    Result := Result + #13#13#13#13#13;
  end;
  function ExtractNE: string;
  var
    LNE: IeiNotificationNEmini;
    I: Integer;
    LSL: TStringStream;
  begin
    if ANotificationXML = '' then
      Exit;
    LNE := TeiNotificationMiniFactory.NewNotificationNEFromString(ANotificationXML);
    Result := Result + '----------------------------------------------------------------------';
    Result := Result + #13'NOTIFICA DI ESITO';
    Result := Result + #13'----------------------------------------------------------------------';
    if LNE.InvoiceAccepted then
      Result := Result + #13'Esito......: ACCETTATA'
    else
    begin
      Result := Result + #13'Esito......: RIFIUTATA';
      Result := Result + #13'Descrizione: ' + LNE.EsitoCommittente.Descrizione;
    end;
    Result := Result + #13'----------------------------------------------------------------------';
    Result := Result + #13#13#13#13#13;
  end;

begin
  Result := '';
  if ANotificationXML = '' then
    Exit
  else if ANotificationType = 'NS' then
    Result := ExtractNS
  else if LeftStr(ANotificationType, 2) = 'NE' then
    Result := ExtractNE;
  Result := Result + '-------------------------------- XML ---------------------------------'#13;
  Result := Result + ANotificationXML;
end;

procedure TFatturaPA.OpenQueries;
begin
  // Soggetti
  if QrySogg.Active then
    QrySogg.Close;
  QrySogg.Prepare;
  QrySogg.Params.ParamValues['P_CODICE'] := Documento.QryDocumentoCODICECLIENTE.Value;
  QrySogg.Open;
  // Causali
  if QryCausali.Active then
    QryCausali.Close;
  QryCausali.Prepare;
  QryCausali.Params.ParamValues['P_DESCRIZIONE'] := Documento.QryDocumentoCAUSALE.Value;
  QryCausali.Open;
  // Scadenze
  if QryScad.Active then
    QryScad.Close;
  QryScad.Prepare;
  QryScad.Params.ParamValues['P_TIPODOC'] := Documento.QryDocumentoTIPODOCUMENTO.Value;
  QryScad.Params.ParamValues['P_REGISTRO'] := Documento.QryDocumentoREGISTRO.Value;
  QryScad.Params.ParamValues['P_NUMDOC'] := Documento.QryDocumentoNUMORDPREV.Value;
  QryScad.Params.ParamValues['P_DATADOC'] := Documento.QryDocumentoDATADOCUMENTO.Value;
  QryScad.Open;
end;

function TFatturaPA.SetValue(const APropertyName: String; AValue: Variant; const ADecimalsOrMaxLength: Integer; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
begin
  // Init
  Result := False;
  // E' permesso lo zero e il valore è nullo allora lo imposta a zero
  if VarIsNull(AValue) and AZeroPermitted then
    AValue := 0.00;
  // Prima di tutto verifica se il valore è nulla nel qual caso
  // esce subito e ritorna False
  if VarIsNull(AValue) then
    Exit;
  // Altrimenti in base al tipo di valore contenuto ne verifica l'assegnazione o meno
  // ed eventualmente scrive il valore nella fattura elettronica PA
  case VarType(AValue) of
    varUString, varString, varOleStr, varUStrArg, varStrArg:
      Result := Self.SetValueString(APropertyName, AValue, ADecimalsOrMaxLength);
    varSmallInt, varInteger, varShortint, varByte, varWord, varLongword, varInt64:
      Result := Self.SetValueInteger(APropertyName, AValue);
    varSingle, varDouble, varCurrency:
      Result := Self.SetValueFloat(APropertyName, AValue, ADecimalsOrMaxLength, AZeroPermitted, AAbsoluteValue);
    varDate:
      Result := Self.SetValueDateTime(APropertyName, AValue);
  end;
end;

function TFatturaPA.SetRequiredValue(const APropertyName: String; const AValue: Variant; const ADecimalsOrMaxLength: Integer; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
begin
  Result := Self.SetValue(APropertyName, AValue, ADecimalsOrMaxLength, AZeroPermitted, AAbsoluteValue);
  if not Result then
    raise Exception.Create('Informazione mancante:'#13#13'Sezione (PA): "' + CurrentNode.NodeName + '"'#13'Campo (PA): "' + APropertyName + '"');
end;

function TFatturaPA.SaveToFile: Boolean;
var
  P: TMemIniFile;
begin
  // Imposta il ProgressivoInvio definitivo solo subito prima di fare
  // il SaveToFile in modo da evitare il più possibile dei buchi di numerazione
  // in caso di errori durante la compilazione della fattura elettronica
  // o se l'utente annulla il salvataggio.
  FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ProgressivoInvio := IntTostr(GetNextProgressivoInvio);
  SD1.FileName := Self.GetNomeFile;
  // Se necessario imposta la directory iniziale memorizzata
  P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
  try
    SD1.InitialDir := P.ReadString('FatturaElettronica', 'FatturaElettronicaDir', DM1.DesktopDir);
  finally
    P.Free;
  end;
  // Apre la dialog
  Result := SD1.Execute;
  if Result then
  begin
    // Esegue l'indentazione automatica dell'XML
    FFatturaPA.OwnerDocument.ParseOptions := FFatturaPA.OwnerDocument.ParseOptions + [poValidateOnParse] + [poPreserveWhiteSpace];
    FFatturaPA.OwnerDocument.Xml.Text := XMLDoc.FormatXMLData(FFatturaPA.OwnerDocument.Xml.Text);
    FFatturaPA.OwnerDocument.Active := True;
    // Save the document
    FFatturaPA.SaveToFile(SD1.FileName);
    // Persiste la directory utilizzata in modo da riproporla la prossima volta
    P := TMemIniFile.Create(DM1.Repository_Param_User.FullLocalFileName);
    try
      P.WriteString('FatturaElettronica', 'FatturaElettronicaDir', ExtractFileDir(SD1.FileName));
      P.UpdateFile;
    finally
      P.Free;
    end;
    // Copia anche il file XSL nella stessa posizione
    // CopyFileTo(DM1.CurrDir+XSL_FILE_NAME, ExtractFilePath(SD1.FileName)+XSL_FILE_NAME);
  end;
end;

procedure TFatturaPA.SendToProvider;
begin
  // Imposta il ProgressivoInvio definitivo solo subito prima di fare
  // il SaveToFile in modo da evitare il più possibile dei buchi di numerazione
  // in caso di errori durante la compilazione della fattura elettronica
  // o se l'utente annulla il salvataggio.
  FFatturaPA.FatturaElettronicaHeader.DatiTrasmissione.ProgressivoInvio := IntTostr(GetNextProgressivoInvio);
  // Esegue l'indentazione automatica dell'XML
  FFatturaPA.OwnerDocument.ParseOptions := FFatturaPA.OwnerDocument.ParseOptions + [poValidateOnParse] + [poPreserveWhiteSpace];
  FFatturaPA.OwnerDocument.Xml.Text := XMLDoc.FormatXMLData(FFatturaPA.OwnerDocument.Xml.Text);
  FFatturaPA.OwnerDocument.Active := True;
  // Salva la notifica per la nuova fattura
  DM2.SalvaNotificaFE(FDocumento.TipoDoc, FDocumento.Registro, FDocumento.NumeroDoc, FDocumento.DataDoc, 'rtReadyToSend', '', // FileName
    '', // MsgCode
    'Da inviare al provider', FFatturaPA.ToString, False, 10);
end;

class function TFatturaPA.SetNotificationDone(const AID: Integer; const ADone: Boolean): Boolean;
var
  Qry: TIB_Cursor;
  LDone: string;
begin
  Result := False;
  if DM1.Messaggi('Marca notifica come "FATTA"', 'ATTENZIONE!!!'#13#13#13'Questa operazione sarà subito definitiva.'#13#13'Proseguire?',
    'NB: Se si è all''interno di un documento e questa operazione sarà definitiva, anche se poi si decide di non confermare le modifiche del documento stesso.',
    [mbYes, mbNo], 0, nil) <> mrYes then
    Exit;
  if ADone then
    LDone := 'T'
  else
    LDone := 'F';
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRVORDCL_FE SET DONE = ' + QuotedStr(LDone) + ' WHERE ID = ' + IntTostr(AID));
    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

class function TFatturaPA.SetNotificationHide(const AID: Integer; const AHide: Boolean): Boolean;
var
  Qry: TIB_Cursor;
  LHide: string;
begin
  Result := False;
  if DM1.Messaggi('Nascondi notifica sul Teletrasporto', 'ATTENZIONE!!!'#13#13#13'Questa operazione sarà subito definitiva.'#13#13'Proseguire?',
    'NB: Se si è all''interno di un documento e questa operazione sarà definitiva, anche se poi si decide di non confermare le modifiche del documento stesso.',
    [mbYes, mbNo], 0, nil) <> mrYes then
    Exit;
  if AHide then
    LHide := 'T'
  else
    LHide := 'F';
  Qry := TIB_Cursor.Create(nil);
  try
    Qry.DatabaseName := DM1.ArcDBFile;
    Qry.IB_Connection := DM1.DBAzienda;
    Qry.SQL.Add('UPDATE PRVORDCL_FE SET HIDE = ' + QuotedStr(LHide) + ' WHERE ID = ' + IntTostr(AID));
    Qry.ExecSQL;
    Result := True;
  finally
    Qry.Free;
  end;
end;

function TFatturaPA.SetRequiredValue(const APropertyName: String; const AField: TField; const ADecimalsOrMaxLength: Integer; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
begin
  Result := Self.SetValue(APropertyName, AField, ADecimalsOrMaxLength, AZeroPermitted, AAbsoluteValue);
  if not Result then
    raise Exception.Create('Informazione mancante:'#13#13'Campo (Documento): "' + AField.Name + '"'#13#13'Sezione (PA): "' + CurrentNode.NodeName +
      '"'#13'Campo (PA): "' + APropertyName + '"');
end;

function TFatturaPA.SetRequiredValueStr(const APropertyName: String; const AValue: Variant; const AMaxLength, AMinLength: Integer): Boolean;
begin
  Result := Self.SetValueStr(APropertyName, AValue, AMaxLength, AMinLength);
  if not Result then
    raise Exception.Create('Informazione mancante:'#13#13'Sezione (PA): "' + CurrentNode.NodeName + '"'#13'Campo (PA): "' + APropertyName + '"');
end;

function TFatturaPA.SetRequiredValueStr(const APropertyName: String; const AField: TField; const AMaxLength, AMinLength: Integer): Boolean;
begin
  Result := Self.SetValueStr(APropertyName, AField, AMaxLength, AMinLength);
  if not Result then
    raise Exception.Create('Informazione mancante:'#13#13'Campo (Documento): "' + AField.Name + '"'#13#13'Sezione (PA): "' + CurrentNode.NodeName +
      '"'#13'Campo (PA): "' + APropertyName + '"');
end;

function TFatturaPA.SetValue(const APropertyName: String; const AField: TField; const ADecimalsOrMaxLength: Integer; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
begin
  Result := Self.SetValue(APropertyName, AField.Value, ADecimalsOrMaxLength, AZeroPermitted, AAbsoluteValue);
end;

function TFatturaPA.SetValueDateTime(const APropertyName: String; const AValue: TDateTime): Boolean;
begin
  Result := Self.IsAssignedDateTime(AValue);
  if Result then
    CurrentNode.ChildNodes[APropertyName].NodeValue := FormatDateTime('yyyy-mm-dd', AValue);
end;

function TFatturaPA.SetValueFloat(const APropertyName: String; const AValue: Variant; ADecimals: Byte; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
var
  ARealValue: double;
begin
  if VarIsNull(AValue) then
    ARealValue := 0
  else
    ARealValue := AValue;
  Result := Self.SetValueFloat(APropertyName, ARealValue, ADecimals, AZeroPermitted, AAbsoluteValue);
end;

function TFatturaPA.SetValueFloat(const APropertyName: String; AValue: double; ADecimals: Byte; const AZeroPermitted: Boolean;
  const AAbsoluteValue: Boolean): Boolean;
begin
  if ADecimals = 0 then
    ADecimals := 2;
  Result := Self.IsAssignedFloat(AValue) or AZeroPermitted;
  if Result then
  begin
    if AAbsoluteValue then
      AValue := Abs(AValue);
    CurrentNode.ChildNodes[APropertyName].NodeValue := FloatToStrF(AValue, ffFixed, 15, ADecimals, FFormatSettings);
  end;
end;

function TFatturaPA.SetValueInteger(const APropertyName: String; const AValue: Integer): Boolean;
begin
  Result := Self.IsAssignedInteger(AValue);
  if Result then
    CurrentNode.ChildNodes[APropertyName].NodeValue := IntTostr(AValue);
end;

function TFatturaPA.SetValueStr(const APropertyName: String; AValue: Variant; const AMaxLength, AMinLength: Integer): Boolean;
var
  LValueStr: String;
begin
  // Init
  Result := False;
  // COnverte il variant in stringa, se null ritorna una stringa vuota
  LValueStr := VarToStr(AValue);
  // Se il dato non è una stringa solleva un'eccezione
  Result := Self.SetValueString(APropertyName, LValueStr, AMaxLength, AMinLength);
end;

function TFatturaPA.SetValueStr(const APropertyName: String; const AField: TField; const AMaxLength, AMinLength: Integer): Boolean;
begin
  Result := Self.SetValueStr(APropertyName, AField.Value, AMaxLength, AMinLength);
end;

function TFatturaPA.SetValueString(const APropertyName: String; AValue: String; AMaxLength: Integer; const AMinLength: Integer): Boolean;
begin
  if AMaxLength = 0 then
    AMaxLength := 9999999;
  Result := Self.IsAssignedString(AValue);
  if Result then
  begin
    if Length(AValue) < AMinLength then
      raise Exception.Create
        (Format('Lunghezza del campo "%s.%s" non corretta:'#13#13'Numero minimo di caratteri previsti = %d'#13#13'Numero di caratteri presenti = %d  ("%s")',
        [CurrentNode.NodeName, APropertyName, AMinLength, Length(AValue), AValue]));
    AValue := TeiSanitizer.SanitizeXMLValueSpecialChars(AValue);
    CurrentNode.ChildNodes[APropertyName].NodeValue := LeftStr(Trim(AValue), AMaxLength);
  end;
end;

end.
