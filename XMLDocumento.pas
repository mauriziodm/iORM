
{******************************************************}
{                                                      }
{                   XML Data Binding                   }
{                                                      }
{         Generated on: 20/08/2004 18.24.57            }
{       Generated from: D:\Mondezza\XML1\fattura.xml   }
{   Settings stored in: D:\Mondezza\XML1\fattura.xdb   }
{                                                      }
{******************************************************}

unit XMLDocumento;

interface

uses XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLDocumentoType = interface;
  IXMLTipoNumDataType = interface;
  IXMLMittenteType = interface;
  IXMLIntestatarioType = interface;
  IXMLDestinazioneMerciType = interface;
  IXMLPraticheType = interface;
  IXMLVarieType = interface;
  IXMLDatiCausaleType = interface;
  IXMLTrasportoType = interface;
  IXMLStatoType = interface;
  IXMLSubSoggType = interface;
  IXMLDatiOperatoreType = interface;
  IXMLScadenzeType = interface;
  IXMLDatiPagamentoType = interface;
  IXMLTotaliType = interface;
  IXMLCorpoDocumentoType = interface;
  IXMLRigoType = interface;

{ IXMLDocumentoType }

  IXMLDocumentoType = interface(IXMLNode)
    ['{8D52A5BD-1088-49BE-A027-C5C51630D6DE}']
    { Property Accessors }
    function Get_TipoNumData: IXMLTipoNumDataType;
    function Get_Mittente: IXMLMittenteType;
    function Get_Intestatario: IXMLIntestatarioType;
    function Get_DestinazioneMerci: IXMLDestinazioneMerciType;
    function Get_Pratiche: IXMLPraticheType;
    function Get_Varie: IXMLVarieType;
    function Get_DatiCausale: IXMLDatiCausaleType;
    function Get_Trasporto: IXMLTrasportoType;
    function Get_Stato: IXMLStatoType;
    function Get_SubSogg: IXMLSubSoggType;
    function Get_DatiOperatore: IXMLDatiOperatoreType;
    function Get_Scadenze: IXMLScadenzeType;
    function Get_DatiPagamento: IXMLDatiPagamentoType;
    function Get_Totali: IXMLTotaliType;
    function Get_CorpoDocumento: IXMLCorpoDocumentoType;
    { Methods & Properties }
    property TipoNumData: IXMLTipoNumDataType read Get_TipoNumData;
    property Mittente: IXMLMittenteType read Get_Mittente;
    property Intestatario: IXMLIntestatarioType read Get_Intestatario;
    property DestinazioneMerci: IXMLDestinazioneMerciType read Get_DestinazioneMerci;
    property Pratiche: IXMLPraticheType read Get_Pratiche;
    property Varie: IXMLVarieType read Get_Varie;
    property DatiCausale: IXMLDatiCausaleType read Get_DatiCausale;
    property Trasporto: IXMLTrasportoType read Get_Trasporto;
    property Stato: IXMLStatoType read Get_Stato;
    property SubSogg: IXMLSubSoggType read Get_SubSogg;
    property DatiOperatore: IXMLDatiOperatoreType read Get_DatiOperatore;
    property Scadenze: IXMLScadenzeType read Get_Scadenze;
    property DatiPagamento: IXMLDatiPagamentoType read Get_DatiPagamento;
    property Totali: IXMLTotaliType read Get_Totali;
    property CorpoDocumento: IXMLCorpoDocumentoType read Get_CorpoDocumento;
  end;

{ IXMLTipoNumDataType }

  IXMLTipoNumDataType = interface(IXMLNode)
    ['{C2E68A38-0CEC-4CB5-8670-32D6B0C7939F}']
    { Property Accessors }
    function Get_TipoDocumento: WideString;
    function Get_Registro: WideString;
    function Get_NumOrdPrev: Integer;
    function Get_DataDocumento: WideString;
    function Get_TipoDocumentoEsteso: WideString;
    procedure Set_TipoDocumento(Value: WideString);
    procedure Set_Registro(Value: WideString);
    procedure Set_NumOrdPrev(Value: Integer);
    procedure Set_DataDocumento(Value: WideString);
    procedure Set_TipoDocumentoEsteso(Value: WideString);
    { Methods & Properties }
    property TipoDocumento: WideString read Get_TipoDocumento write Set_TipoDocumento;
    property Registro: WideString read Get_Registro write Set_Registro;
    property NumOrdPrev: Integer read Get_NumOrdPrev write Set_NumOrdPrev;
    property DataDocumento: WideString read Get_DataDocumento write Set_DataDocumento;
    property TipoDocumentoEsteso: WideString read Get_TipoDocumentoEsteso write Set_TipoDocumentoEsteso;
  end;

{ IXMLMittenteType }

  IXMLMittenteType = interface(IXMLNode)
    ['{D777E2B9-9439-42D7-A7D6-BBD406C86AF8}']
    { Property Accessors }
    function Get_MittRagSoc: WideString;
    function Get_MittIndirizzo: WideString;
    function Get_MittCitta: WideString;
    function Get_MittCAP: WideString;
    function Get_MittProvincia: WideString;
    function Get_MittPartitaIVA: WideString;
    function Get_MittTelefono: WideString;
    function Get_MittFax: WideString;
    function Get_MittEmail: WideString;
    procedure Set_MittRagSoc(Value: WideString);
    procedure Set_MittIndirizzo(Value: WideString);
    procedure Set_MittCitta(Value: WideString);
    procedure Set_MittCAP(Value: WideString);
    procedure Set_MittProvincia(Value: WideString);
    procedure Set_MittPartitaIVA(Value: WideString);
    procedure Set_MittTelefono(Value: WideString);
    procedure Set_MittFax(Value: WideString);
    procedure Set_MittEmail(Value: WideString);
    { Methods & Properties }
    property MittRagSoc: WideString read Get_MittRagSoc write Set_MittRagSoc;
    property MittIndirizzo: WideString read Get_MittIndirizzo write Set_MittIndirizzo;
    property MittCitta: WideString read Get_MittCitta write Set_MittCitta;
    property MittCAP: WideString read Get_MittCAP write Set_MittCAP;
    property MittProvincia: WideString read Get_MittProvincia write Set_MittProvincia;
    property MittPartitaIVA: WideString read Get_MittPartitaIVA write Set_MittPartitaIVA;
    property MittTelefono: WideString read Get_MittTelefono write Set_MittTelefono;
    property MittFax: WideString read Get_MittFax write Set_MittFax;
    property MittEmail: WideString read Get_MittEmail write Set_MittEmail;
end;

{ IXMLIntestatarioType }

  IXMLIntestatarioType = interface(IXMLNode)
    ['{79577D62-2F7C-4F2F-876C-CC8859012623}']
    { Property Accessors }
    function Get_CodiceCliente: Integer;
    function Get_RagSocCli: WideString;
    function Get_IndirizzoCli: WideString;
    function Get_CittaCli: WideString;
    function Get_CAPCli: WideString;
    function Get_ProvinciaCli: WideString;
    function Get_PartitaIVACli: WideString;
    procedure Set_CodiceCliente(Value: Integer);
    procedure Set_RagSocCli(Value: WideString);
    procedure Set_IndirizzoCli(Value: WideString);
    procedure Set_CittaCli(Value: WideString);
    procedure Set_CAPCli(Value: WideString);
    procedure Set_ProvinciaCli(Value: WideString);
    procedure Set_PartitaIVACli(Value: WideString);
    { Methods & Properties }
    property CodiceCliente: Integer read Get_CodiceCliente write Set_CodiceCliente;
    property RagSocCli: WideString read Get_RagSocCli write Set_RagSocCli;
    property IndirizzoCli: WideString read Get_IndirizzoCli write Set_IndirizzoCli;
    property CittaCli: WideString read Get_CittaCli write Set_CittaCli;
    property CAPCli: WideString read Get_CAPCli write Set_CAPCli;
    property ProvinciaCli: WideString read Get_ProvinciaCli write Set_ProvinciaCli;
    property PartitaIVACli: WideString read Get_PartitaIVACli write Set_PartitaIVACli;
  end;

{ IXMLDestinazioneMerciType }

  IXMLDestinazioneMerciType = interface(IXMLNode)
    ['{811D5842-1171-4D17-A98B-C0F7DFA87113}']
    { Property Accessors }
    function Get_CodiceDestMerci: Integer;
    function Get_RagSocDestMerci: WideString;
    function Get_IndirizzoDestMerci: WideString;
    function Get_CAPDestMerci: WideString;
    function Get_CittaDestMerci: WideString;
    function Get_ProvinciaDestMerci: WideString;
    procedure Set_CodiceDestMerci(Value: Integer);
    procedure Set_RagSocDestMerci(Value: WideString);
    procedure Set_IndirizzoDestMerci(Value: WideString);
    procedure Set_CAPDestMerci(Value: WideString);
    procedure Set_CittaDestMerci(Value: WideString);
    procedure Set_ProvinciaDestMerci(Value: WideString);
    { Methods & Properties }
    property CodiceDestMerci: Integer read Get_CodiceDestMerci write Set_CodiceDestMerci;
    property RagSocDestMerci: WideString read Get_RagSocDestMerci write Set_RagSocDestMerci;
    property IndirizzoDestMerci: WideString read Get_IndirizzoDestMerci write Set_IndirizzoDestMerci;
    property CAPDestMerci: WideString read Get_CAPDestMerci write Set_CAPDestMerci;
    property CittaDestMerci: WideString read Get_CittaDestMerci write Set_CittaDestMerci;
    property ProvinciaDestMerci: WideString read Get_ProvinciaDestMerci write Set_ProvinciaDestMerci;
  end;

{ IXMLPraticheType }

  IXMLPraticheType = interface(IXMLNode)
    ['{C7D9327A-896D-4093-9E0A-E421721237ED}']
    { Property Accessors }
    function Get_Pratica: Integer;
    function Get_Pratica2: Integer;
    function Get_Pratica3: Integer;
    function Get_DataPratica1: WideString;
    function Get_DataPratica2: WideString;
    function Get_DataPratica3: WideString;
    procedure Set_Pratica(Value: Integer);
    procedure Set_Pratica2(Value: Integer);
    procedure Set_Pratica3(Value: Integer);
    procedure Set_DataPratica1(Value: WideString);
    procedure Set_DataPratica2(Value: WideString);
    procedure Set_DataPratica3(Value: WideString);
    { Methods & Properties }
    property Pratica: Integer read Get_Pratica write Set_Pratica;
    property Pratica2: Integer read Get_Pratica2 write Set_Pratica2;
    property Pratica3: Integer read Get_Pratica3 write Set_Pratica3;
    property DataPratica1: WideString read Get_DataPratica1 write Set_DataPratica1;
    property DataPratica2: WideString read Get_DataPratica2 write Set_DataPratica2;
    property DataPratica3: WideString read Get_DataPratica3 write Set_DataPratica3;
  end;

{ IXMLVarieType }

  IXMLVarieType = interface(IXMLNode)
    ['{2385D294-0582-4F63-96FC-DE32423F74C3}']
    { Property Accessors }
    function Get_Selezionato: WideString;
    function Get_MeseCompetenza: Integer;
    function Get_CodiceMagazzino: Integer;
    function Get_Listino: Integer;
    function Get_Argomento: WideString;
    function Get_Note: WideString;
    function Get_Messaggi: WideString;
    function Get_Agente: Integer;
    function Get_SegnoOperazione: WideString;
    function Get_SegnoOperazioneCantiere: WideString;
    procedure Set_Selezionato(Value: WideString);
    procedure Set_MeseCompetenza(Value: Integer);
    procedure Set_CodiceMagazzino(Value: Integer);
    procedure Set_Listino(Value: Integer);
    procedure Set_Argomento(Value: WideString);
    procedure Set_Note(Value: WideString);
    procedure Set_Messaggi(Value: WideString);
    procedure Set_Agente(Value: Integer);
    procedure Set_SegnoOperazione(Value: WideString);
    procedure Set_SegnoOperazioneCantiere(Value: WideString);
    { Methods & Properties }
    property Selezionato: WideString read Get_Selezionato write Set_Selezionato;
    property MeseCompetenza: Integer read Get_MeseCompetenza write Set_MeseCompetenza;
    property CodiceMagazzino: Integer read Get_CodiceMagazzino write Set_CodiceMagazzino;
    property Listino: Integer read Get_Listino write Set_Listino;
    property Argomento: WideString read Get_Argomento write Set_Argomento;
    property Note: WideString read Get_Note write Set_Note;
    property Messaggi: WideString read Get_Messaggi write Set_Messaggi;
    property Agente: Integer read Get_Agente write Set_Agente;
    property SegnoOperazione: WideString read Get_SegnoOperazione write Set_SegnoOperazione;
    property SegnoOperazioneCantiere: WideString read Get_SegnoOperazioneCantiere write Set_SegnoOperazioneCantiere;
  end;

{ IXMLDatiCausaleType }

  IXMLDatiCausaleType = interface(IXMLNode)
    ['{60767C73-187D-4B36-BF6F-977178DA73D6}']
    { Property Accessors }
    function Get_Causale: WideString;
    function Get_SegnoOperazione: WideString;
    function Get_DaFatturare: WideString;
    procedure Set_Causale(Value: WideString);
    procedure Set_SegnoOperazione(Value: WideString);
    procedure Set_DaFatturare(Value: WideString);
    { Methods & Properties }
    property Causale: WideString read Get_Causale write Set_Causale;
    property SegnoOperazione: WideString read Get_SegnoOperazione write Set_SegnoOperazione;
    property DaFatturare: WideString read Get_DaFatturare write Set_DaFatturare;
  end;

{ IXMLTrasportoType }

  IXMLTrasportoType = interface(IXMLNode)
    ['{AD2E21C3-A4D0-47A3-8405-EA71CA28AE49}']
    { Property Accessors }
    function Get_TrasportoACura: WideString;
    function Get_DatiVettore: WideString;
    function Get_DataTrasp: WideString;
    function Get_OraTrasp: WideString;
    function Get_NumColli: Integer;
    function Get_AspettoEsterioreBeni: WideString;
    function Get_Porto: WideString;
    procedure Set_TrasportoACura(Value: WideString);
    procedure Set_DatiVettore(Value: WideString);
    procedure Set_DataTrasp(Value: WideString);
    procedure Set_OraTrasp(Value: WideString);
    procedure Set_NumColli(Value: Integer);
    procedure Set_AspettoEsterioreBeni(Value: WideString);
    procedure Set_Porto(Value: WideString);
    { Methods & Properties }
    property TrasportoACura: WideString read Get_TrasportoACura write Set_TrasportoACura;
    property DatiVettore: WideString read Get_DatiVettore write Set_DatiVettore;
    property DataTrasp: WideString read Get_DataTrasp write Set_DataTrasp;
    property OraTrasp: WideString read Get_OraTrasp write Set_OraTrasp;
    property NumColli: Integer read Get_NumColli write Set_NumColli;
    property AspettoEsterioreBeni: WideString read Get_AspettoEsterioreBeni write Set_AspettoEsterioreBeni;
    property Porto: WideString read Get_Porto write Set_Porto;
  end;

{ IXMLStatoType }

  IXMLStatoType = interface(IXMLNode)
    ['{32C3A050-B4CC-4A77-AFE3-1241CCD9F6A3}']
    { Property Accessors }
    function Get_StatoDescrizione: WideString;
    function Get_StatoForeground: WideString;
    function Get_StatoBackground: WideString;
    procedure Set_StatoDescrizione(Value: WideString);
    procedure Set_StatoForeground(Value: WideString);
    procedure Set_StatoBackground(Value: WideString);
    { Methods & Properties }
    property StatoDescrizione: WideString read Get_StatoDescrizione write Set_StatoDescrizione;
    property StatoForeground: WideString read Get_StatoForeground write Set_StatoForeground;
    property StatoBackground: WideString read Get_StatoBackground write Set_StatoBackground;
  end;

{ IXMLSubSoggType }

  IXMLSubSoggType = interface(IXMLNode)
    ['{AEDAFC65-6760-4B3E-AB5A-E3EB04E6665B}']
    { Property Accessors }
    function Get_CodiceSubSogg: Integer;
    function Get_SubSoggCampo1: WideString;
    function Get_SubSoggCampo2: WideString;
    function Get_SubSoggCampo3: WideString;
    procedure Set_CodiceSubSogg(Value: Integer);
    procedure Set_SubSoggCampo1(Value: WideString);
    procedure Set_SubSoggCampo2(Value: WideString);
    procedure Set_SubSoggCampo3(Value: WideString);
    { Methods & Properties }
    property CodiceSubSogg: Integer read Get_CodiceSubSogg write Set_CodiceSubSogg;
    property SubSoggCampo1: WideString read Get_SubSoggCampo1 write Set_SubSoggCampo1;
    property SubSoggCampo2: WideString read Get_SubSoggCampo2 write Set_SubSoggCampo2;
    property SubSoggCampo3: WideString read Get_SubSoggCampo3 write Set_SubSoggCampo3;
  end;

{ IXMLDatiOperatoreType }

  IXMLDatiOperatoreType = interface(IXMLNode)
    ['{4E072C1D-C0B0-40BB-809D-ADCCDA1AEFD7}']
    { Property Accessors }
    function Get_Operatore: WideString;
    function Get_ValiditaDocumento: WideString;
    function Get_Consegna: WideString;
    procedure Set_Operatore(Value: WideString);
    procedure Set_ValiditaDocumento(Value: WideString);
    procedure Set_Consegna(Value: WideString);
    { Methods & Properties }
    property Operatore: WideString read Get_Operatore write Set_Operatore;
    property ValiditaDocumento: WideString read Get_ValiditaDocumento write Set_ValiditaDocumento;
    property Consegna: WideString read Get_Consegna write Set_Consegna;
  end;

{ IXMLScadenzeType }

  IXMLScadenzeType = interface(IXMLNode)
    ['{9CF143B6-5884-4C7D-BA2A-0460C366AD8F}']
    { Property Accessors }
    function Get_DataScad1: WideString;
    function Get_DataScad2: WideString;
    function Get_DataScad3: WideString;
    function Get_DataScad4: WideString;
    function Get_DataScad5: WideString;
    function Get_ImportoScad1: WideString;
    function Get_ImportoScad2: WideString;
    function Get_ImportoScad3: WideString;
    function Get_ImportoScad4: WideString;
    function Get_ImportoScad5: WideString;
    procedure Set_DataScad1(Value: WideString);
    procedure Set_DataScad2(Value: WideString);
    procedure Set_DataScad3(Value: WideString);
    procedure Set_DataScad4(Value: WideString);
    procedure Set_DataScad5(Value: WideString);
    procedure Set_ImportoScad1(Value: WideString);
    procedure Set_ImportoScad2(Value: WideString);
    procedure Set_ImportoScad3(Value: WideString);
    procedure Set_ImportoScad4(Value: WideString);
    procedure Set_ImportoScad5(Value: WideString);
    { Methods & Properties }
    property DataScad1: WideString read Get_DataScad1 write Set_DataScad1;
    property DataScad2: WideString read Get_DataScad2 write Set_DataScad2;
    property DataScad3: WideString read Get_DataScad3 write Set_DataScad3;
    property DataScad4: WideString read Get_DataScad4 write Set_DataScad4;
    property DataScad5: WideString read Get_DataScad5 write Set_DataScad5;
    property ImportoScad1: WideString read Get_ImportoScad1 write Set_ImportoScad1;
    property ImportoScad2: WideString read Get_ImportoScad2 write Set_ImportoScad2;
    property ImportoScad3: WideString read Get_ImportoScad3 write Set_ImportoScad3;
    property ImportoScad4: WideString read Get_ImportoScad4 write Set_ImportoScad4;
    property ImportoScad5: WideString read Get_ImportoScad5 write Set_ImportoScad5;
  end;

{ IXMLDatiPagamentoType }

  IXMLDatiPagamentoType = interface(IXMLNode)
    ['{72963C65-59F2-48CE-A7FA-8A97587CF5ED}']
    { Property Accessors }
    function Get_Pagamento: Integer;
    function Get_ABI: WideString;
    function Get_CAB: WideString;
    procedure Set_Pagamento(Value: Integer);
    procedure Set_ABI(Value: WideString);
    procedure Set_CAB(Value: WideString);
    { Methods & Properties }
    property Pagamento: Integer read Get_Pagamento write Set_Pagamento;
    property ABI: WideString read Get_ABI write Set_ABI;
    property CAB: WideString read Get_CAB write Set_CAB;
  end;

{ IXMLTotaliType }

  IXMLTotaliType = interface(IXMLNode)
    ['{28F43B8C-B31E-4B79-85F3-3F88B3D95D93}']
    { Property Accessors }
    function Get_PrzUnitOpera: WideString;
    function Get_TotaleMargine: WideString;
    function Get_TotaleRighi1: WideString;
    function Get_TotaleRighi2: WideString;
    function Get_TotaleRighi3: WideString;
    function Get_TotaleRighi4: WideString;
    function Get_TotaleMerce: WideString;
    function Get_ScontoAliquota1: WideString;
    function Get_ScontoAliquota2: WideString;
    function Get_ScontoAliquota3: WideString;
    function Get_ScontoAliquota4: WideString;
    function Get_TotaleSconti: WideString;
    function Get_TotaleImponibile1: WideString;
    function Get_TotaleImponibile2: WideString;
    function Get_TotaleImponibile3: WideString;
    function Get_TotaleImponibile4: WideString;
    function Get_TotaleImponibile: WideString;
    function Get_CodiceIVA1: Integer;
    function Get_CodiceIVA2: Integer;
    function Get_CodiceIVA3: Integer;
    function Get_CodiceIVA4: Integer;
    function Get_ImportoIVA1: WideString;
    function Get_ImportoIVA2: WideString;
    function Get_ImportoIVA3: WideString;
    function Get_ImportoIVA4: WideString;
    function Get_TotaleIVA: WideString;
    function Get_TotaleNettoMerce: WideString;
    function Get_Spese: WideString;
    function Get_Abbuono: WideString;
    function Get_TotaleDocumento: WideString;
    function Get_TotaleDaPagare: WideString;
    procedure Set_PrzUnitOpera(Value: WideString);
    procedure Set_TotaleMargine(Value: WideString);
    procedure Set_TotaleRighi1(Value: WideString);
    procedure Set_TotaleRighi2(Value: WideString);
    procedure Set_TotaleRighi3(Value: WideString);
    procedure Set_TotaleRighi4(Value: WideString);
    procedure Set_TotaleMerce(Value: WideString);
    procedure Set_ScontoAliquota1(Value: WideString);
    procedure Set_ScontoAliquota2(Value: WideString);
    procedure Set_ScontoAliquota3(Value: WideString);
    procedure Set_ScontoAliquota4(Value: WideString);
    procedure Set_TotaleSconti(Value: WideString);
    procedure Set_TotaleImponibile1(Value: WideString);
    procedure Set_TotaleImponibile2(Value: WideString);
    procedure Set_TotaleImponibile3(Value: WideString);
    procedure Set_TotaleImponibile4(Value: WideString);
    procedure Set_TotaleImponibile(Value: WideString);
    procedure Set_CodiceIVA1(Value: Integer);
    procedure Set_CodiceIVA2(Value: Integer);
    procedure Set_CodiceIVA3(Value: Integer);
    procedure Set_CodiceIVA4(Value: Integer);
    procedure Set_ImportoIVA1(Value: WideString);
    procedure Set_ImportoIVA2(Value: WideString);
    procedure Set_ImportoIVA3(Value: WideString);
    procedure Set_ImportoIVA4(Value: WideString);
    procedure Set_TotaleIVA(Value: WideString);
    procedure Set_TotaleNettoMerce(Value: WideString);
    procedure Set_Spese(Value: WideString);
    procedure Set_Abbuono(Value: WideString);
    procedure Set_TotaleDocumento(Value: WideString);
    procedure Set_TotaleDaPagare(Value: WideString);
    { Methods & Properties }
    property PrzUnitOpera: WideString read Get_PrzUnitOpera write Set_PrzUnitOpera;
    property TotaleMargine: WideString read Get_TotaleMargine write Set_TotaleMargine;
    property TotaleRighi1: WideString read Get_TotaleRighi1 write Set_TotaleRighi1;
    property TotaleRighi2: WideString read Get_TotaleRighi2 write Set_TotaleRighi2;
    property TotaleRighi3: WideString read Get_TotaleRighi3 write Set_TotaleRighi3;
    property TotaleRighi4: WideString read Get_TotaleRighi4 write Set_TotaleRighi4;
    property TotaleMerce: WideString read Get_TotaleMerce write Set_TotaleMerce;
    property ScontoAliquota1: WideString read Get_ScontoAliquota1 write Set_ScontoAliquota1;
    property ScontoAliquota2: WideString read Get_ScontoAliquota2 write Set_ScontoAliquota2;
    property ScontoAliquota3: WideString read Get_ScontoAliquota3 write Set_ScontoAliquota3;
    property ScontoAliquota4: WideString read Get_ScontoAliquota4 write Set_ScontoAliquota4;
    property TotaleSconti: WideString read Get_TotaleSconti write Set_TotaleSconti;
    property TotaleImponibile1: WideString read Get_TotaleImponibile1 write Set_TotaleImponibile1;
    property TotaleImponibile2: WideString read Get_TotaleImponibile2 write Set_TotaleImponibile2;
    property TotaleImponibile3: WideString read Get_TotaleImponibile3 write Set_TotaleImponibile3;
    property TotaleImponibile4: WideString read Get_TotaleImponibile4 write Set_TotaleImponibile4;
    property TotaleImponibile: WideString read Get_TotaleImponibile write Set_TotaleImponibile;
    property CodiceIVA1: Integer read Get_CodiceIVA1 write Set_CodiceIVA1;
    property CodiceIVA2: Integer read Get_CodiceIVA2 write Set_CodiceIVA2;
    property CodiceIVA3: Integer read Get_CodiceIVA3 write Set_CodiceIVA3;
    property CodiceIVA4: Integer read Get_CodiceIVA4 write Set_CodiceIVA4;
    property ImportoIVA1: WideString read Get_ImportoIVA1 write Set_ImportoIVA1;
    property ImportoIVA2: WideString read Get_ImportoIVA2 write Set_ImportoIVA2;
    property ImportoIVA3: WideString read Get_ImportoIVA3 write Set_ImportoIVA3;
    property ImportoIVA4: WideString read Get_ImportoIVA4 write Set_ImportoIVA4;
    property TotaleIVA: WideString read Get_TotaleIVA write Set_TotaleIVA;
    property TotaleNettoMerce: WideString read Get_TotaleNettoMerce write Set_TotaleNettoMerce;
    property Spese: WideString read Get_Spese write Set_Spese;
    property Abbuono: WideString read Get_Abbuono write Set_Abbuono;
    property TotaleDocumento: WideString read Get_TotaleDocumento write Set_TotaleDocumento;
    property TotaleDaPagare: WideString read Get_TotaleDaPagare write Set_TotaleDaPagare;
  end;

{ IXMLCorpoDocumentoType }

  IXMLCorpoDocumentoType = interface(IXMLNodeCollection)
    ['{16B8F206-EE85-44BE-9744-1E20E51B2750}']
    { Property Accessors }
    function Get_Rigo(Index: Integer): IXMLRigoType;
    { Methods & Properties }
    function Add: IXMLRigoType;
    function Insert(const Index: Integer): IXMLRigoType;
    property Rigo[Index: Integer]: IXMLRigoType read Get_Rigo; default;
  end;

{ IXMLRigoType }

  IXMLRigoType = interface(IXMLNode)
    ['{F7602195-B0CB-4098-8873-B36FE411DE10}']
    { Property Accessors }
    function Get_TipoDocumento: WideString;
    function Get_NumOrdPrev: Integer;
    function Get_Registro: WideString;
    function Get_DataDocumento: WideString;
    function Get_ProgRigo: Integer;
    function Get_ProgRigo2: Integer;
    function Get_CodiceCliente: Integer;
    function Get_CodiceArticolo: WideString;
    function Get_Descrizione: WideString;
    function Get_PrezzoUnitario: WideString;
    function Get_PrezzoUnitarioIVACompresa: WideString;
    function Get_UnitaDiMisura: WideString;
    function Get_QTA: WideString;
    function Get_ScontoRigo: WideString;
    function Get_ScontoRigo2: WideString;
    function Get_ScontoRigo3: WideString;
    function Get_ImportoRigo: WideString;
    function Get_ImportoRigoIVACompresa: WideString;
    function Get_PrezzoAcquistoArticolo: WideString;
    function Get_CodiceIVA: Integer;
    function Get_Margine: WideString;
    function Get_MovMag: WideString;
    function Get_ImportoMargine: WideString;
    function Get_DescrizioneIVA: WideString;
    function Get_AliquotaIVA: WideString;
    function Get_CodiceMagazzino: Integer;
    function Get_PrzUnitOpera: WideString;
    function Get_QtaOpera: WideString;
    function Get_ImportoOpera: WideString;
    function Get_ImportoComponenti: WideString;
    function Get_NoteRigo: WideString;
    function Get_Selezionato: WideString;
    procedure Set_TipoDocumento(Value: WideString);
    procedure Set_NumOrdPrev(Value: Integer);
    procedure Set_Registro(Value: WideString);
    procedure Set_DataDocumento(Value: WideString);
    procedure Set_ProgRigo(Value: Integer);
    procedure Set_ProgRigo2(Value: Integer);
    procedure Set_CodiceCliente(Value: Integer);
    procedure Set_CodiceArticolo(Value: WideString);
    procedure Set_Descrizione(Value: WideString);
    procedure Set_PrezzoUnitario(Value: WideString);
    procedure Set_PrezzoUnitarioIVACompresa(Value: WideString);
    procedure Set_UnitaDiMisura(Value: WideString);
    procedure Set_QTA(Value: WideString);
    procedure Set_ScontoRigo(Value: WideString);
    procedure Set_ScontoRigo2(Value: WideString);
    procedure Set_ScontoRigo3(Value: WideString);
    procedure Set_ImportoRigo(Value: WideString);
    procedure Set_ImportoRigoIVACompresa(Value: WideString);
    procedure Set_PrezzoAcquistoArticolo(Value: WideString);
    procedure Set_CodiceIVA(Value: Integer);
    procedure Set_Margine(Value: WideString);
    procedure Set_MovMag(Value: WideString);
    procedure Set_ImportoMargine(Value: WideString);
    procedure Set_DescrizioneIVA(Value: WideString);
    procedure Set_AliquotaIVA(Value: WideString);
    procedure Set_CodiceMagazzino(Value: Integer);
    procedure Set_PrzUnitOpera(Value: WideString);
    procedure Set_QtaOpera(Value: WideString);
    procedure Set_ImportoOpera(Value: WideString);
    procedure Set_ImportoComponenti(Value: WideString);
    procedure Set_NoteRigo(Value: WideString);
    procedure Set_Selezionato(Value: WideString);
    { Methods & Properties }
    property TipoDocumento: WideString read Get_TipoDocumento write Set_TipoDocumento;
    property NumOrdPrev: Integer read Get_NumOrdPrev write Set_NumOrdPrev;
    property Registro: WideString read Get_Registro write Set_Registro;
    property DataDocumento: WideString read Get_DataDocumento write Set_DataDocumento;
    property ProgRigo: Integer read Get_ProgRigo write Set_ProgRigo;
    property ProgRigo2: Integer read Get_ProgRigo2 write Set_ProgRigo2;
    property CodiceCliente: Integer read Get_CodiceCliente write Set_CodiceCliente;
    property CodiceArticolo: WideString read Get_CodiceArticolo write Set_CodiceArticolo;
    property Descrizione: WideString read Get_Descrizione write Set_Descrizione;
    property PrezzoUnitario: WideString read Get_PrezzoUnitario write Set_PrezzoUnitario;
    property PrezzoUnitarioIVACompresa: WideString read Get_PrezzoUnitarioIVACompresa write Set_PrezzoUnitarioIVACompresa;
    property UnitaDiMisura: WideString read Get_UnitaDiMisura write Set_UnitaDiMisura;
    property QTA: WideString read Get_QTA write Set_QTA;
    property ScontoRigo: WideString read Get_ScontoRigo write Set_ScontoRigo;
    property ScontoRigo2: WideString read Get_ScontoRigo2 write Set_ScontoRigo2;
    property ScontoRigo3: WideString read Get_ScontoRigo3 write Set_ScontoRigo3;
    property ImportoRigo: WideString read Get_ImportoRigo write Set_ImportoRigo;
    property ImportoRigoIVACompresa: WideString read Get_ImportoRigoIVACompresa write Set_ImportoRigoIVACompresa;
    property PrezzoAcquistoArticolo: WideString read Get_PrezzoAcquistoArticolo write Set_PrezzoAcquistoArticolo;
    property CodiceIVA: Integer read Get_CodiceIVA write Set_CodiceIVA;
    property Margine: WideString read Get_Margine write Set_Margine;
    property MovMag: WideString read Get_MovMag write Set_MovMag;
    property ImportoMargine: WideString read Get_ImportoMargine write Set_ImportoMargine;
    property DescrizioneIVA: WideString read Get_DescrizioneIVA write Set_DescrizioneIVA;
    property AliquotaIVA: WideString read Get_AliquotaIVA write Set_AliquotaIVA;
    property CodiceMagazzino: Integer read Get_CodiceMagazzino write Set_CodiceMagazzino;
    property PrzUnitOpera: WideString read Get_PrzUnitOpera write Set_PrzUnitOpera;
    property QtaOpera: WideString read Get_QtaOpera write Set_QtaOpera;
    property ImportoOpera: WideString read Get_ImportoOpera write Set_ImportoOpera;
    property ImportoComponenti: WideString read Get_ImportoComponenti write Set_ImportoComponenti;
    property NoteRigo: WideString read Get_NoteRigo write Set_NoteRigo;
    property Selezionato: WideString read Get_Selezionato write Set_Selezionato;
  end;

{ Forward Decls }

  TXMLDocumentoType = class;
  TXMLTipoNumDataType = class;
  TXMLMittenteType = class;
  TXMLIntestatarioType = class;
  TXMLDestinazioneMerciType = class;
  TXMLPraticheType = class;
  TXMLVarieType = class;
  TXMLDatiCausaleType = class;
  TXMLTrasportoType = class;
  TXMLStatoType = class;
  TXMLSubSoggType = class;
  TXMLDatiOperatoreType = class;
  TXMLScadenzeType = class;
  TXMLDatiPagamentoType = class;
  TXMLTotaliType = class;
  TXMLCorpoDocumentoType = class;
  TXMLRigoType = class;

{ TXMLDocumentoType }

  TXMLDocumentoType = class(TXMLNode, IXMLDocumentoType)
  protected
    { IXMLDocumentoType }
    function Get_TipoNumData: IXMLTipoNumDataType;
    function Get_Mittente: IXMLMittenteType;
    function Get_Intestatario: IXMLIntestatarioType;
    function Get_DestinazioneMerci: IXMLDestinazioneMerciType;
    function Get_Pratiche: IXMLPraticheType;
    function Get_Varie: IXMLVarieType;
    function Get_DatiCausale: IXMLDatiCausaleType;
    function Get_Trasporto: IXMLTrasportoType;
    function Get_Stato: IXMLStatoType;
    function Get_SubSogg: IXMLSubSoggType;
    function Get_DatiOperatore: IXMLDatiOperatoreType;
    function Get_Scadenze: IXMLScadenzeType;
    function Get_DatiPagamento: IXMLDatiPagamentoType;
    function Get_Totali: IXMLTotaliType;
    function Get_CorpoDocumento: IXMLCorpoDocumentoType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTipoNumDataType }

  TXMLTipoNumDataType = class(TXMLNode, IXMLTipoNumDataType)
  protected
    { IXMLTipoNumDataType }
    function Get_TipoDocumento: WideString;
    function Get_Registro: WideString;
    function Get_NumOrdPrev: Integer;
    function Get_DataDocumento: WideString;
    function Get_TipoDocumentoEsteso: WideString;
    procedure Set_TipoDocumento(Value: WideString);
    procedure Set_Registro(Value: WideString);
    procedure Set_NumOrdPrev(Value: Integer);
    procedure Set_DataDocumento(Value: WideString);
    procedure Set_TipoDocumentoEsteso(Value: WideString);
  end;

{ TXMLMittenteType }

  TXMLMittenteType = class(TXMLNode, IXMLMittenteType)
  protected
    { IXMLIntestatarioType }
    function Get_MittRagSoc: WideString;
    function Get_MittIndirizzo: WideString;
    function Get_MittCitta: WideString;
    function Get_MittCAP: WideString;
    function Get_MittProvincia: WideString;
    function Get_MittPartitaIVA: WideString;
    function Get_MittTelefono: WideString;
    function Get_MittFax: WideString;
    function Get_MittEmail: WideString;
    procedure Set_MittRagSoc(Value: WideString);
    procedure Set_MittIndirizzo(Value: WideString);
    procedure Set_MittCitta(Value: WideString);
    procedure Set_MittCAP(Value: WideString);
    procedure Set_MittProvincia(Value: WideString);
    procedure Set_MittPartitaIVA(Value: WideString);
    procedure Set_MittTelefono(Value: WideString);
    procedure Set_MittFax(Value: WideString);
    procedure Set_MittEmail(Value: WideString);
  end;

{ TXMLIntestatarioType }

  TXMLIntestatarioType = class(TXMLNode, IXMLIntestatarioType)
  protected
    { IXMLIntestatarioType }
    function Get_CodiceCliente: Integer;
    function Get_RagSocCli: WideString;
    function Get_IndirizzoCli: WideString;
    function Get_CittaCli: WideString;
    function Get_CAPCli: WideString;
    function Get_ProvinciaCli: WideString;
    function Get_PartitaIVACli: WideString;
    procedure Set_CodiceCliente(Value: Integer);
    procedure Set_RagSocCli(Value: WideString);
    procedure Set_IndirizzoCli(Value: WideString);
    procedure Set_CittaCli(Value: WideString);
    procedure Set_CAPCli(Value: WideString);
    procedure Set_ProvinciaCli(Value: WideString);
    procedure Set_PartitaIVACli(Value: WideString);
  end;

{ TXMLDestinazioneMerciType }

  TXMLDestinazioneMerciType = class(TXMLNode, IXMLDestinazioneMerciType)
  protected
    { IXMLDestinazioneMerciType }
    function Get_CodiceDestMerci: Integer;
    function Get_RagSocDestMerci: WideString;
    function Get_IndirizzoDestMerci: WideString;
    function Get_CAPDestMerci: WideString;
    function Get_CittaDestMerci: WideString;
    function Get_ProvinciaDestMerci: WideString;
    procedure Set_CodiceDestMerci(Value: Integer);
    procedure Set_RagSocDestMerci(Value: WideString);
    procedure Set_IndirizzoDestMerci(Value: WideString);
    procedure Set_CAPDestMerci(Value: WideString);
    procedure Set_CittaDestMerci(Value: WideString);
    procedure Set_ProvinciaDestMerci(Value: WideString);
  end;

{ TXMLPraticheType }

  TXMLPraticheType = class(TXMLNode, IXMLPraticheType)
  protected
    { IXMLPraticheType }
    function Get_Pratica: Integer;
    function Get_Pratica2: Integer;
    function Get_Pratica3: Integer;
    function Get_DataPratica1: WideString;
    function Get_DataPratica2: WideString;
    function Get_DataPratica3: WideString;
    procedure Set_Pratica(Value: Integer);
    procedure Set_Pratica2(Value: Integer);
    procedure Set_Pratica3(Value: Integer);
    procedure Set_DataPratica1(Value: WideString);
    procedure Set_DataPratica2(Value: WideString);
    procedure Set_DataPratica3(Value: WideString);
  end;

{ TXMLVarieType }

  TXMLVarieType = class(TXMLNode, IXMLVarieType)
  protected
    { IXMLVarieType }
    function Get_Selezionato: WideString;
    function Get_MeseCompetenza: Integer;
    function Get_CodiceMagazzino: Integer;
    function Get_Listino: Integer;
    function Get_Argomento: WideString;
    function Get_Note: WideString;
    function Get_Messaggi: WideString;
    function Get_Agente: Integer;
    function Get_SegnoOperazione: WideString;
    function Get_SegnoOperazioneCantiere: WideString;
    procedure Set_Selezionato(Value: WideString);
    procedure Set_MeseCompetenza(Value: Integer);
    procedure Set_CodiceMagazzino(Value: Integer);
    procedure Set_Listino(Value: Integer);
    procedure Set_Argomento(Value: WideString);
    procedure Set_Note(Value: WideString);
    procedure Set_Messaggi(Value: WideString);
    procedure Set_Agente(Value: Integer);
    procedure Set_SegnoOperazione(Value: WideString);
    procedure Set_SegnoOperazioneCantiere(Value: WideString);
  end;

{ TXMLDatiCausaleType }

  TXMLDatiCausaleType = class(TXMLNode, IXMLDatiCausaleType)
  protected
    { IXMLDatiCausaleType }
    function Get_Causale: WideString;
    function Get_SegnoOperazione: WideString;
    function Get_DaFatturare: WideString;
    procedure Set_Causale(Value: WideString);
    procedure Set_SegnoOperazione(Value: WideString);
    procedure Set_DaFatturare(Value: WideString);
  end;

{ TXMLTrasportoType }

  TXMLTrasportoType = class(TXMLNode, IXMLTrasportoType)
  protected
    { IXMLTrasportoType }
    function Get_TrasportoACura: WideString;
    function Get_DatiVettore: WideString;
    function Get_DataTrasp: WideString;
    function Get_OraTrasp: WideString;
    function Get_NumColli: Integer;
    function Get_AspettoEsterioreBeni: WideString;
    function Get_Porto: WideString;
    procedure Set_TrasportoACura(Value: WideString);
    procedure Set_DatiVettore(Value: WideString);
    procedure Set_DataTrasp(Value: WideString);
    procedure Set_OraTrasp(Value: WideString);
    procedure Set_NumColli(Value: Integer);
    procedure Set_AspettoEsterioreBeni(Value: WideString);
    procedure Set_Porto(Value: WideString);
  end;

{ TXMLStatoType }

  TXMLStatoType = class(TXMLNode, IXMLStatoType)
  protected
    { IXMLStatoType }
    function Get_StatoDescrizione: WideString;
    function Get_StatoForeground: WideString;
    function Get_StatoBackground: WideString;
    procedure Set_StatoDescrizione(Value: WideString);
    procedure Set_StatoForeground(Value: WideString);
    procedure Set_StatoBackground(Value: WideString);
  end;

{ TXMLSubSoggType }

  TXMLSubSoggType = class(TXMLNode, IXMLSubSoggType)
  protected
    { IXMLSubSoggType }
    function Get_CodiceSubSogg: Integer;
    function Get_SubSoggCampo1: WideString;
    function Get_SubSoggCampo2: WideString;
    function Get_SubSoggCampo3: WideString;
    procedure Set_CodiceSubSogg(Value: Integer);
    procedure Set_SubSoggCampo1(Value: WideString);
    procedure Set_SubSoggCampo2(Value: WideString);
    procedure Set_SubSoggCampo3(Value: WideString);
  end;

{ TXMLDatiOperatoreType }

  TXMLDatiOperatoreType = class(TXMLNode, IXMLDatiOperatoreType)
  protected
    { IXMLDatiOperatoreType }
    function Get_Operatore: WideString;
    function Get_ValiditaDocumento: WideString;
    function Get_Consegna: WideString;
    procedure Set_Operatore(Value: WideString);
    procedure Set_ValiditaDocumento(Value: WideString);
    procedure Set_Consegna(Value: WideString);
  end;

{ TXMLScadenzeType }

  TXMLScadenzeType = class(TXMLNode, IXMLScadenzeType)
  protected
    { IXMLScadenzeType }
    function Get_DataScad1: WideString;
    function Get_DataScad2: WideString;
    function Get_DataScad3: WideString;
    function Get_DataScad4: WideString;
    function Get_DataScad5: WideString;
    function Get_ImportoScad1: WideString;
    function Get_ImportoScad2: WideString;
    function Get_ImportoScad3: WideString;
    function Get_ImportoScad4: WideString;
    function Get_ImportoScad5: WideString;
    procedure Set_DataScad1(Value: WideString);
    procedure Set_DataScad2(Value: WideString);
    procedure Set_DataScad3(Value: WideString);
    procedure Set_DataScad4(Value: WideString);
    procedure Set_DataScad5(Value: WideString);
    procedure Set_ImportoScad1(Value: WideString);
    procedure Set_ImportoScad2(Value: WideString);
    procedure Set_ImportoScad3(Value: WideString);
    procedure Set_ImportoScad4(Value: WideString);
    procedure Set_ImportoScad5(Value: WideString);
  end;

{ TXMLDatiPagamentoType }

  TXMLDatiPagamentoType = class(TXMLNode, IXMLDatiPagamentoType)
  protected
    { IXMLDatiPagamentoType }
    function Get_Pagamento: Integer;
    function Get_ABI: WideString;
    function Get_CAB: WideString;
    procedure Set_Pagamento(Value: Integer);
    procedure Set_ABI(Value: WideString);
    procedure Set_CAB(Value: WideString);
  end;

{ TXMLTotaliType }

  TXMLTotaliType = class(TXMLNode, IXMLTotaliType)
  protected
    { IXMLTotaliType }
    function Get_PrzUnitOpera: WideString;
    function Get_TotaleMargine: WideString;
    function Get_TotaleRighi1: WideString;
    function Get_TotaleRighi2: WideString;
    function Get_TotaleRighi3: WideString;
    function Get_TotaleRighi4: WideString;
    function Get_TotaleMerce: WideString;
    function Get_ScontoAliquota1: WideString;
    function Get_ScontoAliquota2: WideString;
    function Get_ScontoAliquota3: WideString;
    function Get_ScontoAliquota4: WideString;
    function Get_TotaleSconti: WideString;
    function Get_TotaleImponibile1: WideString;
    function Get_TotaleImponibile2: WideString;
    function Get_TotaleImponibile3: WideString;
    function Get_TotaleImponibile4: WideString;
    function Get_TotaleImponibile: WideString;
    function Get_CodiceIVA1: Integer;
    function Get_CodiceIVA2: Integer;
    function Get_CodiceIVA3: Integer;
    function Get_CodiceIVA4: Integer;
    function Get_ImportoIVA1: WideString;
    function Get_ImportoIVA2: WideString;
    function Get_ImportoIVA3: WideString;
    function Get_ImportoIVA4: WideString;
    function Get_TotaleIVA: WideString;
    function Get_TotaleNettoMerce: WideString;
    function Get_Spese: WideString;
    function Get_Abbuono: WideString;
    function Get_TotaleDocumento: WideString;
    function Get_TotaleDaPagare: WideString;
    procedure Set_PrzUnitOpera(Value: WideString);
    procedure Set_TotaleMargine(Value: WideString);
    procedure Set_TotaleRighi1(Value: WideString);
    procedure Set_TotaleRighi2(Value: WideString);
    procedure Set_TotaleRighi3(Value: WideString);
    procedure Set_TotaleRighi4(Value: WideString);
    procedure Set_TotaleMerce(Value: WideString);
    procedure Set_ScontoAliquota1(Value: WideString);
    procedure Set_ScontoAliquota2(Value: WideString);
    procedure Set_ScontoAliquota3(Value: WideString);
    procedure Set_ScontoAliquota4(Value: WideString);
    procedure Set_TotaleSconti(Value: WideString);
    procedure Set_TotaleImponibile1(Value: WideString);
    procedure Set_TotaleImponibile2(Value: WideString);
    procedure Set_TotaleImponibile3(Value: WideString);
    procedure Set_TotaleImponibile4(Value: WideString);
    procedure Set_TotaleImponibile(Value: WideString);
    procedure Set_CodiceIVA1(Value: Integer);
    procedure Set_CodiceIVA2(Value: Integer);
    procedure Set_CodiceIVA3(Value: Integer);
    procedure Set_CodiceIVA4(Value: Integer);
    procedure Set_ImportoIVA1(Value: WideString);
    procedure Set_ImportoIVA2(Value: WideString);
    procedure Set_ImportoIVA3(Value: WideString);
    procedure Set_ImportoIVA4(Value: WideString);
    procedure Set_TotaleIVA(Value: WideString);
    procedure Set_TotaleNettoMerce(Value: WideString);
    procedure Set_Spese(Value: WideString);
    procedure Set_Abbuono(Value: WideString);
    procedure Set_TotaleDocumento(Value: WideString);
    procedure Set_TotaleDaPagare(Value: WideString);
  end;

{ TXMLCorpoDocumentoType }

  TXMLCorpoDocumentoType = class(TXMLNodeCollection, IXMLCorpoDocumentoType)
  protected
    { IXMLCorpoDocumentoType }
    function Get_Rigo(Index: Integer): IXMLRigoType;
    function Add: IXMLRigoType;
    function Insert(const Index: Integer): IXMLRigoType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRigoType }

  TXMLRigoType = class(TXMLNode, IXMLRigoType)
  protected
    { IXMLRigoType }
    function Get_TipoDocumento: WideString;
    function Get_NumOrdPrev: Integer;
    function Get_Registro: WideString;
    function Get_DataDocumento: WideString;
    function Get_ProgRigo: Integer;
    function Get_ProgRigo2: Integer;
    function Get_CodiceCliente: Integer;
    function Get_CodiceArticolo: WideString;
    function Get_Descrizione: WideString;
    function Get_PrezzoUnitario: WideString;
    function Get_PrezzoUnitarioIVACompresa: WideString;
    function Get_UnitaDiMisura: WideString;
    function Get_QTA: WideString;
    function Get_ScontoRigo: WideString;
    function Get_ScontoRigo2: WideString;
    function Get_ScontoRigo3: WideString;
    function Get_ImportoRigo: WideString;
    function Get_ImportoRigoIVACompresa: WideString;
    function Get_PrezzoAcquistoArticolo: WideString;
    function Get_CodiceIVA: Integer;
    function Get_Margine: WideString;
    function Get_MovMag: WideString;
    function Get_ImportoMargine: WideString;
    function Get_DescrizioneIVA: WideString;
    function Get_AliquotaIVA: WideString;
    function Get_CodiceMagazzino: Integer;
    function Get_PrzUnitOpera: WideString;
    function Get_QtaOpera: WideString;
    function Get_ImportoOpera: WideString;
    function Get_ImportoComponenti: WideString;
    function Get_NoteRigo: WideString;
    function Get_Selezionato: WideString;
    procedure Set_TipoDocumento(Value: WideString);
    procedure Set_NumOrdPrev(Value: Integer);
    procedure Set_Registro(Value: WideString);
    procedure Set_DataDocumento(Value: WideString);
    procedure Set_ProgRigo(Value: Integer);
    procedure Set_ProgRigo2(Value: Integer);
    procedure Set_CodiceCliente(Value: Integer);
    procedure Set_CodiceArticolo(Value: WideString);
    procedure Set_Descrizione(Value: WideString);
    procedure Set_PrezzoUnitario(Value: WideString);
    procedure Set_PrezzoUnitarioIVACompresa(Value: WideString);
    procedure Set_UnitaDiMisura(Value: WideString);
    procedure Set_QTA(Value: WideString);
    procedure Set_ScontoRigo(Value: WideString);
    procedure Set_ScontoRigo2(Value: WideString);
    procedure Set_ScontoRigo3(Value: WideString);
    procedure Set_ImportoRigo(Value: WideString);
    procedure Set_ImportoRigoIVACompresa(Value: WideString);
    procedure Set_PrezzoAcquistoArticolo(Value: WideString);
    procedure Set_CodiceIVA(Value: Integer);
    procedure Set_Margine(Value: WideString);
    procedure Set_MovMag(Value: WideString);
    procedure Set_ImportoMargine(Value: WideString);
    procedure Set_DescrizioneIVA(Value: WideString);
    procedure Set_AliquotaIVA(Value: WideString);
    procedure Set_CodiceMagazzino(Value: Integer);
    procedure Set_PrzUnitOpera(Value: WideString);
    procedure Set_QtaOpera(Value: WideString);
    procedure Set_ImportoOpera(Value: WideString);
    procedure Set_ImportoComponenti(Value: WideString);
    procedure Set_NoteRigo(Value: WideString);
    procedure Set_Selezionato(Value: WideString);
  end;

{ Global Functions }

function GetDocumento(Doc: IXMLDocument): IXMLDocumentoType;
function LoadDocumento(const FileName: WideString): IXMLDocumentoType;
function NewDocumento: IXMLDocumentoType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetDocumento(Doc: IXMLDocument): IXMLDocumentoType;
begin
  Result := Doc.GetDocBinding('Documento', TXMLDocumentoType, TargetNamespace) as IXMLDocumentoType;
end;

function LoadDocumento(const FileName: WideString): IXMLDocumentoType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('Documento', TXMLDocumentoType, TargetNamespace) as IXMLDocumentoType;
end;

function NewDocumento: IXMLDocumentoType;
begin
  Result := NewXMLDocument.GetDocBinding('Documento', TXMLDocumentoType, TargetNamespace) as IXMLDocumentoType;
end;

{ TXMLDocumentoType }

procedure TXMLDocumentoType.AfterConstruction;
begin
  RegisterChildNode('TipoNumData', TXMLTipoNumDataType);
  RegisterChildNode('Mittente', TXMLMittenteType);
  RegisterChildNode('Intestatario', TXMLIntestatarioType);
  RegisterChildNode('DestinazioneMerci', TXMLDestinazioneMerciType);
  RegisterChildNode('Pratiche', TXMLPraticheType);
  RegisterChildNode('Varie', TXMLVarieType);
  RegisterChildNode('DatiCausale', TXMLDatiCausaleType);
  RegisterChildNode('Trasporto', TXMLTrasportoType);
  RegisterChildNode('Stato', TXMLStatoType);
  RegisterChildNode('SubSogg', TXMLSubSoggType);
  RegisterChildNode('DatiOperatore', TXMLDatiOperatoreType);
  RegisterChildNode('Scadenze', TXMLScadenzeType);
  RegisterChildNode('DatiPagamento', TXMLDatiPagamentoType);
  RegisterChildNode('Totali', TXMLTotaliType);
  RegisterChildNode('CorpoDocumento', TXMLCorpoDocumentoType);
  inherited;
end;

function TXMLDocumentoType.Get_TipoNumData: IXMLTipoNumDataType;
begin
  Result := ChildNodes['TipoNumData'] as IXMLTipoNumDataType;
end;

function TXMLDocumentoType.Get_Mittente: IXMLMittenteType;
begin
  Result := ChildNodes['Mittente'] as IXMLMittenteType;
end;

function TXMLDocumentoType.Get_Intestatario: IXMLIntestatarioType;
begin
  Result := ChildNodes['Intestatario'] as IXMLIntestatarioType;
end;

function TXMLDocumentoType.Get_DestinazioneMerci: IXMLDestinazioneMerciType;
begin
  Result := ChildNodes['DestinazioneMerci'] as IXMLDestinazioneMerciType;
end;

function TXMLDocumentoType.Get_Pratiche: IXMLPraticheType;
begin
  Result := ChildNodes['Pratiche'] as IXMLPraticheType;
end;

function TXMLDocumentoType.Get_Varie: IXMLVarieType;
begin
  Result := ChildNodes['Varie'] as IXMLVarieType;
end;

function TXMLDocumentoType.Get_DatiCausale: IXMLDatiCausaleType;
begin
  Result := ChildNodes['DatiCausale'] as IXMLDatiCausaleType;
end;

function TXMLDocumentoType.Get_Trasporto: IXMLTrasportoType;
begin
  Result := ChildNodes['Trasporto'] as IXMLTrasportoType;
end;

function TXMLDocumentoType.Get_Stato: IXMLStatoType;
begin
  Result := ChildNodes['Stato'] as IXMLStatoType;
end;

function TXMLDocumentoType.Get_SubSogg: IXMLSubSoggType;
begin
  Result := ChildNodes['SubSogg'] as IXMLSubSoggType;
end;

function TXMLDocumentoType.Get_DatiOperatore: IXMLDatiOperatoreType;
begin
  Result := ChildNodes['DatiOperatore'] as IXMLDatiOperatoreType;
end;

function TXMLDocumentoType.Get_Scadenze: IXMLScadenzeType;
begin
  Result := ChildNodes['Scadenze'] as IXMLScadenzeType;
end;

function TXMLDocumentoType.Get_DatiPagamento: IXMLDatiPagamentoType;
begin
  Result := ChildNodes['DatiPagamento'] as IXMLDatiPagamentoType;
end;

function TXMLDocumentoType.Get_Totali: IXMLTotaliType;
begin
  Result := ChildNodes['Totali'] as IXMLTotaliType;
end;

function TXMLDocumentoType.Get_CorpoDocumento: IXMLCorpoDocumentoType;
begin
  Result := ChildNodes['CorpoDocumento'] as IXMLCorpoDocumentoType;
end;

{ TXMLTipoNumDataType }

function TXMLTipoNumDataType.Get_TipoDocumento: WideString;
begin
  Result := ChildNodes['TipoDocumento'].Text;
end;

procedure TXMLTipoNumDataType.Set_TipoDocumento(Value: WideString);
begin
  ChildNodes['TipoDocumento'].NodeValue := Value;
end;

function TXMLTipoNumDataType.Get_Registro: WideString;
begin
  Result := ChildNodes['Registro'].Text;
end;

procedure TXMLTipoNumDataType.Set_Registro(Value: WideString);
begin
  ChildNodes['Registro'].NodeValue := Value;
end;

function TXMLTipoNumDataType.Get_NumOrdPrev: Integer;
begin
  Result := ChildNodes['NumOrdPrev'].NodeValue;
end;

procedure TXMLTipoNumDataType.Set_NumOrdPrev(Value: Integer);
begin
  ChildNodes['NumOrdPrev'].NodeValue := Value;
end;

function TXMLTipoNumDataType.Get_DataDocumento: WideString;
begin
  Result := ChildNodes['DataDocumento'].Text;
end;

procedure TXMLTipoNumDataType.Set_DataDocumento(Value: WideString);
begin
  ChildNodes['DataDocumento'].NodeValue := Value;
end;

function TXMLTipoNumDataType.Get_TipoDocumentoEsteso: WideString;
begin
  Result := ChildNodes['TipoDocumentoEsteso'].Text;
end;

procedure TXMLTipoNumDataType.Set_TipoDocumentoEsteso(Value: WideString);
begin
  ChildNodes['TipoDocumentoEsteso'].NodeValue := Value;
end;

{ TXMLMittenteType }

function TXMLMittenteType.Get_MittRagSoc: WideString;
begin
  Result := ChildNodes['MittRagSoc'].Text;
end;

procedure TXMLMittenteType.Set_MittRagSoc(Value: WideString);
begin
  ChildNodes['MittRagSoc'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittIndirizzo: WideString;
begin
  Result := ChildNodes['MittIndirizzo'].Text;
end;

procedure TXMLMittenteType.Set_MittIndirizzo(Value: WideString);
begin
  ChildNodes['MittIndirizzo'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittCitta: WideString;
begin
  Result := ChildNodes['MittCitta'].Text;
end;

procedure TXMLMittenteType.Set_MittCitta(Value: WideString);
begin
  ChildNodes['MittCitta'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittCAP: WideString;
begin
  Result := ChildNodes['MittCAP'].Text;
end;

procedure TXMLMittenteType.Set_MittCAP(Value: WideString);
begin
  ChildNodes['MittCAP'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittProvincia: WideString;
begin
  Result := ChildNodes['MittProvincia'].Text;
end;

procedure TXMLMittenteType.Set_MittProvincia(Value: WideString);
begin
  ChildNodes['MittProvincia'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittPartitaIVA: WideString;
begin
  Result := ChildNodes['MittPartitaIVA'].Text;
end;

procedure TXMLMittenteType.Set_MittPartitaIVA(Value: WideString);
begin
  ChildNodes['MittPartitaIVA'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittTelefono: WideString;
begin
  Result := ChildNodes['MittTelefono'].Text;
end;

procedure TXMLMittenteType.Set_MittTelefono(Value: WideString);
begin
  ChildNodes['MittTelefono'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittFax: WideString;
begin
  Result := ChildNodes['MittFax'].Text;
end;

procedure TXMLMittenteType.Set_MittFax(Value: WideString);
begin
  ChildNodes['MittFax'].NodeValue := Value;
end;

function TXMLMittenteType.Get_MittEmail: WideString;
begin
  Result := ChildNodes['MittEmail'].Text;
end;

procedure TXMLMittenteType.Set_MittEmail(Value: WideString);
begin
  ChildNodes['MittEmail'].NodeValue := Value;
end;

{ TXMLIntestatarioType }

function TXMLIntestatarioType.Get_CodiceCliente: Integer;
begin
  Result := ChildNodes['CodiceCliente'].NodeValue;
end;

procedure TXMLIntestatarioType.Set_CodiceCliente(Value: Integer);
begin
  ChildNodes['CodiceCliente'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_RagSocCli: WideString;
begin
  Result := ChildNodes['RagSocCli'].Text;
end;

procedure TXMLIntestatarioType.Set_RagSocCli(Value: WideString);
begin
  ChildNodes['RagSocCli'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_IndirizzoCli: WideString;
begin
  Result := ChildNodes['IndirizzoCli'].Text;
end;

procedure TXMLIntestatarioType.Set_IndirizzoCli(Value: WideString);
begin
  ChildNodes['IndirizzoCli'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_CittaCli: WideString;
begin
  Result := ChildNodes['CittaCli'].Text;
end;

procedure TXMLIntestatarioType.Set_CittaCli(Value: WideString);
begin
  ChildNodes['CittaCli'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_CAPCli: WideString;
begin
  Result := ChildNodes['CAPCli'].Text;
end;

procedure TXMLIntestatarioType.Set_CAPCli(Value: WideString);
begin
  ChildNodes['CAPCli'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_ProvinciaCli: WideString;
begin
  Result := ChildNodes['ProvinciaCli'].Text;
end;

procedure TXMLIntestatarioType.Set_ProvinciaCli(Value: WideString);
begin
  ChildNodes['ProvinciaCli'].NodeValue := Value;
end;

function TXMLIntestatarioType.Get_PartitaIVACli: WideString;
begin
  Result := ChildNodes['PartitaIVACli'].Text;
end;

procedure TXMLIntestatarioType.Set_PartitaIVACli(Value: WideString);
begin
  ChildNodes['PartitaIVACli'].NodeValue := Value;
end;

{ TXMLDestinazioneMerciType }

function TXMLDestinazioneMerciType.Get_CodiceDestMerci: Integer;
begin
  Result := ChildNodes['CodiceDestMerci'].NodeValue;
end;

procedure TXMLDestinazioneMerciType.Set_CodiceDestMerci(Value: Integer);
begin
  ChildNodes['CodiceDestMerci'].NodeValue := Value;
end;

function TXMLDestinazioneMerciType.Get_RagSocDestMerci: WideString;
begin
  Result := ChildNodes['RagSocDestMerci'].Text;
end;

procedure TXMLDestinazioneMerciType.Set_RagSocDestMerci(Value: WideString);
begin
  ChildNodes['RagSocDestMerci'].NodeValue := Value;
end;

function TXMLDestinazioneMerciType.Get_IndirizzoDestMerci: WideString;
begin
  Result := ChildNodes['IndirizzoDestMerci'].Text;
end;

procedure TXMLDestinazioneMerciType.Set_IndirizzoDestMerci(Value: WideString);
begin
  ChildNodes['IndirizzoDestMerci'].NodeValue := Value;
end;

function TXMLDestinazioneMerciType.Get_CAPDestMerci: WideString;
begin
  Result := ChildNodes['CAPDestMerci'].Text;
end;

procedure TXMLDestinazioneMerciType.Set_CAPDestMerci(Value: WideString);
begin
  ChildNodes['CAPDestMerci'].NodeValue := Value;
end;

function TXMLDestinazioneMerciType.Get_CittaDestMerci: WideString;
begin
  Result := ChildNodes['CittaDestMerci'].Text;
end;

procedure TXMLDestinazioneMerciType.Set_CittaDestMerci(Value: WideString);
begin
  ChildNodes['CittaDestMerci'].NodeValue := Value;
end;

function TXMLDestinazioneMerciType.Get_ProvinciaDestMerci: WideString;
begin
  Result := ChildNodes['ProvinciaDestMerci'].Text;
end;

procedure TXMLDestinazioneMerciType.Set_ProvinciaDestMerci(Value: WideString);
begin
  ChildNodes['ProvinciaDestMerci'].NodeValue := Value;
end;

{ TXMLPraticheType }

function TXMLPraticheType.Get_Pratica: Integer;
begin
  Result := ChildNodes['Pratica'].NodeValue;
end;

procedure TXMLPraticheType.Set_Pratica(Value: Integer);
begin
  ChildNodes['Pratica'].NodeValue := Value;
end;

function TXMLPraticheType.Get_Pratica2: Integer;
begin
  Result := ChildNodes['Pratica2'].NodeValue;
end;

procedure TXMLPraticheType.Set_Pratica2(Value: Integer);
begin
  ChildNodes['Pratica2'].NodeValue := Value;
end;

function TXMLPraticheType.Get_Pratica3: Integer;
begin
  Result := ChildNodes['Pratica3'].NodeValue;
end;

procedure TXMLPraticheType.Set_Pratica3(Value: Integer);
begin
  ChildNodes['Pratica3'].NodeValue := Value;
end;

function TXMLPraticheType.Get_DataPratica1: WideString;
begin
  Result := ChildNodes['DataPratica1'].Text;
end;

procedure TXMLPraticheType.Set_DataPratica1(Value: WideString);
begin
  ChildNodes['DataPratica1'].NodeValue := Value;
end;

function TXMLPraticheType.Get_DataPratica2: WideString;
begin
  Result := ChildNodes['DataPratica2'].Text;
end;

procedure TXMLPraticheType.Set_DataPratica2(Value: WideString);
begin
  ChildNodes['DataPratica2'].NodeValue := Value;
end;

function TXMLPraticheType.Get_DataPratica3: WideString;
begin
  Result := ChildNodes['DataPratica3'].Text;
end;

procedure TXMLPraticheType.Set_DataPratica3(Value: WideString);
begin
  ChildNodes['DataPratica3'].NodeValue := Value;
end;

{ TXMLVarieType }

function TXMLVarieType.Get_SegnoOperazione: WideString;
begin
  Result := ChildNodes['SegnoOperazione'].Text;
end;

function TXMLVarieType.Get_SegnoOperazioneCantiere: WideString;
begin
  Result := ChildNodes['SegnoOperazioneCantiere'].Text;
end;

function TXMLVarieType.Get_Selezionato: WideString;
begin
  Result := ChildNodes['Selezionato'].Text;
end;

procedure TXMLVarieType.Set_SegnoOperazione(Value: WideString);
begin
  ChildNodes['SegnoOperazione'].NodeValue := Value;
end;

procedure TXMLVarieType.Set_SegnoOperazioneCantiere(Value: WideString);
begin
  ChildNodes['SegnoOperazioneCantiere'].NodeValue := Value;
end;

procedure TXMLVarieType.Set_Selezionato(Value: WideString);
begin
  ChildNodes['Selezionato'].NodeValue := Value;
end;

function TXMLVarieType.Get_MeseCompetenza: Integer;
begin
  Result := ChildNodes['MeseCompetenza'].NodeValue;
end;

procedure TXMLVarieType.Set_MeseCompetenza(Value: Integer);
begin
  ChildNodes['MeseCompetenza'].NodeValue := Value;
end;

function TXMLVarieType.Get_CodiceMagazzino: Integer;
begin
  Result := ChildNodes['CodiceMagazzino'].NodeValue;
end;

procedure TXMLVarieType.Set_CodiceMagazzino(Value: Integer);
begin
  ChildNodes['CodiceMagazzino'].NodeValue := Value;
end;

function TXMLVarieType.Get_Listino: Integer;
begin
  Result := ChildNodes['Listino'].NodeValue;
end;

procedure TXMLVarieType.Set_Listino(Value: Integer);
begin
  ChildNodes['Listino'].NodeValue := Value;
end;

function TXMLVarieType.Get_Argomento: WideString;
begin
  Result := ChildNodes['Argomento'].Text;
end;

procedure TXMLVarieType.Set_Argomento(Value: WideString);
begin
  ChildNodes['Argomento'].NodeValue := Value;
end;

function TXMLVarieType.Get_Note: WideString;
begin
  Result := ChildNodes['Note'].Text;
end;

procedure TXMLVarieType.Set_Note(Value: WideString);
begin
  ChildNodes['Note'].NodeValue := Value;
end;

function TXMLVarieType.Get_Messaggi: WideString;
begin
  Result := ChildNodes['Messaggi'].Text;
end;

procedure TXMLVarieType.Set_Messaggi(Value: WideString);
begin
  ChildNodes['Messaggi'].NodeValue := Value;
end;

function TXMLVarieType.Get_Agente: Integer;
begin
  Result := ChildNodes['Agente'].NodeValue;
end;

procedure TXMLVarieType.Set_Agente(Value: Integer);
begin
  ChildNodes['Agente'].NodeValue := Value;
end;

{ TXMLDatiCausaleType }

function TXMLDatiCausaleType.Get_Causale: WideString;
begin
  Result := ChildNodes['Causale'].Text;
end;

procedure TXMLDatiCausaleType.Set_Causale(Value: WideString);
begin
  ChildNodes['Causale'].NodeValue := Value;
end;

function TXMLDatiCausaleType.Get_SegnoOperazione: WideString;
begin
  Result := ChildNodes['SegnoOperazione'].Text;
end;

procedure TXMLDatiCausaleType.Set_SegnoOperazione(Value: WideString);
begin
  ChildNodes['SegnoOperazione'].NodeValue := Value;
end;

function TXMLDatiCausaleType.Get_DaFatturare: WideString;
begin
  Result := ChildNodes['DaFatturare'].Text;
end;

procedure TXMLDatiCausaleType.Set_DaFatturare(Value: WideString);
begin
  ChildNodes['DaFatturare'].NodeValue := Value;
end;

{ TXMLTrasportoType }

function TXMLTrasportoType.Get_TrasportoACura: WideString;
begin
  Result := ChildNodes['TrasportoACura'].Text;
end;

procedure TXMLTrasportoType.Set_TrasportoACura(Value: WideString);
begin
  ChildNodes['TrasportoACura'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_DatiVettore: WideString;
begin
  Result := ChildNodes['DatiVettore'].Text;
end;

procedure TXMLTrasportoType.Set_DatiVettore(Value: WideString);
begin
  ChildNodes['DatiVettore'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_DataTrasp: WideString;
begin
  Result := ChildNodes['DataTrasp'].Text;
end;

procedure TXMLTrasportoType.Set_DataTrasp(Value: WideString);
begin
  ChildNodes['DataTrasp'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_OraTrasp: WideString;
begin
  Result := ChildNodes['OraTrasp'].Text;
end;

procedure TXMLTrasportoType.Set_OraTrasp(Value: WideString);
begin
  ChildNodes['OraTrasp'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_NumColli: Integer;
begin
  Result := ChildNodes['NumColli'].NodeValue;
end;

procedure TXMLTrasportoType.Set_NumColli(Value: Integer);
begin
  ChildNodes['NumColli'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_AspettoEsterioreBeni: WideString;
begin
  Result := ChildNodes['AspettoEsterioreBeni'].Text;
end;

procedure TXMLTrasportoType.Set_AspettoEsterioreBeni(Value: WideString);
begin
  ChildNodes['AspettoEsterioreBeni'].NodeValue := Value;
end;

function TXMLTrasportoType.Get_Porto: WideString;
begin
  Result := ChildNodes['Porto'].Text;
end;

procedure TXMLTrasportoType.Set_Porto(Value: WideString);
begin
  ChildNodes['Porto'].NodeValue := Value;
end;

{ TXMLStatoType }

function TXMLStatoType.Get_StatoDescrizione: WideString;
begin
  Result := ChildNodes['StatoDescrizione'].Text;
end;

procedure TXMLStatoType.Set_StatoDescrizione(Value: WideString);
begin
  ChildNodes['StatoDescrizione'].NodeValue := Value;
end;

function TXMLStatoType.Get_StatoForeground: WideString;
begin
  Result := ChildNodes['StatoForeground'].Text;
end;

procedure TXMLStatoType.Set_StatoForeground(Value: WideString);
begin
  ChildNodes['StatoForeground'].NodeValue := Value;
end;

function TXMLStatoType.Get_StatoBackground: WideString;
begin
  Result := ChildNodes['StatoBackground'].Text;
end;

procedure TXMLStatoType.Set_StatoBackground(Value: WideString);
begin
  ChildNodes['StatoBackground'].NodeValue := Value;
end;

{ TXMLSubSoggType }

function TXMLSubSoggType.Get_CodiceSubSogg: Integer;
begin
  Result := ChildNodes['CodiceSubSogg'].NodeValue;
end;

procedure TXMLSubSoggType.Set_CodiceSubSogg(Value: Integer);
begin
  ChildNodes['CodiceSubSogg'].NodeValue := Value;
end;

function TXMLSubSoggType.Get_SubSoggCampo1: WideString;
begin
  Result := ChildNodes['SubSoggCampo1'].Text;
end;

procedure TXMLSubSoggType.Set_SubSoggCampo1(Value: WideString);
begin
  ChildNodes['SubSoggCampo1'].NodeValue := Value;
end;

function TXMLSubSoggType.Get_SubSoggCampo2: WideString;
begin
  Result := ChildNodes['SubSoggCampo2'].Text;
end;

procedure TXMLSubSoggType.Set_SubSoggCampo2(Value: WideString);
begin
  ChildNodes['SubSoggCampo2'].NodeValue := Value;
end;

function TXMLSubSoggType.Get_SubSoggCampo3: WideString;
begin
  Result := ChildNodes['SubSoggCampo3'].Text;
end;

procedure TXMLSubSoggType.Set_SubSoggCampo3(Value: WideString);
begin
  ChildNodes['SubSoggCampo3'].NodeValue := Value;
end;

{ TXMLDatiOperatoreType }

function TXMLDatiOperatoreType.Get_Operatore: WideString;
begin
  Result := ChildNodes['Operatore'].Text;
end;

procedure TXMLDatiOperatoreType.Set_Operatore(Value: WideString);
begin
  ChildNodes['Operatore'].NodeValue := Value;
end;

function TXMLDatiOperatoreType.Get_ValiditaDocumento: WideString;
begin
  Result := ChildNodes['ValiditaDocumento'].Text;
end;

procedure TXMLDatiOperatoreType.Set_ValiditaDocumento(Value: WideString);
begin
  ChildNodes['ValiditaDocumento'].NodeValue := Value;
end;

function TXMLDatiOperatoreType.Get_Consegna: WideString;
begin
  Result := ChildNodes['Consegna'].Text;
end;

procedure TXMLDatiOperatoreType.Set_Consegna(Value: WideString);
begin
  ChildNodes['Consegna'].NodeValue := Value;
end;

{ TXMLScadenzeType }

function TXMLScadenzeType.Get_DataScad1: WideString;
begin
  Result := ChildNodes['DataScad1'].Text;
end;

procedure TXMLScadenzeType.Set_DataScad1(Value: WideString);
begin
  ChildNodes['DataScad1'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_DataScad2: WideString;
begin
  Result := ChildNodes['DataScad2'].Text;
end;

procedure TXMLScadenzeType.Set_DataScad2(Value: WideString);
begin
  ChildNodes['DataScad2'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_DataScad3: WideString;
begin
  Result := ChildNodes['DataScad3'].Text;
end;

procedure TXMLScadenzeType.Set_DataScad3(Value: WideString);
begin
  ChildNodes['DataScad3'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_DataScad4: WideString;
begin
  Result := ChildNodes['DataScad4'].Text;
end;

procedure TXMLScadenzeType.Set_DataScad4(Value: WideString);
begin
  ChildNodes['DataScad4'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_DataScad5: WideString;
begin
  Result := ChildNodes['DataScad5'].Text;
end;

procedure TXMLScadenzeType.Set_DataScad5(Value: WideString);
begin
  ChildNodes['DataScad5'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_ImportoScad1: WideString;
begin
  Result := ChildNodes['ImportoScad1'].Text;
end;

procedure TXMLScadenzeType.Set_ImportoScad1(Value: WideString);
begin
  ChildNodes['ImportoScad1'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_ImportoScad2: WideString;
begin
  Result := ChildNodes['ImportoScad2'].Text;
end;

procedure TXMLScadenzeType.Set_ImportoScad2(Value: WideString);
begin
  ChildNodes['ImportoScad2'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_ImportoScad3: WideString;
begin
  Result := ChildNodes['ImportoScad3'].Text;
end;

procedure TXMLScadenzeType.Set_ImportoScad3(Value: WideString);
begin
  ChildNodes['ImportoScad3'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_ImportoScad4: WideString;
begin
  Result := ChildNodes['ImportoScad4'].Text;
end;

procedure TXMLScadenzeType.Set_ImportoScad4(Value: WideString);
begin
  ChildNodes['ImportoScad4'].NodeValue := Value;
end;

function TXMLScadenzeType.Get_ImportoScad5: WideString;
begin
  Result := ChildNodes['ImportoScad5'].Text;
end;

procedure TXMLScadenzeType.Set_ImportoScad5(Value: WideString);
begin
  ChildNodes['ImportoScad5'].NodeValue := Value;
end;

{ TXMLDatiPagamentoType }

function TXMLDatiPagamentoType.Get_Pagamento: Integer;
begin
  Result := ChildNodes['Pagamento'].NodeValue;
end;

procedure TXMLDatiPagamentoType.Set_Pagamento(Value: Integer);
begin
  ChildNodes['Pagamento'].NodeValue := Value;
end;

function TXMLDatiPagamentoType.Get_ABI: WideString;
begin
  Result := ChildNodes['ABI'].Text;
end;

procedure TXMLDatiPagamentoType.Set_ABI(Value: WideString);
begin
  ChildNodes['ABI'].NodeValue := Value;
end;

function TXMLDatiPagamentoType.Get_CAB: WideString;
begin
  Result := ChildNodes['CAB'].Text;
end;

procedure TXMLDatiPagamentoType.Set_CAB(Value: WideString);
begin
  ChildNodes['CAB'].NodeValue := Value;
end;

{ TXMLTotaliType }

function TXMLTotaliType.Get_PrzUnitOpera: WideString;
begin
  Result := ChildNodes['PrzUnitOpera'].Text;
end;

procedure TXMLTotaliType.Set_PrzUnitOpera(Value: WideString);
begin
  ChildNodes['PrzUnitOpera'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleMargine: WideString;
begin
  Result := ChildNodes['TotaleMargine'].Text;
end;

procedure TXMLTotaliType.Set_TotaleMargine(Value: WideString);
begin
  ChildNodes['TotaleMargine'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleRighi1: WideString;
begin
  Result := ChildNodes['TotaleRighi1'].Text;
end;

procedure TXMLTotaliType.Set_TotaleRighi1(Value: WideString);
begin
  ChildNodes['TotaleRighi1'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleRighi2: WideString;
begin
  Result := ChildNodes['TotaleRighi2'].Text;
end;

procedure TXMLTotaliType.Set_TotaleRighi2(Value: WideString);
begin
  ChildNodes['TotaleRighi2'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleRighi3: WideString;
begin
  Result := ChildNodes['TotaleRighi3'].Text;
end;

procedure TXMLTotaliType.Set_TotaleRighi3(Value: WideString);
begin
  ChildNodes['TotaleRighi3'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleRighi4: WideString;
begin
  Result := ChildNodes['TotaleRighi4'].Text;
end;

procedure TXMLTotaliType.Set_TotaleRighi4(Value: WideString);
begin
  ChildNodes['TotaleRighi4'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleMerce: WideString;
begin
  Result := ChildNodes['TotaleMerce'].Text;
end;

procedure TXMLTotaliType.Set_TotaleMerce(Value: WideString);
begin
  ChildNodes['TotaleMerce'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ScontoAliquota1: WideString;
begin
  Result := ChildNodes['ScontoAliquota1'].Text;
end;

procedure TXMLTotaliType.Set_ScontoAliquota1(Value: WideString);
begin
  ChildNodes['ScontoAliquota1'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ScontoAliquota2: WideString;
begin
  Result := ChildNodes['ScontoAliquota2'].Text;
end;

procedure TXMLTotaliType.Set_ScontoAliquota2(Value: WideString);
begin
  ChildNodes['ScontoAliquota2'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ScontoAliquota3: WideString;
begin
  Result := ChildNodes['ScontoAliquota3'].Text;
end;

procedure TXMLTotaliType.Set_ScontoAliquota3(Value: WideString);
begin
  ChildNodes['ScontoAliquota3'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ScontoAliquota4: WideString;
begin
  Result := ChildNodes['ScontoAliquota4'].Text;
end;

procedure TXMLTotaliType.Set_ScontoAliquota4(Value: WideString);
begin
  ChildNodes['ScontoAliquota4'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleSconti: WideString;
begin
  Result := ChildNodes['TotaleSconti'].Text;
end;

procedure TXMLTotaliType.Set_TotaleSconti(Value: WideString);
begin
  ChildNodes['TotaleSconti'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleImponibile1: WideString;
begin
  Result := ChildNodes['TotaleImponibile1'].Text;
end;

procedure TXMLTotaliType.Set_TotaleImponibile1(Value: WideString);
begin
  ChildNodes['TotaleImponibile1'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleImponibile2: WideString;
begin
  Result := ChildNodes['TotaleImponibile2'].Text;
end;

procedure TXMLTotaliType.Set_TotaleImponibile2(Value: WideString);
begin
  ChildNodes['TotaleImponibile2'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleImponibile3: WideString;
begin
  Result := ChildNodes['TotaleImponibile3'].Text;
end;

procedure TXMLTotaliType.Set_TotaleImponibile3(Value: WideString);
begin
  ChildNodes['TotaleImponibile3'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleImponibile4: WideString;
begin
  Result := ChildNodes['TotaleImponibile4'].Text;
end;

procedure TXMLTotaliType.Set_TotaleImponibile4(Value: WideString);
begin
  ChildNodes['TotaleImponibile4'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleImponibile: WideString;
begin
  Result := ChildNodes['TotaleImponibile'].Text;
end;

procedure TXMLTotaliType.Set_TotaleImponibile(Value: WideString);
begin
  ChildNodes['TotaleImponibile'].NodeValue := Value;
end;

function TXMLTotaliType.Get_CodiceIVA1: Integer;
begin
  Result := ChildNodes['CodiceIVA1'].NodeValue;
end;

procedure TXMLTotaliType.Set_CodiceIVA1(Value: Integer);
begin
  ChildNodes['CodiceIVA1'].NodeValue := Value;
end;

function TXMLTotaliType.Get_CodiceIVA2: Integer;
begin
  Result := ChildNodes['CodiceIVA2'].NodeValue;
end;

procedure TXMLTotaliType.Set_CodiceIVA2(Value: Integer);
begin
  ChildNodes['CodiceIVA2'].NodeValue := Value;
end;

function TXMLTotaliType.Get_CodiceIVA3: Integer;
begin
  Result := ChildNodes['CodiceIVA3'].NodeValue;
end;

procedure TXMLTotaliType.Set_CodiceIVA3(Value: Integer);
begin
  ChildNodes['CodiceIVA3'].NodeValue := Value;
end;

function TXMLTotaliType.Get_CodiceIVA4: Integer;
begin
  Result := ChildNodes['CodiceIVA4'].NodeValue;
end;

procedure TXMLTotaliType.Set_CodiceIVA4(Value: Integer);
begin
  ChildNodes['CodiceIVA4'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ImportoIVA1: WideString;
begin
  Result := ChildNodes['ImportoIVA1'].Text;
end;

procedure TXMLTotaliType.Set_ImportoIVA1(Value: WideString);
begin
  ChildNodes['ImportoIVA1'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ImportoIVA2: WideString;
begin
  Result := ChildNodes['ImportoIVA2'].Text;
end;

procedure TXMLTotaliType.Set_ImportoIVA2(Value: WideString);
begin
  ChildNodes['ImportoIVA2'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ImportoIVA3: WideString;
begin
  Result := ChildNodes['ImportoIVA3'].Text;
end;

procedure TXMLTotaliType.Set_ImportoIVA3(Value: WideString);
begin
  ChildNodes['ImportoIVA3'].NodeValue := Value;
end;

function TXMLTotaliType.Get_ImportoIVA4: WideString;
begin
  Result := ChildNodes['ImportoIVA4'].Text;
end;

procedure TXMLTotaliType.Set_ImportoIVA4(Value: WideString);
begin
  ChildNodes['ImportoIVA4'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleIVA: WideString;
begin
  Result := ChildNodes['TotaleIVA'].Text;
end;

procedure TXMLTotaliType.Set_TotaleIVA(Value: WideString);
begin
  ChildNodes['TotaleIVA'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleNettoMerce: WideString;
begin
  Result := ChildNodes['TotaleNettoMerce'].Text;
end;

procedure TXMLTotaliType.Set_TotaleNettoMerce(Value: WideString);
begin
  ChildNodes['TotaleNettoMerce'].NodeValue := Value;
end;

function TXMLTotaliType.Get_Spese: WideString;
begin
  Result := ChildNodes['Spese'].Text;
end;

procedure TXMLTotaliType.Set_Spese(Value: WideString);
begin
  ChildNodes['Spese'].NodeValue := Value;
end;

function TXMLTotaliType.Get_Abbuono: WideString;
begin
  Result := ChildNodes['Abbuono'].Text;
end;

procedure TXMLTotaliType.Set_Abbuono(Value: WideString);
begin
  ChildNodes['Abbuono'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleDocumento: WideString;
begin
  Result := ChildNodes['TotaleDocumento'].Text;
end;

procedure TXMLTotaliType.Set_TotaleDocumento(Value: WideString);
begin
  ChildNodes['TotaleDocumento'].NodeValue := Value;
end;

function TXMLTotaliType.Get_TotaleDaPagare: WideString;
begin
  Result := ChildNodes['TotaleDaPagare'].Text;
end;

procedure TXMLTotaliType.Set_TotaleDaPagare(Value: WideString);
begin
  ChildNodes['TotaleDaPagare'].NodeValue := Value;
end;

{ TXMLCorpoDocumentoType }

procedure TXMLCorpoDocumentoType.AfterConstruction;
begin
  RegisterChildNode('Rigo', TXMLRigoType);
  ItemTag := 'Rigo';
  ItemInterface := IXMLRigoType;
  inherited;
end;

function TXMLCorpoDocumentoType.Get_Rigo(Index: Integer): IXMLRigoType;
begin
  Result := List[Index] as IXMLRigoType;
end;

function TXMLCorpoDocumentoType.Add: IXMLRigoType;
begin
  Result := AddItem(-1) as IXMLRigoType;
end;

function TXMLCorpoDocumentoType.Insert(const Index: Integer): IXMLRigoType;
begin
  Result := AddItem(Index) as IXMLRigoType;
end;

{ TXMLRigoType }

function TXMLRigoType.Get_TipoDocumento: WideString;
begin
  Result := ChildNodes['TipoDocumento'].Text;
end;

procedure TXMLRigoType.Set_TipoDocumento(Value: WideString);
begin
  ChildNodes['TipoDocumento'].NodeValue := Value;
end;

function TXMLRigoType.Get_NumOrdPrev: Integer;
begin
  Result := ChildNodes['NumOrdPrev'].NodeValue;
end;

procedure TXMLRigoType.Set_NumOrdPrev(Value: Integer);
begin
  ChildNodes['NumOrdPrev'].NodeValue := Value;
end;

function TXMLRigoType.Get_Registro: WideString;
begin
  Result := ChildNodes['Registro'].Text;
end;

procedure TXMLRigoType.Set_Registro(Value: WideString);
begin
  ChildNodes['Registro'].NodeValue := Value;
end;

function TXMLRigoType.Get_DataDocumento: WideString;
begin
  Result := ChildNodes['DataDocumento'].Text;
end;

procedure TXMLRigoType.Set_DataDocumento(Value: WideString);
begin
  ChildNodes['DataDocumento'].NodeValue := Value;
end;

function TXMLRigoType.Get_ProgRigo: Integer;
begin
  Result := ChildNodes['ProgRigo'].NodeValue;
end;

procedure TXMLRigoType.Set_ProgRigo(Value: Integer);
begin
  ChildNodes['ProgRigo'].NodeValue := Value;
end;

function TXMLRigoType.Get_ProgRigo2: Integer;
begin
  Result := ChildNodes['ProgRigo2'].NodeValue;
end;

procedure TXMLRigoType.Set_ProgRigo2(Value: Integer);
begin
  ChildNodes['ProgRigo2'].NodeValue := Value;
end;

function TXMLRigoType.Get_CodiceCliente: Integer;
begin
  Result := ChildNodes['CodiceCliente'].NodeValue;
end;

procedure TXMLRigoType.Set_CodiceCliente(Value: Integer);
begin
  ChildNodes['CodiceCliente'].NodeValue := Value;
end;

function TXMLRigoType.Get_CodiceArticolo: WideString;
begin
  Result := ChildNodes['CodiceArticolo'].Text;
end;

procedure TXMLRigoType.Set_CodiceArticolo(Value: WideString);
begin
  ChildNodes['CodiceArticolo'].NodeValue := Value;
end;

function TXMLRigoType.Get_Descrizione: WideString;
begin
  Result := ChildNodes['Descrizione'].Text;
end;

procedure TXMLRigoType.Set_Descrizione(Value: WideString);
begin
  ChildNodes['Descrizione'].NodeValue := Value;
end;

function TXMLRigoType.Get_PrezzoUnitario: WideString;
begin
  Result := ChildNodes['PrezzoUnitario'].Text;
end;

procedure TXMLRigoType.Set_PrezzoUnitario(Value: WideString);
begin
  ChildNodes['PrezzoUnitario'].NodeValue := Value;
end;

function TXMLRigoType.Get_PrezzoUnitarioIVACompresa: WideString;
begin
  Result := ChildNodes['PrezzoUnitarioIVACompresa'].Text;
end;

procedure TXMLRigoType.Set_PrezzoUnitarioIVACompresa(Value: WideString);
begin
  ChildNodes['PrezzoUnitarioIVACompresa'].NodeValue := Value;
end;

function TXMLRigoType.Get_UnitaDiMisura: WideString;
begin
  Result := ChildNodes['UnitaDiMisura'].Text;
end;

procedure TXMLRigoType.Set_UnitaDiMisura(Value: WideString);
begin
  ChildNodes['UnitaDiMisura'].NodeValue := Value;
end;

function TXMLRigoType.Get_QTA: WideString;
begin
  Result := ChildNodes['QTA'].Text;
end;

procedure TXMLRigoType.Set_QTA(Value: WideString);
begin
  ChildNodes['QTA'].NodeValue := Value;
end;

function TXMLRigoType.Get_ScontoRigo: WideString;
begin
  Result := ChildNodes['ScontoRigo'].Text;
end;

procedure TXMLRigoType.Set_ScontoRigo(Value: WideString);
begin
  ChildNodes['ScontoRigo'].NodeValue := Value;
end;

function TXMLRigoType.Get_ScontoRigo2: WideString;
begin
  Result := ChildNodes['ScontoRigo2'].Text;
end;

procedure TXMLRigoType.Set_ScontoRigo2(Value: WideString);
begin
  ChildNodes['ScontoRigo2'].NodeValue := Value;
end;

function TXMLRigoType.Get_ScontoRigo3: WideString;
begin
  Result := ChildNodes['ScontoRigo3'].Text;
end;

procedure TXMLRigoType.Set_ScontoRigo3(Value: WideString);
begin
  ChildNodes['ScontoRigo3'].NodeValue := Value;
end;

function TXMLRigoType.Get_ImportoRigo: WideString;
begin
  Result := ChildNodes['ImportoRigo'].Text;
end;

procedure TXMLRigoType.Set_ImportoRigo(Value: WideString);
begin
  ChildNodes['ImportoRigo'].NodeValue := Value;
end;

function TXMLRigoType.Get_ImportoRigoIVACompresa: WideString;
begin
  Result := ChildNodes['ImportoRigoIVACompresa'].Text;
end;

procedure TXMLRigoType.Set_ImportoRigoIVACompresa(Value: WideString);
begin
  ChildNodes['ImportoRigoIVACompresa'].NodeValue := Value;
end;

function TXMLRigoType.Get_PrezzoAcquistoArticolo: WideString;
begin
  Result := ChildNodes['PrezzoAcquistoArticolo'].Text;
end;

procedure TXMLRigoType.Set_PrezzoAcquistoArticolo(Value: WideString);
begin
  ChildNodes['PrezzoAcquistoArticolo'].NodeValue := Value;
end;

function TXMLRigoType.Get_CodiceIVA: Integer;
begin
  Result := ChildNodes['CodiceIVA'].NodeValue;
end;

procedure TXMLRigoType.Set_CodiceIVA(Value: Integer);
begin
  ChildNodes['CodiceIVA'].NodeValue := Value;
end;

function TXMLRigoType.Get_Margine: WideString;
begin
  Result := ChildNodes['Margine'].Text;
end;

procedure TXMLRigoType.Set_Margine(Value: WideString);
begin
  ChildNodes['Margine'].NodeValue := Value;
end;

function TXMLRigoType.Get_MovMag: WideString;
begin
  Result := ChildNodes['MovMag'].Text;
end;

procedure TXMLRigoType.Set_MovMag(Value: WideString);
begin
  ChildNodes['MovMag'].NodeValue := Value;
end;

function TXMLRigoType.Get_ImportoMargine: WideString;
begin
  Result := ChildNodes['ImportoMargine'].Text;
end;

procedure TXMLRigoType.Set_ImportoMargine(Value: WideString);
begin
  ChildNodes['ImportoMargine'].NodeValue := Value;
end;

function TXMLRigoType.Get_DescrizioneIVA: WideString;
begin
  Result := ChildNodes['DescrizioneIVA'].Text;
end;

procedure TXMLRigoType.Set_DescrizioneIVA(Value: WideString);
begin
  ChildNodes['DescrizioneIVA'].NodeValue := Value;
end;

function TXMLRigoType.Get_AliquotaIVA: WideString;
begin
  Result := ChildNodes['AliquotaIVA'].Text;
end;

procedure TXMLRigoType.Set_AliquotaIVA(Value: WideString);
begin
  ChildNodes['AliquotaIVA'].NodeValue := Value;
end;

function TXMLRigoType.Get_CodiceMagazzino: Integer;
begin
  Result := ChildNodes['CodiceMagazzino'].NodeValue;
end;

procedure TXMLRigoType.Set_CodiceMagazzino(Value: Integer);
begin
  ChildNodes['CodiceMagazzino'].NodeValue := Value;
end;

function TXMLRigoType.Get_PrzUnitOpera: WideString;
begin
  Result := ChildNodes['PrzUnitOpera'].Text;
end;

procedure TXMLRigoType.Set_PrzUnitOpera(Value: WideString);
begin
  ChildNodes['PrzUnitOpera'].NodeValue := Value;
end;

function TXMLRigoType.Get_QtaOpera: WideString;
begin
  Result := ChildNodes['QtaOpera'].Text;
end;

procedure TXMLRigoType.Set_QtaOpera(Value: WideString);
begin
  ChildNodes['QtaOpera'].NodeValue := Value;
end;

function TXMLRigoType.Get_ImportoOpera: WideString;
begin
  Result := ChildNodes['ImportoOpera'].Text;
end;

procedure TXMLRigoType.Set_ImportoOpera(Value: WideString);
begin
  ChildNodes['ImportoOpera'].NodeValue := Value;
end;

function TXMLRigoType.Get_ImportoComponenti: WideString;
begin
  Result := ChildNodes['ImportoComponenti'].Text;
end;

procedure TXMLRigoType.Set_ImportoComponenti(Value: WideString);
begin
  ChildNodes['ImportoComponenti'].NodeValue := Value;
end;

function TXMLRigoType.Get_NoteRigo: WideString;
begin
  Result := ChildNodes['NoteRigo'].Text;
end;

procedure TXMLRigoType.Set_NoteRigo(Value: WideString);
begin
  ChildNodes['NoteRigo'].NodeValue := Value;
end;

function TXMLRigoType.Get_Selezionato: WideString;
begin
  Result := ChildNodes['Selezionato'].Text;
end;

procedure TXMLRigoType.Set_Selezionato(Value: WideString);
begin
  ChildNodes['Selezionato'].NodeValue := Value;
end;

end.