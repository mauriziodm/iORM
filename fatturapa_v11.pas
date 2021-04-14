
{********************************************************************************}
{                                                                                }
{                                XML Data Binding                                }
{                                                                                }
{         Generated on: 05/05/2015 18:58:34                                      }
{       Generated from: C:\Users\Maurizio Del Magno\Desktop\fatturapa_v1.1.xsd   }
{   Settings stored in: C:\Users\Maurizio Del Magno\Desktop\fatturapa_v1.1.xdb   }
{                                                                                }
{********************************************************************************}



// DA AGGIUNGERE A MANO:
//  - Tutte le proprietà nelle classi (copiarle dalle interfacce)
//  - Attributo [ioEntity] in ogni classe
//  - Attributo [ioBelongsTo(...)] nelle proprietà oggetto di una relazione con un'altra classe figlia
//  - Direttiva {$RTTI EXPLICIT METHODS([vcProtected, vcPublic, vcPublished]) PROPERTIES([vcProtected, vcPublic, vcPublished])}
//      prima dello uses di questa Unit.


unit fatturapa_v11;

interface

{$RTTI EXPLICIT METHODS([vcProtected, vcPublic, vcPublished]) PROPERTIES([vcProtected, vcPublic, vcPublished])}

uses xmldom, XMLDoc, XMLIntf;


type

{ Forward Decls }

  IXMLFatturaElettronicaType = interface;
  IXMLFatturaElettronicaHeaderType = interface;
  IXMLDatiTrasmissioneType = interface;
  IXMLIdFiscaleType = interface;
  IXMLContattiTrasmittenteType = interface;
  IXMLCedentePrestatoreType = interface;
  IXMLDatiAnagraficiCedenteType = interface;
  IXMLAnagraficaType = interface;
  IXMLIndirizzoType = interface;
  IXMLIscrizioneREAType = interface;
  IXMLContattiType = interface;
  IXMLRappresentanteFiscaleType = interface;
  IXMLDatiAnagraficiRappresentanteType = interface;
  IXMLCessionarioCommittenteType = interface;
  IXMLDatiAnagraficiCessionarioType = interface;
  IXMLTerzoIntermediarioSoggettoEmittenteType = interface;
  IXMLDatiAnagraficiTerzoIntermediarioType = interface;
  IXMLFatturaElettronicaBodyType = interface;
  IXMLFatturaElettronicaBodyTypeList = interface;
  IXMLDatiGeneraliType = interface;
  IXMLDatiGeneraliDocumentoType = interface;
  IXMLDatiRitenutaType = interface;
  IXMLDatiBolloType = interface;
  IXMLDatiCassaPrevidenzialeType = interface;
  IXMLDatiCassaPrevidenzialeTypeList = interface;
  IXMLScontoMaggiorazioneType = interface;
  IXMLScontoMaggiorazioneTypeList = interface;
  IXMLDatiDocumentiCorrelatiType = interface;
  IXMLDatiDocumentiCorrelatiTypeList = interface;
  IXMLDatiSALType = interface;
  IXMLDatiSALTypeList = interface;
  IXMLDatiDDTType = interface;
  IXMLDatiDDTTypeList = interface;
  IXMLDatiTrasportoType = interface;
  IXMLDatiAnagraficiVettoreType = interface;
  IXMLFatturaPrincipaleType = interface;
  IXMLDatiBeniServiziType = interface;
  IXMLDettaglioLineeType = interface;
  IXMLDettaglioLineeTypeList = interface;
  IXMLCodiceArticoloType = interface;
  IXMLCodiceArticoloTypeList = interface;
  IXMLAltriDatiGestionaliType = interface;
  IXMLAltriDatiGestionaliTypeList = interface;
  IXMLDatiRiepilogoType = interface;
  IXMLDatiRiepilogoTypeList = interface;
  IXMLDatiVeicoliType = interface;
  IXMLDatiPagamentoType = interface;
  IXMLDatiPagamentoTypeList = interface;
  IXMLDettaglioPagamentoType = interface;
  IXMLDettaglioPagamentoTypeList = interface;
  IXMLAllegatiType = interface;
  IXMLAllegatiTypeList = interface;
  IXMLSignatureType_ds = interface;
  IXMLSignedInfoType_ds = interface;
  IXMLCanonicalizationMethodType_ds = interface;
  IXMLSignatureMethodType_ds = interface;
  IXMLReferenceType_ds = interface;
  IXMLReferenceType_dsList = interface;
  IXMLTransformsType_ds = interface;
  IXMLTransformType_ds = interface;
  IXMLDigestMethodType_ds = interface;
  IXMLSignatureValueType_ds = interface;
  IXMLKeyInfoType_ds = interface;
  IXMLKeyValueType_ds = interface;
  IXMLKeyValueType_dsList = interface;
  IXMLDSAKeyValueType_ds = interface;
  IXMLRSAKeyValueType_ds = interface;
  IXMLRetrievalMethodType_ds = interface;
  IXMLRetrievalMethodType_dsList = interface;
  IXMLX509DataType_ds = interface;
  IXMLX509DataType_dsList = interface;
  IXMLX509IssuerSerialType_ds = interface;
  IXMLX509IssuerSerialType_dsList = interface;
  IXMLPGPDataType_ds = interface;
  IXMLPGPDataType_dsList = interface;
  IXMLSPKIDataType_ds = interface;
  IXMLSPKIDataType_dsList = interface;
  IXMLObjectType_ds = interface;
  IXMLObjectType_dsList = interface;
  IXMLString200LatinTypeList = interface;
  IXMLRiferimentoNumeroLineaTypeList = interface;
  IXMLBase64BinaryList = interface;
  IXMLString_List = interface;

{ IXMLFatturaElettronicaType }

  IXMLFatturaElettronicaType = interface(IXMLNode)
    ['{77A69351-B269-457F-9DA9-CB2C4123F25C}']
    { Property Accessors }
    function Get_Versione: UnicodeString;
    function Get_FatturaElettronicaHeader: IXMLFatturaElettronicaHeaderType;
    function Get_FatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versione(Value: UnicodeString);
    { Methods & Properties }
    property Versione: UnicodeString read Get_Versione write Set_Versione;
    property FatturaElettronicaHeader: IXMLFatturaElettronicaHeaderType read Get_FatturaElettronicaHeader;
    property FatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList read Get_FatturaElettronicaBody;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ IXMLFatturaElettronicaHeaderType }

  IXMLFatturaElettronicaHeaderType = interface(IXMLNode)
    ['{362E135B-8C3E-4821-9618-A6C7C1BCC18E}']
    { Property Accessors }
    function Get_DatiTrasmissione: IXMLDatiTrasmissioneType;
    function Get_CedentePrestatore: IXMLCedentePrestatoreType;
    function Get_RappresentanteFiscale: IXMLRappresentanteFiscaleType;
    function Get_CessionarioCommittente: IXMLCessionarioCommittenteType;
    function Get_TerzoIntermediarioOSoggettoEmittente: IXMLTerzoIntermediarioSoggettoEmittenteType;
    function Get_SoggettoEmittente: UnicodeString;
    procedure Set_SoggettoEmittente(Value: UnicodeString);
    { Methods & Properties }
    property DatiTrasmissione: IXMLDatiTrasmissioneType read Get_DatiTrasmissione;
    property CedentePrestatore: IXMLCedentePrestatoreType read Get_CedentePrestatore;
    property RappresentanteFiscale: IXMLRappresentanteFiscaleType read Get_RappresentanteFiscale;
    property CessionarioCommittente: IXMLCessionarioCommittenteType read Get_CessionarioCommittente;
    property TerzoIntermediarioOSoggettoEmittente: IXMLTerzoIntermediarioSoggettoEmittenteType read Get_TerzoIntermediarioOSoggettoEmittente;
    property SoggettoEmittente: UnicodeString read Get_SoggettoEmittente write Set_SoggettoEmittente;
  end;

{ IXMLDatiTrasmissioneType }

  IXMLDatiTrasmissioneType = interface(IXMLNode)
    ['{D1E763AD-CE71-45B3-96BA-E075B44981A5}']
    { Property Accessors }
    function Get_IdTrasmittente: IXMLIdFiscaleType;
    function Get_ProgressivoInvio: UnicodeString;
    function Get_FormatoTrasmissione: UnicodeString;
    function Get_CodiceDestinatario: UnicodeString;
    function Get_ContattiTrasmittente: IXMLContattiTrasmittenteType;
    procedure Set_ProgressivoInvio(Value: UnicodeString);
    procedure Set_FormatoTrasmissione(Value: UnicodeString);
    procedure Set_CodiceDestinatario(Value: UnicodeString);
    { Methods & Properties }
    property IdTrasmittente: IXMLIdFiscaleType read Get_IdTrasmittente;
    property ProgressivoInvio: UnicodeString read Get_ProgressivoInvio write Set_ProgressivoInvio;
    property FormatoTrasmissione: UnicodeString read Get_FormatoTrasmissione write Set_FormatoTrasmissione;
    property CodiceDestinatario: UnicodeString read Get_CodiceDestinatario write Set_CodiceDestinatario;
    property ContattiTrasmittente: IXMLContattiTrasmittenteType read Get_ContattiTrasmittente;
  end;

{ IXMLIdFiscaleType }

  IXMLIdFiscaleType = interface(IXMLNode)
    ['{787EC171-7F88-472F-8311-D5B5DA821F27}']
    { Property Accessors }
    function Get_IdPaese: UnicodeString;
    function Get_IdCodice: UnicodeString;
    procedure Set_IdPaese(Value: UnicodeString);
    procedure Set_IdCodice(Value: UnicodeString);
    { Methods & Properties }
    property IdPaese: UnicodeString read Get_IdPaese write Set_IdPaese;
    property IdCodice: UnicodeString read Get_IdCodice write Set_IdCodice;
  end;

{ IXMLContattiTrasmittenteType }

  IXMLContattiTrasmittenteType = interface(IXMLNode)
    ['{A352D20C-92C9-47C0-86DD-35F3E074F7D3}']
    { Property Accessors }
    function Get_Telefono: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_Telefono(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    { Methods & Properties }
    property Telefono: UnicodeString read Get_Telefono write Set_Telefono;
    property Email: UnicodeString read Get_Email write Set_Email;
  end;

{ IXMLCedentePrestatoreType }

  IXMLCedentePrestatoreType = interface(IXMLNode)
    ['{2DB1558A-E47D-47F3-A02E-40F66E02B72A}']
    { Property Accessors }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiCedenteType;
    function Get_Sede: IXMLIndirizzoType;
    function Get_StabileOrganizzazione: IXMLIndirizzoType;
    function Get_IscrizioneREA: IXMLIscrizioneREAType;
    function Get_Contatti: IXMLContattiType;
    function Get_RiferimentoAmministrazione: UnicodeString;
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
    { Methods & Properties }
    property DatiAnagrafici: IXMLDatiAnagraficiCedenteType read Get_DatiAnagrafici;
    property Sede: IXMLIndirizzoType read Get_Sede;
    property StabileOrganizzazione: IXMLIndirizzoType read Get_StabileOrganizzazione;
    property IscrizioneREA: IXMLIscrizioneREAType read Get_IscrizioneREA;
    property Contatti: IXMLContattiType read Get_Contatti;
    property RiferimentoAmministrazione: UnicodeString read Get_RiferimentoAmministrazione write Set_RiferimentoAmministrazione;
  end;

{ IXMLDatiAnagraficiCedenteType }

  IXMLDatiAnagraficiCedenteType = interface(IXMLNode)
    ['{3F9014A7-F65B-41D9-A816-5153758BEF6B}']
    { Property Accessors }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    function Get_AlboProfessionale: UnicodeString;
    function Get_ProvinciaAlbo: UnicodeString;
    function Get_NumeroIscrizioneAlbo: UnicodeString;
    function Get_DataIscrizioneAlbo: UnicodeString;
    function Get_RegimeFiscale: UnicodeString;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    procedure Set_AlboProfessionale(Value: UnicodeString);
    procedure Set_ProvinciaAlbo(Value: UnicodeString);
    procedure Set_NumeroIscrizioneAlbo(Value: UnicodeString);
    procedure Set_DataIscrizioneAlbo(Value: UnicodeString);
    procedure Set_RegimeFiscale(Value: UnicodeString);
    { Methods & Properties }
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
    property AlboProfessionale: UnicodeString read Get_AlboProfessionale write Set_AlboProfessionale;
    property ProvinciaAlbo: UnicodeString read Get_ProvinciaAlbo write Set_ProvinciaAlbo;
    property NumeroIscrizioneAlbo: UnicodeString read Get_NumeroIscrizioneAlbo write Set_NumeroIscrizioneAlbo;
    property DataIscrizioneAlbo: UnicodeString read Get_DataIscrizioneAlbo write Set_DataIscrizioneAlbo;
    property RegimeFiscale: UnicodeString read Get_RegimeFiscale write Set_RegimeFiscale;
  end;

{ IXMLAnagraficaType }

  IXMLAnagraficaType = interface(IXMLNode)
    ['{ADAF2673-5D53-4BEE-9911-86EA2535C9AD}']
    { Property Accessors }
    function Get_Denominazione: UnicodeString;
    function Get_Nome: UnicodeString;
    function Get_Cognome: UnicodeString;
    function Get_Titolo: UnicodeString;
    function Get_CodEORI: UnicodeString;
    procedure Set_Denominazione(Value: UnicodeString);
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Cognome(Value: UnicodeString);
    procedure Set_Titolo(Value: UnicodeString);
    procedure Set_CodEORI(Value: UnicodeString);
    { Methods & Properties }
    property Denominazione: UnicodeString read Get_Denominazione write Set_Denominazione;
    property Nome: UnicodeString read Get_Nome write Set_Nome;
    property Cognome: UnicodeString read Get_Cognome write Set_Cognome;
    property Titolo: UnicodeString read Get_Titolo write Set_Titolo;
    property CodEORI: UnicodeString read Get_CodEORI write Set_CodEORI;
  end;

{ IXMLIndirizzoType }

  IXMLIndirizzoType = interface(IXMLNode)
    ['{44712E88-D572-4B9E-A19B-1BA950A0F9B6}']
    { Property Accessors }
    function Get_Indirizzo: UnicodeString;
    function Get_NumeroCivico: UnicodeString;
    function Get_CAP: UnicodeString;
    function Get_Comune: UnicodeString;
    function Get_Provincia: UnicodeString;
    function Get_Nazione: UnicodeString;
    procedure Set_Indirizzo(Value: UnicodeString);
    procedure Set_NumeroCivico(Value: UnicodeString);
    procedure Set_CAP(Value: UnicodeString);
    procedure Set_Comune(Value: UnicodeString);
    procedure Set_Provincia(Value: UnicodeString);
    procedure Set_Nazione(Value: UnicodeString);
    { Methods & Properties }
    property Indirizzo: UnicodeString read Get_Indirizzo write Set_Indirizzo;
    property NumeroCivico: UnicodeString read Get_NumeroCivico write Set_NumeroCivico;
    property CAP: UnicodeString read Get_CAP write Set_CAP;
    property Comune: UnicodeString read Get_Comune write Set_Comune;
    property Provincia: UnicodeString read Get_Provincia write Set_Provincia;
    property Nazione: UnicodeString read Get_Nazione write Set_Nazione;
  end;

{ IXMLIscrizioneREAType }

  IXMLIscrizioneREAType = interface(IXMLNode)
    ['{B42AA937-5309-4240-802D-444CC0FB78E0}']
    { Property Accessors }
    function Get_Ufficio: UnicodeString;
    function Get_NumeroREA: UnicodeString;
    function Get_CapitaleSociale: UnicodeString;
    function Get_SocioUnico: UnicodeString;
    function Get_StatoLiquidazione: UnicodeString;
    procedure Set_Ufficio(Value: UnicodeString);
    procedure Set_NumeroREA(Value: UnicodeString);
    procedure Set_CapitaleSociale(Value: UnicodeString);
    procedure Set_SocioUnico(Value: UnicodeString);
    procedure Set_StatoLiquidazione(Value: UnicodeString);
    { Methods & Properties }
    property Ufficio: UnicodeString read Get_Ufficio write Set_Ufficio;
    property NumeroREA: UnicodeString read Get_NumeroREA write Set_NumeroREA;
    property CapitaleSociale: UnicodeString read Get_CapitaleSociale write Set_CapitaleSociale;
    property SocioUnico: UnicodeString read Get_SocioUnico write Set_SocioUnico;
    property StatoLiquidazione: UnicodeString read Get_StatoLiquidazione write Set_StatoLiquidazione;
  end;

{ IXMLContattiType }

  IXMLContattiType = interface(IXMLNode)
    ['{06FE6BE1-A77C-4AF7-8A20-AB55C704DE20}']
    { Property Accessors }
    function Get_Telefono: UnicodeString;
    function Get_Fax: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_Telefono(Value: UnicodeString);
    procedure Set_Fax(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
    { Methods & Properties }
    property Telefono: UnicodeString read Get_Telefono write Set_Telefono;
    property Fax: UnicodeString read Get_Fax write Set_Fax;
    property Email: UnicodeString read Get_Email write Set_Email;
  end;

{ IXMLRappresentanteFiscaleType }

  IXMLRappresentanteFiscaleType = interface(IXMLNode)
    ['{D594EA81-7017-4CB1-A312-46ABA2527E11}']
    { Property Accessors }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiRappresentanteType;
    { Methods & Properties }
    property DatiAnagrafici: IXMLDatiAnagraficiRappresentanteType read Get_DatiAnagrafici;
  end;

{ IXMLDatiAnagraficiRappresentanteType }

  IXMLDatiAnagraficiRappresentanteType = interface(IXMLNode)
    ['{6F2D73EE-D0ED-4462-AAD6-C77AB0CFB0C2}']
    { Property Accessors }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    { Methods & Properties }
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
  end;

{ IXMLCessionarioCommittenteType }

  IXMLCessionarioCommittenteType = interface(IXMLNode)
    ['{2B79206A-130F-4732-A637-9A14B769556D}']
    { Property Accessors }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiCessionarioType;
    function Get_Sede: IXMLIndirizzoType;
    { Methods & Properties }
    property DatiAnagrafici: IXMLDatiAnagraficiCessionarioType read Get_DatiAnagrafici;
    property Sede: IXMLIndirizzoType read Get_Sede;
  end;

{ IXMLDatiAnagraficiCessionarioType }

  IXMLDatiAnagraficiCessionarioType = interface(IXMLNode)
    ['{8503D19C-F9B8-4826-BFE4-397F08DC40C9}']
    { Property Accessors }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    { Methods & Properties }
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
  end;

{ IXMLTerzoIntermediarioSoggettoEmittenteType }

  IXMLTerzoIntermediarioSoggettoEmittenteType = interface(IXMLNode)
    ['{A90E9B92-D1FB-40AC-AD9B-B089224935A6}']
    { Property Accessors }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiTerzoIntermediarioType;
    { Methods & Properties }
    property DatiAnagrafici: IXMLDatiAnagraficiTerzoIntermediarioType read Get_DatiAnagrafici;
  end;

{ IXMLDatiAnagraficiTerzoIntermediarioType }

  IXMLDatiAnagraficiTerzoIntermediarioType = interface(IXMLNode)
    ['{EA53D9BD-B52D-46DD-886E-7D70989C8EFE}']
    { Property Accessors }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    { Methods & Properties }
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
  end;

{ IXMLFatturaElettronicaBodyType }

  IXMLFatturaElettronicaBodyType = interface(IXMLNode)
    ['{A7246024-E77D-4289-8817-2EEC6BE98A8F}']
    { Property Accessors }
    function Get_DatiGenerali: IXMLDatiGeneraliType;
    function Get_DatiBeniServizi: IXMLDatiBeniServiziType;
    function Get_DatiVeicoli: IXMLDatiVeicoliType;
    function Get_DatiPagamento: IXMLDatiPagamentoTypeList;
    function Get_Allegati: IXMLAllegatiTypeList;
    { Methods & Properties }
    property DatiGenerali: IXMLDatiGeneraliType read Get_DatiGenerali;
    property DatiBeniServizi: IXMLDatiBeniServiziType read Get_DatiBeniServizi;
    property DatiVeicoli: IXMLDatiVeicoliType read Get_DatiVeicoli;
    property DatiPagamento: IXMLDatiPagamentoTypeList read Get_DatiPagamento;
    property Allegati: IXMLAllegatiTypeList read Get_Allegati;
  end;

{ IXMLFatturaElettronicaBodyTypeList }

  IXMLFatturaElettronicaBodyTypeList = interface(IXMLNodeCollection)
    ['{1040DB1F-8760-463A-A021-EA7385362022}']
    { Methods & Properties }
    function Add: IXMLFatturaElettronicaBodyType;
    function Insert(const Index: Integer): IXMLFatturaElettronicaBodyType;

    function Get_Item(Index: Integer): IXMLFatturaElettronicaBodyType;
    property Items[Index: Integer]: IXMLFatturaElettronicaBodyType read Get_Item; default;
  end;

{ IXMLDatiGeneraliType }

  IXMLDatiGeneraliType = interface(IXMLNode)
    ['{291BF91E-ACE8-430A-8545-7AD3CC8421CD}']
    { Property Accessors }
    function Get_DatiGeneraliDocumento: IXMLDatiGeneraliDocumentoType;
    function Get_DatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiContratto: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiRicezione: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiSAL: IXMLDatiSALTypeList;
    function Get_DatiDDT: IXMLDatiDDTTypeList;
    function Get_DatiTrasporto: IXMLDatiTrasportoType;
    function Get_FatturaPrincipale: IXMLFatturaPrincipaleType;
    { Methods & Properties }
    property DatiGeneraliDocumento: IXMLDatiGeneraliDocumentoType read Get_DatiGeneraliDocumento;
    property DatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiOrdineAcquisto;
    property DatiContratto: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiContratto;
    property DatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiConvenzione;
    property DatiRicezione: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiRicezione;
    property DatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiFattureCollegate;
    property DatiSAL: IXMLDatiSALTypeList read Get_DatiSAL;
    property DatiDDT: IXMLDatiDDTTypeList read Get_DatiDDT;
    property DatiTrasporto: IXMLDatiTrasportoType read Get_DatiTrasporto;
    property FatturaPrincipale: IXMLFatturaPrincipaleType read Get_FatturaPrincipale;
  end;

{ IXMLDatiGeneraliDocumentoType }

  IXMLDatiGeneraliDocumentoType = interface(IXMLNode)
    ['{C3E7FF7E-7B8F-406C-B814-A904DA39FB0D}']
    { Property Accessors }
    function Get_TipoDocumento: UnicodeString;
    function Get_Divisa: UnicodeString;
    function Get_Data: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_DatiRitenuta: IXMLDatiRitenutaType;
    function Get_DatiBollo: IXMLDatiBolloType;
    function Get_DatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList;
    function Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    function Get_ImportoTotaleDocumento: UnicodeString;
    function Get_Arrotondamento: UnicodeString;
    function Get_Causale: IXMLString200LatinTypeList;
    function Get_Art73: UnicodeString;
    procedure Set_TipoDocumento(Value: UnicodeString);
    procedure Set_Divisa(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_ImportoTotaleDocumento(Value: UnicodeString);
    procedure Set_Arrotondamento(Value: UnicodeString);
    procedure Set_Art73(Value: UnicodeString);
    { Methods & Properties }
    property TipoDocumento: UnicodeString read Get_TipoDocumento write Set_TipoDocumento;
    property Divisa: UnicodeString read Get_Divisa write Set_Divisa;
    property Data: UnicodeString read Get_Data write Set_Data;
    property Numero: UnicodeString read Get_Numero write Set_Numero;
    property DatiRitenuta: IXMLDatiRitenutaType read Get_DatiRitenuta;
    property DatiBollo: IXMLDatiBolloType read Get_DatiBollo;
    property DatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList read Get_DatiCassaPrevidenziale;
    property ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList read Get_ScontoMaggiorazione;
    property ImportoTotaleDocumento: UnicodeString read Get_ImportoTotaleDocumento write Set_ImportoTotaleDocumento;
    property Arrotondamento: UnicodeString read Get_Arrotondamento write Set_Arrotondamento;
    property Causale: IXMLString200LatinTypeList read Get_Causale;
    property Art73: UnicodeString read Get_Art73 write Set_Art73;
  end;

{ IXMLDatiRitenutaType }

  IXMLDatiRitenutaType = interface(IXMLNode)
    ['{897CF5BB-D525-4F7B-9B53-4ECFFF00A8B7}']
    { Property Accessors }
    function Get_TipoRitenuta: UnicodeString;
    function Get_ImportoRitenuta: UnicodeString;
    function Get_AliquotaRitenuta: UnicodeString;
    function Get_CausalePagamento: UnicodeString;
    procedure Set_TipoRitenuta(Value: UnicodeString);
    procedure Set_ImportoRitenuta(Value: UnicodeString);
    procedure Set_AliquotaRitenuta(Value: UnicodeString);
    procedure Set_CausalePagamento(Value: UnicodeString);
    { Methods & Properties }
    property TipoRitenuta: UnicodeString read Get_TipoRitenuta write Set_TipoRitenuta;
    property ImportoRitenuta: UnicodeString read Get_ImportoRitenuta write Set_ImportoRitenuta;
    property AliquotaRitenuta: UnicodeString read Get_AliquotaRitenuta write Set_AliquotaRitenuta;
    property CausalePagamento: UnicodeString read Get_CausalePagamento write Set_CausalePagamento;
  end;

{ IXMLDatiBolloType }

  IXMLDatiBolloType = interface(IXMLNode)
    ['{2AA4434C-EF44-4FB1-BB71-C811E0BD15C5}']
    { Property Accessors }
    function Get_BolloVirtuale: UnicodeString;
    function Get_ImportoBollo: UnicodeString;
    procedure Set_BolloVirtuale(Value: UnicodeString);
    procedure Set_ImportoBollo(Value: UnicodeString);
    { Methods & Properties }
    property BolloVirtuale: UnicodeString read Get_BolloVirtuale write Set_BolloVirtuale;
    property ImportoBollo: UnicodeString read Get_ImportoBollo write Set_ImportoBollo;
  end;

{ IXMLDatiCassaPrevidenzialeType }

  IXMLDatiCassaPrevidenzialeType = interface(IXMLNode)
    ['{FE664BE2-66E4-4250-BB4F-C583D85FCD4C}']
    { Property Accessors }
    function Get_TipoCassa: UnicodeString;
    function Get_AlCassa: UnicodeString;
    function Get_ImportoContributoCassa: UnicodeString;
    function Get_ImponibileCassa: UnicodeString;
    function Get_AliquotaIVA: UnicodeString;
    function Get_Ritenuta: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_RiferimentoAmministrazione: UnicodeString;
    procedure Set_TipoCassa(Value: UnicodeString);
    procedure Set_AlCassa(Value: UnicodeString);
    procedure Set_ImportoContributoCassa(Value: UnicodeString);
    procedure Set_ImponibileCassa(Value: UnicodeString);
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Ritenuta(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
    { Methods & Properties }
    property TipoCassa: UnicodeString read Get_TipoCassa write Set_TipoCassa;
    property AlCassa: UnicodeString read Get_AlCassa write Set_AlCassa;
    property ImportoContributoCassa: UnicodeString read Get_ImportoContributoCassa write Set_ImportoContributoCassa;
    property ImponibileCassa: UnicodeString read Get_ImponibileCassa write Set_ImponibileCassa;
    property AliquotaIVA: UnicodeString read Get_AliquotaIVA write Set_AliquotaIVA;
    property Ritenuta: UnicodeString read Get_Ritenuta write Set_Ritenuta;
    property Natura: UnicodeString read Get_Natura write Set_Natura;
    property RiferimentoAmministrazione: UnicodeString read Get_RiferimentoAmministrazione write Set_RiferimentoAmministrazione;
  end;

{ IXMLDatiCassaPrevidenzialeTypeList }

  IXMLDatiCassaPrevidenzialeTypeList = interface(IXMLNodeCollection)
    ['{A03C2A1F-FEE4-45C2-97E9-61CF1313202F}']
    { Methods & Properties }
    function Add: IXMLDatiCassaPrevidenzialeType;
    function Insert(const Index: Integer): IXMLDatiCassaPrevidenzialeType;

    function Get_Item(Index: Integer): IXMLDatiCassaPrevidenzialeType;
    property Items[Index: Integer]: IXMLDatiCassaPrevidenzialeType read Get_Item; default;
  end;

{ IXMLScontoMaggiorazioneType }

  IXMLScontoMaggiorazioneType = interface(IXMLNode)
    ['{DC7203BD-A385-4DCD-8980-C2A4D42BFFA1}']
    { Property Accessors }
    function Get_Tipo: UnicodeString;
    function Get_Percentuale: UnicodeString;
    function Get_Importo: UnicodeString;
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Percentuale(Value: UnicodeString);
    procedure Set_Importo(Value: UnicodeString);
    { Methods & Properties }
    property Tipo: UnicodeString read Get_Tipo write Set_Tipo;
    property Percentuale: UnicodeString read Get_Percentuale write Set_Percentuale;
    property Importo: UnicodeString read Get_Importo write Set_Importo;
  end;

{ IXMLScontoMaggiorazioneTypeList }

  IXMLScontoMaggiorazioneTypeList = interface(IXMLNodeCollection)
    ['{7DD73FE1-B9FB-4186-A044-E78AB5FAC89D}']
    { Methods & Properties }
    function Add: IXMLScontoMaggiorazioneType;
    function Insert(const Index: Integer): IXMLScontoMaggiorazioneType;

    function Get_Item(Index: Integer): IXMLScontoMaggiorazioneType;
    property Items[Index: Integer]: IXMLScontoMaggiorazioneType read Get_Item; default;
  end;

{ IXMLDatiDocumentiCorrelatiType }

  IXMLDatiDocumentiCorrelatiType = interface(IXMLNode)
    ['{BBA5D98C-6EB7-429E-8681-27EDBDA373B5}']
    { Property Accessors }
    function Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
    function Get_IdDocumento: UnicodeString;
    function Get_Data: UnicodeString;
    function Get_NumItem: UnicodeString;
    function Get_CodiceCommessaConvenzione: UnicodeString;
    function Get_CodiceCUP: UnicodeString;
    function Get_CodiceCIG: UnicodeString;
    procedure Set_IdDocumento(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    procedure Set_NumItem(Value: UnicodeString);
    procedure Set_CodiceCommessaConvenzione(Value: UnicodeString);
    procedure Set_CodiceCUP(Value: UnicodeString);
    procedure Set_CodiceCIG(Value: UnicodeString);
    { Methods & Properties }
    property RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList read Get_RiferimentoNumeroLinea;
    property IdDocumento: UnicodeString read Get_IdDocumento write Set_IdDocumento;
    property Data: UnicodeString read Get_Data write Set_Data;
    property NumItem: UnicodeString read Get_NumItem write Set_NumItem;
    property CodiceCommessaConvenzione: UnicodeString read Get_CodiceCommessaConvenzione write Set_CodiceCommessaConvenzione;
    property CodiceCUP: UnicodeString read Get_CodiceCUP write Set_CodiceCUP;
    property CodiceCIG: UnicodeString read Get_CodiceCIG write Set_CodiceCIG;
  end;

{ IXMLDatiDocumentiCorrelatiTypeList }

  IXMLDatiDocumentiCorrelatiTypeList = interface(IXMLNodeCollection)
    ['{A1942430-AE68-4716-92E1-E92834B464D9}']
    { Methods & Properties }
    function Add: IXMLDatiDocumentiCorrelatiType;
    function Insert(const Index: Integer): IXMLDatiDocumentiCorrelatiType;

    function Get_Item(Index: Integer): IXMLDatiDocumentiCorrelatiType;
    property Items[Index: Integer]: IXMLDatiDocumentiCorrelatiType read Get_Item; default;
  end;

{ IXMLDatiSALType }

  IXMLDatiSALType = interface(IXMLNode)
    ['{B6327953-CAD9-443D-932A-D3AC4F29C330}']
    { Property Accessors }
    function Get_RiferimentoFase: Integer;
    procedure Set_RiferimentoFase(Value: Integer);
    { Methods & Properties }
    property RiferimentoFase: Integer read Get_RiferimentoFase write Set_RiferimentoFase;
  end;

{ IXMLDatiSALTypeList }

  IXMLDatiSALTypeList = interface(IXMLNodeCollection)
    ['{092176C3-0BCA-454A-9DFE-1C2C2055A8D1}']
    { Methods & Properties }
    function Add: IXMLDatiSALType;
    function Insert(const Index: Integer): IXMLDatiSALType;

    function Get_Item(Index: Integer): IXMLDatiSALType;
    property Items[Index: Integer]: IXMLDatiSALType read Get_Item; default;
  end;

{ IXMLDatiDDTType }

  IXMLDatiDDTType = interface(IXMLNode)
    ['{80CFD60A-427A-4ECC-821F-42E40135ED79}']
    { Property Accessors }
    function Get_NumeroDDT: UnicodeString;
    function Get_DataDDT: UnicodeString;
    function Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
    procedure Set_NumeroDDT(Value: UnicodeString);
    procedure Set_DataDDT(Value: UnicodeString);
    { Methods & Properties }
    property NumeroDDT: UnicodeString read Get_NumeroDDT write Set_NumeroDDT;
    property DataDDT: UnicodeString read Get_DataDDT write Set_DataDDT;
    property RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList read Get_RiferimentoNumeroLinea;
  end;

{ IXMLDatiDDTTypeList }

  IXMLDatiDDTTypeList = interface(IXMLNodeCollection)
    ['{B181073E-B54C-42C9-8F60-22A48EA834D1}']
    { Methods & Properties }
    function Add: IXMLDatiDDTType;
    function Insert(const Index: Integer): IXMLDatiDDTType;

    function Get_Item(Index: Integer): IXMLDatiDDTType;
    property Items[Index: Integer]: IXMLDatiDDTType read Get_Item; default;
  end;

{ IXMLDatiTrasportoType }

  IXMLDatiTrasportoType = interface(IXMLNode)
    ['{C683A773-F231-4AAA-8597-D6E693351179}']
    { Property Accessors }
    function Get_DatiAnagraficiVettore: IXMLDatiAnagraficiVettoreType;
    function Get_MezzoTrasporto: UnicodeString;
    function Get_CausaleTrasporto: UnicodeString;
    function Get_NumeroColli: Integer;
    function Get_Descrizione: UnicodeString;
    function Get_UnitaMisuraPeso: UnicodeString;
    function Get_PesoLordo: UnicodeString;
    function Get_PesoNetto: UnicodeString;
    function Get_DataOraRitiro: UnicodeString;
    function Get_DataInizioTrasporto: UnicodeString;
    function Get_TipoResa: UnicodeString;
    function Get_IndirizzoResa: IXMLIndirizzoType;
    function Get_DataOraConsegna: UnicodeString;
    procedure Set_MezzoTrasporto(Value: UnicodeString);
    procedure Set_CausaleTrasporto(Value: UnicodeString);
    procedure Set_NumeroColli(Value: Integer);
    procedure Set_Descrizione(Value: UnicodeString);
    procedure Set_UnitaMisuraPeso(Value: UnicodeString);
    procedure Set_PesoLordo(Value: UnicodeString);
    procedure Set_PesoNetto(Value: UnicodeString);
    procedure Set_DataOraRitiro(Value: UnicodeString);
    procedure Set_DataInizioTrasporto(Value: UnicodeString);
    procedure Set_TipoResa(Value: UnicodeString);
    procedure Set_DataOraConsegna(Value: UnicodeString);
    { Methods & Properties }
    property DatiAnagraficiVettore: IXMLDatiAnagraficiVettoreType read Get_DatiAnagraficiVettore;
    property MezzoTrasporto: UnicodeString read Get_MezzoTrasporto write Set_MezzoTrasporto;
    property CausaleTrasporto: UnicodeString read Get_CausaleTrasporto write Set_CausaleTrasporto;
    property NumeroColli: Integer read Get_NumeroColli write Set_NumeroColli;
    property Descrizione: UnicodeString read Get_Descrizione write Set_Descrizione;
    property UnitaMisuraPeso: UnicodeString read Get_UnitaMisuraPeso write Set_UnitaMisuraPeso;
    property PesoLordo: UnicodeString read Get_PesoLordo write Set_PesoLordo;
    property PesoNetto: UnicodeString read Get_PesoNetto write Set_PesoNetto;
    property DataOraRitiro: UnicodeString read Get_DataOraRitiro write Set_DataOraRitiro;
    property DataInizioTrasporto: UnicodeString read Get_DataInizioTrasporto write Set_DataInizioTrasporto;
    property TipoResa: UnicodeString read Get_TipoResa write Set_TipoResa;
    property IndirizzoResa: IXMLIndirizzoType read Get_IndirizzoResa;
    property DataOraConsegna: UnicodeString read Get_DataOraConsegna write Set_DataOraConsegna;
  end;

{ IXMLDatiAnagraficiVettoreType }

  IXMLDatiAnagraficiVettoreType = interface(IXMLNode)
    ['{DADB7FE8-A458-47FD-A847-E957DF3F5A6C}']
    { Property Accessors }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    function Get_NumeroLicenzaGuida: UnicodeString;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    procedure Set_NumeroLicenzaGuida(Value: UnicodeString);
    { Methods & Properties }
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
    property NumeroLicenzaGuida: UnicodeString read Get_NumeroLicenzaGuida write Set_NumeroLicenzaGuida;
  end;

{ IXMLFatturaPrincipaleType }

  IXMLFatturaPrincipaleType = interface(IXMLNode)
    ['{417270B3-708C-4D93-BFEE-64CDB797DEF6}']
    { Property Accessors }
    function Get_NumeroFatturaPrincipale: UnicodeString;
    function Get_DataFatturaPrincipale: UnicodeString;
    procedure Set_NumeroFatturaPrincipale(Value: UnicodeString);
    procedure Set_DataFatturaPrincipale(Value: UnicodeString);
    { Methods & Properties }
    property NumeroFatturaPrincipale: UnicodeString read Get_NumeroFatturaPrincipale write Set_NumeroFatturaPrincipale;
    property DataFatturaPrincipale: UnicodeString read Get_DataFatturaPrincipale write Set_DataFatturaPrincipale;
  end;

{ IXMLDatiBeniServiziType }

  IXMLDatiBeniServiziType = interface(IXMLNode)
    ['{250C5793-88E7-40F6-B54B-169BA169C851}']
    { Property Accessors }
    function Get_DettaglioLinee: IXMLDettaglioLineeTypeList;
    function Get_DatiRiepilogo: IXMLDatiRiepilogoTypeList;
    { Methods & Properties }
    property DettaglioLinee: IXMLDettaglioLineeTypeList read Get_DettaglioLinee;
    property DatiRiepilogo: IXMLDatiRiepilogoTypeList read Get_DatiRiepilogo;
  end;

{ IXMLDettaglioLineeType }

  IXMLDettaglioLineeType = interface(IXMLNode)
    ['{F13C6576-164A-4D97-BE45-828572FEF799}']
    { Property Accessors }
    function Get_NumeroLinea: Integer;
    function Get_TipoCessionePrestazione: UnicodeString;
    function Get_CodiceArticolo: IXMLCodiceArticoloTypeList;
    function Get_Descrizione: UnicodeString;
    function Get_Quantita: UnicodeString;
    function Get_UnitaMisura: UnicodeString;
    function Get_DataInizioPeriodo: UnicodeString;
    function Get_DataFinePeriodo: UnicodeString;
    function Get_PrezzoUnitario: UnicodeString;
    function Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    function Get_PrezzoTotale: UnicodeString;
    function Get_AliquotaIVA: UnicodeString;
    function Get_Ritenuta: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_RiferimentoAmministrazione: UnicodeString;
    function Get_AltriDatiGestionali: IXMLAltriDatiGestionaliTypeList;
    procedure Set_NumeroLinea(Value: Integer);
    procedure Set_TipoCessionePrestazione(Value: UnicodeString);
    procedure Set_Descrizione(Value: UnicodeString);
    procedure Set_Quantita(Value: UnicodeString);
    procedure Set_UnitaMisura(Value: UnicodeString);
    procedure Set_DataInizioPeriodo(Value: UnicodeString);
    procedure Set_DataFinePeriodo(Value: UnicodeString);
    procedure Set_PrezzoUnitario(Value: UnicodeString);
    procedure Set_PrezzoTotale(Value: UnicodeString);
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Ritenuta(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
    { Methods & Properties }
    property NumeroLinea: Integer read Get_NumeroLinea write Set_NumeroLinea;
    property TipoCessionePrestazione: UnicodeString read Get_TipoCessionePrestazione write Set_TipoCessionePrestazione;
    property CodiceArticolo: IXMLCodiceArticoloTypeList read Get_CodiceArticolo;
    property Descrizione: UnicodeString read Get_Descrizione write Set_Descrizione;
    property Quantita: UnicodeString read Get_Quantita write Set_Quantita;
    property UnitaMisura: UnicodeString read Get_UnitaMisura write Set_UnitaMisura;
    property DataInizioPeriodo: UnicodeString read Get_DataInizioPeriodo write Set_DataInizioPeriodo;
    property DataFinePeriodo: UnicodeString read Get_DataFinePeriodo write Set_DataFinePeriodo;
    property PrezzoUnitario: UnicodeString read Get_PrezzoUnitario write Set_PrezzoUnitario;
    property ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList read Get_ScontoMaggiorazione;
    property PrezzoTotale: UnicodeString read Get_PrezzoTotale write Set_PrezzoTotale;
    property AliquotaIVA: UnicodeString read Get_AliquotaIVA write Set_AliquotaIVA;
    property Ritenuta: UnicodeString read Get_Ritenuta write Set_Ritenuta;
    property Natura: UnicodeString read Get_Natura write Set_Natura;
    property RiferimentoAmministrazione: UnicodeString read Get_RiferimentoAmministrazione write Set_RiferimentoAmministrazione;
    property AltriDatiGestionali: IXMLAltriDatiGestionaliTypeList read Get_AltriDatiGestionali;
  end;

{ IXMLDettaglioLineeTypeList }

  IXMLDettaglioLineeTypeList = interface(IXMLNodeCollection)
    ['{AD238E89-0760-4ECB-AD71-6EF277D25ED9}']
    { Methods & Properties }
    function Add: IXMLDettaglioLineeType;
    function Insert(const Index: Integer): IXMLDettaglioLineeType;

    function Get_Item(Index: Integer): IXMLDettaglioLineeType;
    property Items[Index: Integer]: IXMLDettaglioLineeType read Get_Item; default;
  end;

{ IXMLCodiceArticoloType }

  IXMLCodiceArticoloType = interface(IXMLNode)
    ['{80186824-691B-4150-8301-FA2052813970}']
    { Property Accessors }
    function Get_CodiceTipo: UnicodeString;
    function Get_CodiceValore: UnicodeString;
    procedure Set_CodiceTipo(Value: UnicodeString);
    procedure Set_CodiceValore(Value: UnicodeString);
    { Methods & Properties }
    property CodiceTipo: UnicodeString read Get_CodiceTipo write Set_CodiceTipo;
    property CodiceValore: UnicodeString read Get_CodiceValore write Set_CodiceValore;
  end;

{ IXMLCodiceArticoloTypeList }

  IXMLCodiceArticoloTypeList = interface(IXMLNodeCollection)
    ['{21A52991-08DE-4004-A215-6914E2807D14}']
    { Methods & Properties }
    function Add: IXMLCodiceArticoloType;
    function Insert(const Index: Integer): IXMLCodiceArticoloType;

    function Get_Item(Index: Integer): IXMLCodiceArticoloType;
    property Items[Index: Integer]: IXMLCodiceArticoloType read Get_Item; default;
  end;

{ IXMLAltriDatiGestionaliType }

  IXMLAltriDatiGestionaliType = interface(IXMLNode)
    ['{500B1435-DD30-4B0B-B82E-C8BB2CA2C0E9}']
    { Property Accessors }
    function Get_TipoDato: UnicodeString;
    function Get_RiferimentoTesto: UnicodeString;
    function Get_RiferimentoNumero: UnicodeString;
    function Get_RiferimentoData: UnicodeString;
    procedure Set_TipoDato(Value: UnicodeString);
    procedure Set_RiferimentoTesto(Value: UnicodeString);
    procedure Set_RiferimentoNumero(Value: UnicodeString);
    procedure Set_RiferimentoData(Value: UnicodeString);
    { Methods & Properties }
    property TipoDato: UnicodeString read Get_TipoDato write Set_TipoDato;
    property RiferimentoTesto: UnicodeString read Get_RiferimentoTesto write Set_RiferimentoTesto;
    property RiferimentoNumero: UnicodeString read Get_RiferimentoNumero write Set_RiferimentoNumero;
    property RiferimentoData: UnicodeString read Get_RiferimentoData write Set_RiferimentoData;
  end;

{ IXMLAltriDatiGestionaliTypeList }

  IXMLAltriDatiGestionaliTypeList = interface(IXMLNodeCollection)
    ['{2EEDCBAE-CB15-4233-AFE5-5EEDFDABE560}']
    { Methods & Properties }
    function Add: IXMLAltriDatiGestionaliType;
    function Insert(const Index: Integer): IXMLAltriDatiGestionaliType;

    function Get_Item(Index: Integer): IXMLAltriDatiGestionaliType;
    property Items[Index: Integer]: IXMLAltriDatiGestionaliType read Get_Item; default;
  end;

{ IXMLDatiRiepilogoType }

  IXMLDatiRiepilogoType = interface(IXMLNode)
    ['{C4C0B0A1-56AD-48A5-BC1F-67778A7C7695}']
    { Property Accessors }
    function Get_AliquotaIVA: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_SpeseAccessorie: UnicodeString;
    function Get_Arrotondamento: UnicodeString;
    function Get_ImponibileImporto: UnicodeString;
    function Get_Imposta: UnicodeString;
    function Get_EsigibilitaIVA: UnicodeString;
    function Get_RiferimentoNormativo: UnicodeString;
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_SpeseAccessorie(Value: UnicodeString);
    procedure Set_Arrotondamento(Value: UnicodeString);
    procedure Set_ImponibileImporto(Value: UnicodeString);
    procedure Set_Imposta(Value: UnicodeString);
    procedure Set_EsigibilitaIVA(Value: UnicodeString);
    procedure Set_RiferimentoNormativo(Value: UnicodeString);
    { Methods & Properties }
    property AliquotaIVA: UnicodeString read Get_AliquotaIVA write Set_AliquotaIVA;
    property Natura: UnicodeString read Get_Natura write Set_Natura;
    property SpeseAccessorie: UnicodeString read Get_SpeseAccessorie write Set_SpeseAccessorie;
    property Arrotondamento: UnicodeString read Get_Arrotondamento write Set_Arrotondamento;
    property ImponibileImporto: UnicodeString read Get_ImponibileImporto write Set_ImponibileImporto;
    property Imposta: UnicodeString read Get_Imposta write Set_Imposta;
    property EsigibilitaIVA: UnicodeString read Get_EsigibilitaIVA write Set_EsigibilitaIVA;
    property RiferimentoNormativo: UnicodeString read Get_RiferimentoNormativo write Set_RiferimentoNormativo;
  end;

{ IXMLDatiRiepilogoTypeList }

  IXMLDatiRiepilogoTypeList = interface(IXMLNodeCollection)
    ['{3503F815-3775-42CD-9B1A-DE2B3D43AF3E}']
    { Methods & Properties }
    function Add: IXMLDatiRiepilogoType;
    function Insert(const Index: Integer): IXMLDatiRiepilogoType;

    function Get_Item(Index: Integer): IXMLDatiRiepilogoType;
    property Items[Index: Integer]: IXMLDatiRiepilogoType read Get_Item; default;
  end;

{ IXMLDatiVeicoliType }

  IXMLDatiVeicoliType = interface(IXMLNode)
    ['{AFECAA84-1E10-41BE-9986-7687CB662604}']
    { Property Accessors }
    function Get_Data: UnicodeString;
    function Get_TotalePercorso: UnicodeString;
    procedure Set_Data(Value: UnicodeString);
    procedure Set_TotalePercorso(Value: UnicodeString);
    { Methods & Properties }
    property Data: UnicodeString read Get_Data write Set_Data;
    property TotalePercorso: UnicodeString read Get_TotalePercorso write Set_TotalePercorso;
  end;

{ IXMLDatiPagamentoType }

  IXMLDatiPagamentoType = interface(IXMLNode)
    ['{F9B333C5-9A0E-4886-82EB-8C6C36C2F7CB}']
    { Property Accessors }
    function Get_CondizioniPagamento: UnicodeString;
    function Get_DettaglioPagamento: IXMLDettaglioPagamentoTypeList;
    procedure Set_CondizioniPagamento(Value: UnicodeString);
    { Methods & Properties }
    property CondizioniPagamento: UnicodeString read Get_CondizioniPagamento write Set_CondizioniPagamento;
    property DettaglioPagamento: IXMLDettaglioPagamentoTypeList read Get_DettaglioPagamento;
  end;

{ IXMLDatiPagamentoTypeList }

  IXMLDatiPagamentoTypeList = interface(IXMLNodeCollection)
    ['{A3FD47C0-F0A1-40AA-AB8F-56F483C7F900}']
    { Methods & Properties }
    function Add: IXMLDatiPagamentoType;
    function Insert(const Index: Integer): IXMLDatiPagamentoType;

    function Get_Item(Index: Integer): IXMLDatiPagamentoType;
    property Items[Index: Integer]: IXMLDatiPagamentoType read Get_Item; default;
  end;

{ IXMLDettaglioPagamentoType }

  IXMLDettaglioPagamentoType = interface(IXMLNode)
    ['{176ED201-A616-4CA3-8094-7681F28661DA}']
    { Property Accessors }
    function Get_Beneficiario: UnicodeString;
    function Get_ModalitaPagamento: UnicodeString;
    function Get_DataRiferimentoTerminiPagamento: UnicodeString;
    function Get_GiorniTerminiPagamento: Integer;
    function Get_DataScadenzaPagamento: UnicodeString;
    function Get_ImportoPagamento: UnicodeString;
    function Get_CodUfficioPostale: UnicodeString;
    function Get_CognomeQuietanzante: UnicodeString;
    function Get_NomeQuietanzante: UnicodeString;
    function Get_CFQuietanzante: UnicodeString;
    function Get_TitoloQuietanzante: UnicodeString;
    function Get_IstitutoFinanziario: UnicodeString;
    function Get_IBAN: UnicodeString;
    function Get_ABI: UnicodeString;
    function Get_CAB: UnicodeString;
    function Get_BIC: UnicodeString;
    function Get_ScontoPagamentoAnticipato: UnicodeString;
    function Get_DataLimitePagamentoAnticipato: UnicodeString;
    function Get_PenalitaPagamentiRitardati: UnicodeString;
    function Get_DataDecorrenzaPenale: UnicodeString;
    function Get_CodicePagamento: UnicodeString;
    procedure Set_Beneficiario(Value: UnicodeString);
    procedure Set_ModalitaPagamento(Value: UnicodeString);
    procedure Set_DataRiferimentoTerminiPagamento(Value: UnicodeString);
    procedure Set_GiorniTerminiPagamento(Value: Integer);
    procedure Set_DataScadenzaPagamento(Value: UnicodeString);
    procedure Set_ImportoPagamento(Value: UnicodeString);
    procedure Set_CodUfficioPostale(Value: UnicodeString);
    procedure Set_CognomeQuietanzante(Value: UnicodeString);
    procedure Set_NomeQuietanzante(Value: UnicodeString);
    procedure Set_CFQuietanzante(Value: UnicodeString);
    procedure Set_TitoloQuietanzante(Value: UnicodeString);
    procedure Set_IstitutoFinanziario(Value: UnicodeString);
    procedure Set_IBAN(Value: UnicodeString);
    procedure Set_ABI(Value: UnicodeString);
    procedure Set_CAB(Value: UnicodeString);
    procedure Set_BIC(Value: UnicodeString);
    procedure Set_ScontoPagamentoAnticipato(Value: UnicodeString);
    procedure Set_DataLimitePagamentoAnticipato(Value: UnicodeString);
    procedure Set_PenalitaPagamentiRitardati(Value: UnicodeString);
    procedure Set_DataDecorrenzaPenale(Value: UnicodeString);
    procedure Set_CodicePagamento(Value: UnicodeString);
    { Methods & Properties }
    property Beneficiario: UnicodeString read Get_Beneficiario write Set_Beneficiario;
    property ModalitaPagamento: UnicodeString read Get_ModalitaPagamento write Set_ModalitaPagamento;
    property DataRiferimentoTerminiPagamento: UnicodeString read Get_DataRiferimentoTerminiPagamento write Set_DataRiferimentoTerminiPagamento;
    property GiorniTerminiPagamento: Integer read Get_GiorniTerminiPagamento write Set_GiorniTerminiPagamento;
    property DataScadenzaPagamento: UnicodeString read Get_DataScadenzaPagamento write Set_DataScadenzaPagamento;
    property ImportoPagamento: UnicodeString read Get_ImportoPagamento write Set_ImportoPagamento;
    property CodUfficioPostale: UnicodeString read Get_CodUfficioPostale write Set_CodUfficioPostale;
    property CognomeQuietanzante: UnicodeString read Get_CognomeQuietanzante write Set_CognomeQuietanzante;
    property NomeQuietanzante: UnicodeString read Get_NomeQuietanzante write Set_NomeQuietanzante;
    property CFQuietanzante: UnicodeString read Get_CFQuietanzante write Set_CFQuietanzante;
    property TitoloQuietanzante: UnicodeString read Get_TitoloQuietanzante write Set_TitoloQuietanzante;
    property IstitutoFinanziario: UnicodeString read Get_IstitutoFinanziario write Set_IstitutoFinanziario;
    property IBAN: UnicodeString read Get_IBAN write Set_IBAN;
    property ABI: UnicodeString read Get_ABI write Set_ABI;
    property CAB: UnicodeString read Get_CAB write Set_CAB;
    property BIC: UnicodeString read Get_BIC write Set_BIC;
    property ScontoPagamentoAnticipato: UnicodeString read Get_ScontoPagamentoAnticipato write Set_ScontoPagamentoAnticipato;
    property DataLimitePagamentoAnticipato: UnicodeString read Get_DataLimitePagamentoAnticipato write Set_DataLimitePagamentoAnticipato;
    property PenalitaPagamentiRitardati: UnicodeString read Get_PenalitaPagamentiRitardati write Set_PenalitaPagamentiRitardati;
    property DataDecorrenzaPenale: UnicodeString read Get_DataDecorrenzaPenale write Set_DataDecorrenzaPenale;
    property CodicePagamento: UnicodeString read Get_CodicePagamento write Set_CodicePagamento;
  end;

{ IXMLDettaglioPagamentoTypeList }

  IXMLDettaglioPagamentoTypeList = interface(IXMLNodeCollection)
    ['{259CCA56-B2C2-40C9-BD1A-7EC6341484D0}']
    { Methods & Properties }
    function Add: IXMLDettaglioPagamentoType;
    function Insert(const Index: Integer): IXMLDettaglioPagamentoType;

    function Get_Item(Index: Integer): IXMLDettaglioPagamentoType;
    property Items[Index: Integer]: IXMLDettaglioPagamentoType read Get_Item; default;
  end;

{ IXMLAllegatiType }

  IXMLAllegatiType = interface(IXMLNode)
    ['{6C0360A1-2C3D-4A60-A051-21854B4D4970}']
    { Property Accessors }
    function Get_NomeAttachment: UnicodeString;
    function Get_AlgoritmoCompressione: UnicodeString;
    function Get_FormatoAttachment: UnicodeString;
    function Get_DescrizioneAttachment: UnicodeString;
    function Get_Attachment: UnicodeString;
    procedure Set_NomeAttachment(Value: UnicodeString);
    procedure Set_AlgoritmoCompressione(Value: UnicodeString);
    procedure Set_FormatoAttachment(Value: UnicodeString);
    procedure Set_DescrizioneAttachment(Value: UnicodeString);
    procedure Set_Attachment(Value: UnicodeString);
    { Methods & Properties }
    property NomeAttachment: UnicodeString read Get_NomeAttachment write Set_NomeAttachment;
    property AlgoritmoCompressione: UnicodeString read Get_AlgoritmoCompressione write Set_AlgoritmoCompressione;
    property FormatoAttachment: UnicodeString read Get_FormatoAttachment write Set_FormatoAttachment;
    property DescrizioneAttachment: UnicodeString read Get_DescrizioneAttachment write Set_DescrizioneAttachment;
    property Attachment: UnicodeString read Get_Attachment write Set_Attachment;
  end;

{ IXMLAllegatiTypeList }

  IXMLAllegatiTypeList = interface(IXMLNodeCollection)
    ['{5297D5E1-48B6-4EB4-B3E9-4A1535681363}']
    { Methods & Properties }
    function Add: IXMLAllegatiType;
    function Insert(const Index: Integer): IXMLAllegatiType;

    function Get_Item(Index: Integer): IXMLAllegatiType;
    property Items[Index: Integer]: IXMLAllegatiType read Get_Item; default;
  end;

{ IXMLSignatureType_ds }

  IXMLSignatureType_ds = interface(IXMLNode)
    ['{A89F5599-9E96-46F0-8D24-90F6A9F3ECDE}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    function Get_Object_: IXMLObjectType_dsList;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property SignedInfo: IXMLSignedInfoType_ds read Get_SignedInfo;
    property SignatureValue: IXMLSignatureValueType_ds read Get_SignatureValue;
    property KeyInfo: IXMLKeyInfoType_ds read Get_KeyInfo;
    property Object_: IXMLObjectType_dsList read Get_Object_;
  end;

{ IXMLSignedInfoType_ds }

  IXMLSignedInfoType_ds = interface(IXMLNode)
    ['{236B760A-612D-4946-8D35-D24905F85063}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethodType_ds;
    function Get_SignatureMethod: IXMLSignatureMethodType_ds;
    function Get_Reference: IXMLReferenceType_dsList;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property CanonicalizationMethod: IXMLCanonicalizationMethodType_ds read Get_CanonicalizationMethod;
    property SignatureMethod: IXMLSignatureMethodType_ds read Get_SignatureMethod;
    property Reference: IXMLReferenceType_dsList read Get_Reference;
  end;

{ IXMLCanonicalizationMethodType_ds }

  IXMLCanonicalizationMethodType_ds = interface(IXMLNode)
    ['{E6BB8015-332D-4CB3-A8D0-B6DA9BD6B895}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureMethodType_ds }

  IXMLSignatureMethodType_ds = interface(IXMLNode)
    ['{585D8B90-E976-4C0F-A95E-D40736AA4540}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    function Get_HMACOutputLength: Integer;
    procedure Set_Algorithm(Value: UnicodeString);
    procedure Set_HMACOutputLength(Value: Integer);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
    property HMACOutputLength: Integer read Get_HMACOutputLength write Set_HMACOutputLength;
  end;

{ IXMLReferenceType_ds }

  IXMLReferenceType_ds = interface(IXMLNode)
    ['{229525B6-A243-4A21-996C-76F1A6FCD853}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethodType_ds;
    function Get_DigestValue: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DigestValue(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property URI: UnicodeString read Get_URI write Set_URI;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType_ds read Get_Transforms;
    property DigestMethod: IXMLDigestMethodType_ds read Get_DigestMethod;
    property DigestValue: UnicodeString read Get_DigestValue write Set_DigestValue;
  end;

{ IXMLReferenceType_dsList }

  IXMLReferenceType_dsList = interface(IXMLNodeCollection)
    ['{2ACCD3F8-1C04-45EE-B1C8-94EC03BA77FE}']
    { Methods & Properties }
    function Add: IXMLReferenceType_ds;
    function Insert(const Index: Integer): IXMLReferenceType_ds;

    function Get_Item(Index: Integer): IXMLReferenceType_ds;
    property Items[Index: Integer]: IXMLReferenceType_ds read Get_Item; default;
  end;

{ IXMLTransformsType_ds }

  IXMLTransformsType_ds = interface(IXMLNodeCollection)
    ['{FB4B91B8-3443-425B-B206-BD38C7F0DBCC}']
    { Property Accessors }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    { Methods & Properties }
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
    property Transform[Index: Integer]: IXMLTransformType_ds read Get_Transform; default;
  end;

{ IXMLTransformType_ds }

  IXMLTransformType_ds = interface(IXMLNodeCollection)
    ['{B7B21D3F-0A65-4C78-BA34-98D1813B4FF5}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    function Get_XPath(Index: Integer): UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    function Add(const XPath: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
    property XPath[Index: Integer]: UnicodeString read Get_XPath; default;
  end;

{ IXMLDigestMethodType_ds }

  IXMLDigestMethodType_ds = interface(IXMLNode)
    ['{0F8510A7-B4FC-407F-8DAD-EDB740D7587F}']
    { Property Accessors }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    { Methods & Properties }
    property Algorithm: UnicodeString read Get_Algorithm write Set_Algorithm;
  end;

{ IXMLSignatureValueType_ds }

  IXMLSignatureValueType_ds = interface(IXMLNode)
    ['{869E5E53-F620-4516-A57E-A9BB926EF21F}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
  end;

{ IXMLKeyInfoType_ds }

  IXMLKeyInfoType_ds = interface(IXMLNode)
    ['{F68023E1-8AEB-4D7E-8D08-20CA10AEE8BE}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_KeyName: IXMLString_List;
    function Get_KeyValue: IXMLKeyValueType_dsList;
    function Get_RetrievalMethod: IXMLRetrievalMethodType_dsList;
    function Get_X509Data: IXMLX509DataType_dsList;
    function Get_PGPData: IXMLPGPDataType_dsList;
    function Get_SPKIData: IXMLSPKIDataType_dsList;
    function Get_MgmtData: IXMLString_List;
    procedure Set_Id(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property KeyName: IXMLString_List read Get_KeyName;
    property KeyValue: IXMLKeyValueType_dsList read Get_KeyValue;
    property RetrievalMethod: IXMLRetrievalMethodType_dsList read Get_RetrievalMethod;
    property X509Data: IXMLX509DataType_dsList read Get_X509Data;
    property PGPData: IXMLPGPDataType_dsList read Get_PGPData;
    property SPKIData: IXMLSPKIDataType_dsList read Get_SPKIData;
    property MgmtData: IXMLString_List read Get_MgmtData;
  end;

{ IXMLKeyValueType_ds }

  IXMLKeyValueType_ds = interface(IXMLNode)
    ['{0CED797F-615C-4D85-871E-C8589CEE3097}']
    { Property Accessors }
    function Get_DSAKeyValue: IXMLDSAKeyValueType_ds;
    function Get_RSAKeyValue: IXMLRSAKeyValueType_ds;
    { Methods & Properties }
    property DSAKeyValue: IXMLDSAKeyValueType_ds read Get_DSAKeyValue;
    property RSAKeyValue: IXMLRSAKeyValueType_ds read Get_RSAKeyValue;
  end;

{ IXMLKeyValueType_dsList }

  IXMLKeyValueType_dsList = interface(IXMLNodeCollection)
    ['{9D28B7B1-8B30-47F8-9540-20B30134ECDB}']
    { Methods & Properties }
    function Add: IXMLKeyValueType_ds;
    function Insert(const Index: Integer): IXMLKeyValueType_ds;

    function Get_Item(Index: Integer): IXMLKeyValueType_ds;
    property Items[Index: Integer]: IXMLKeyValueType_ds read Get_Item; default;
  end;

{ IXMLDSAKeyValueType_ds }

  IXMLDSAKeyValueType_ds = interface(IXMLNode)
    ['{FDCE7544-46DA-4365-AD99-77FEFF80E6A0}']
    { Property Accessors }
    function Get_P: UnicodeString;
    function Get_Q: UnicodeString;
    function Get_G: UnicodeString;
    function Get_Y: UnicodeString;
    function Get_J: UnicodeString;
    function Get_Seed: UnicodeString;
    function Get_PgenCounter: UnicodeString;
    procedure Set_P(Value: UnicodeString);
    procedure Set_Q(Value: UnicodeString);
    procedure Set_G(Value: UnicodeString);
    procedure Set_Y(Value: UnicodeString);
    procedure Set_J(Value: UnicodeString);
    procedure Set_Seed(Value: UnicodeString);
    procedure Set_PgenCounter(Value: UnicodeString);
    { Methods & Properties }
    property P: UnicodeString read Get_P write Set_P;
    property Q: UnicodeString read Get_Q write Set_Q;
    property G: UnicodeString read Get_G write Set_G;
    property Y: UnicodeString read Get_Y write Set_Y;
    property J: UnicodeString read Get_J write Set_J;
    property Seed: UnicodeString read Get_Seed write Set_Seed;
    property PgenCounter: UnicodeString read Get_PgenCounter write Set_PgenCounter;
  end;

{ IXMLRSAKeyValueType_ds }

  IXMLRSAKeyValueType_ds = interface(IXMLNode)
    ['{9B2995C4-8E51-46D0-A819-EF283998DF2C}']
    { Property Accessors }
    function Get_Modulus: UnicodeString;
    function Get_Exponent: UnicodeString;
    procedure Set_Modulus(Value: UnicodeString);
    procedure Set_Exponent(Value: UnicodeString);
    { Methods & Properties }
    property Modulus: UnicodeString read Get_Modulus write Set_Modulus;
    property Exponent: UnicodeString read Get_Exponent write Set_Exponent;
  end;

{ IXMLRetrievalMethodType_ds }

  IXMLRetrievalMethodType_ds = interface(IXMLNode)
    ['{7FDC61B6-E3E0-4A7F-A7CE-FF4506A27DDE}']
    { Property Accessors }
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    { Methods & Properties }
    property URI: UnicodeString read Get_URI write Set_URI;
    property Type_: UnicodeString read Get_Type_ write Set_Type_;
    property Transforms: IXMLTransformsType_ds read Get_Transforms;
  end;

{ IXMLRetrievalMethodType_dsList }

  IXMLRetrievalMethodType_dsList = interface(IXMLNodeCollection)
    ['{2A710076-F4E7-4143-9C62-4A849B791000}']
    { Methods & Properties }
    function Add: IXMLRetrievalMethodType_ds;
    function Insert(const Index: Integer): IXMLRetrievalMethodType_ds;

    function Get_Item(Index: Integer): IXMLRetrievalMethodType_ds;
    property Items[Index: Integer]: IXMLRetrievalMethodType_ds read Get_Item; default;
  end;

{ IXMLX509DataType_ds }

  IXMLX509DataType_ds = interface(IXMLNode)
    ['{5C6A4C69-6304-49D1-AC50-F02833893DE8}']
    { Property Accessors }
    function Get_X509IssuerSerial: IXMLX509IssuerSerialType_dsList;
    function Get_X509SKI: IXMLBase64BinaryList;
    function Get_X509SubjectName: IXMLString_List;
    function Get_X509Certificate: IXMLBase64BinaryList;
    function Get_X509CRL: IXMLBase64BinaryList;
    { Methods & Properties }
    property X509IssuerSerial: IXMLX509IssuerSerialType_dsList read Get_X509IssuerSerial;
    property X509SKI: IXMLBase64BinaryList read Get_X509SKI;
    property X509SubjectName: IXMLString_List read Get_X509SubjectName;
    property X509Certificate: IXMLBase64BinaryList read Get_X509Certificate;
    property X509CRL: IXMLBase64BinaryList read Get_X509CRL;
  end;

{ IXMLX509DataType_dsList }

  IXMLX509DataType_dsList = interface(IXMLNodeCollection)
    ['{A4232B37-A419-4C27-8770-C4B5C260A5DA}']
    { Methods & Properties }
    function Add: IXMLX509DataType_ds;
    function Insert(const Index: Integer): IXMLX509DataType_ds;

    function Get_Item(Index: Integer): IXMLX509DataType_ds;
    property Items[Index: Integer]: IXMLX509DataType_ds read Get_Item; default;
  end;

{ IXMLX509IssuerSerialType_ds }

  IXMLX509IssuerSerialType_ds = interface(IXMLNode)
    ['{F1BDC5E6-D6EE-4187-BAF5-A7D5D673737B}']
    { Property Accessors }
    function Get_X509IssuerName: UnicodeString;
    function Get_X509SerialNumber: Integer;
    procedure Set_X509IssuerName(Value: UnicodeString);
    procedure Set_X509SerialNumber(Value: Integer);
    { Methods & Properties }
    property X509IssuerName: UnicodeString read Get_X509IssuerName write Set_X509IssuerName;
    property X509SerialNumber: Integer read Get_X509SerialNumber write Set_X509SerialNumber;
  end;

{ IXMLX509IssuerSerialType_dsList }

  IXMLX509IssuerSerialType_dsList = interface(IXMLNodeCollection)
    ['{F6148245-DCD7-4631-B95D-4D1848DA8C8E}']
    { Methods & Properties }
    function Add: IXMLX509IssuerSerialType_ds;
    function Insert(const Index: Integer): IXMLX509IssuerSerialType_ds;

    function Get_Item(Index: Integer): IXMLX509IssuerSerialType_ds;
    property Items[Index: Integer]: IXMLX509IssuerSerialType_ds read Get_Item; default;
  end;

{ IXMLPGPDataType_ds }

  IXMLPGPDataType_ds = interface(IXMLNode)
    ['{69690DFA-BC04-4293-A1B4-38ABF2390559}']
    { Property Accessors }
    function Get_PGPKeyID: UnicodeString;
    function Get_PGPKeyPacket: UnicodeString;
    procedure Set_PGPKeyID(Value: UnicodeString);
    procedure Set_PGPKeyPacket(Value: UnicodeString);
    { Methods & Properties }
    property PGPKeyID: UnicodeString read Get_PGPKeyID write Set_PGPKeyID;
    property PGPKeyPacket: UnicodeString read Get_PGPKeyPacket write Set_PGPKeyPacket;
  end;

{ IXMLPGPDataType_dsList }

  IXMLPGPDataType_dsList = interface(IXMLNodeCollection)
    ['{6A5A42D3-334C-4A92-90C6-76FE4AFE2BBD}']
    { Methods & Properties }
    function Add: IXMLPGPDataType_ds;
    function Insert(const Index: Integer): IXMLPGPDataType_ds;

    function Get_Item(Index: Integer): IXMLPGPDataType_ds;
    property Items[Index: Integer]: IXMLPGPDataType_ds read Get_Item; default;
  end;

{ IXMLSPKIDataType_ds }

  IXMLSPKIDataType_ds = interface(IXMLNodeCollection)
    ['{E0B814BE-208A-4206-A3D6-24D569A6FC92}']
    { Property Accessors }
    function Get_SPKISexp(Index: Integer): UnicodeString;
    { Methods & Properties }
    function Add(const SPKISexp: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const SPKISexp: UnicodeString): IXMLNode;
    property SPKISexp[Index: Integer]: UnicodeString read Get_SPKISexp; default;
  end;

{ IXMLSPKIDataType_dsList }

  IXMLSPKIDataType_dsList = interface(IXMLNodeCollection)
    ['{152F56EA-266A-4630-B515-86FBAC239878}']
    { Methods & Properties }
    function Add: IXMLSPKIDataType_ds;
    function Insert(const Index: Integer): IXMLSPKIDataType_ds;

    function Get_Item(Index: Integer): IXMLSPKIDataType_ds;
    property Items[Index: Integer]: IXMLSPKIDataType_ds read Get_Item; default;
  end;

{ IXMLObjectType_ds }

  IXMLObjectType_ds = interface(IXMLNode)
    ['{1284AF06-3B4E-4194-B8D0-316788C5A836}']
    { Property Accessors }
    function Get_Id: UnicodeString;
    function Get_MimeType: UnicodeString;
    function Get_Encoding: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_MimeType(Value: UnicodeString);
    procedure Set_Encoding(Value: UnicodeString);
    { Methods & Properties }
    property Id: UnicodeString read Get_Id write Set_Id;
    property MimeType: UnicodeString read Get_MimeType write Set_MimeType;
    property Encoding: UnicodeString read Get_Encoding write Set_Encoding;
  end;

{ IXMLObjectType_dsList }

  IXMLObjectType_dsList = interface(IXMLNodeCollection)
    ['{F867208D-B8A1-42E8-BF56-AAC49528BE83}']
    { Methods & Properties }
    function Add: IXMLObjectType_ds;
    function Insert(const Index: Integer): IXMLObjectType_ds;

    function Get_Item(Index: Integer): IXMLObjectType_ds;
    property Items[Index: Integer]: IXMLObjectType_ds read Get_Item; default;
  end;

{ IXMLString200LatinTypeList }

  IXMLString200LatinTypeList = interface(IXMLNodeCollection)
    ['{907D40A2-78D4-4A2C-A762-FF808DE77D90}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ IXMLRiferimentoNumeroLineaTypeList }

  IXMLRiferimentoNumeroLineaTypeList = interface(IXMLNodeCollection)
    ['{9A73DEE6-BE7C-45EE-A45B-B5D84F9C0B6D}']
    { Methods & Properties }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
    property Items[Index: Integer]: Integer read Get_Item; default;
  end;

{ IXMLBase64BinaryList }

  IXMLBase64BinaryList = interface(IXMLNodeCollection)
    ['{DB1ADB54-5BB4-471B-A0C1-3ACF56AD6732}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ IXMLString_List }

  IXMLString_List = interface(IXMLNodeCollection)
    ['{2A728387-D87A-4850-A039-8FCF991B83E4}']
    { Methods & Properties }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
    property Items[Index: Integer]: UnicodeString read Get_Item; default;
  end;

{ Forward Decls }

  TXMLFatturaElettronicaType = class;
  TXMLFatturaElettronicaHeaderType = class;
  TXMLDatiTrasmissioneType = class;
  TXMLIdFiscaleType = class;
  TXMLContattiTrasmittenteType = class;
  TXMLCedentePrestatoreType = class;
  TXMLDatiAnagraficiCedenteType = class;
  TXMLAnagraficaType = class;
  TXMLIndirizzoType = class;
  TXMLIscrizioneREAType = class;
  TXMLContattiType = class;
  TXMLRappresentanteFiscaleType = class;
  TXMLDatiAnagraficiRappresentanteType = class;
  TXMLCessionarioCommittenteType = class;
  TXMLDatiAnagraficiCessionarioType = class;
  TXMLTerzoIntermediarioSoggettoEmittenteType = class;
  TXMLDatiAnagraficiTerzoIntermediarioType = class;
  TXMLFatturaElettronicaBodyType = class;
  TXMLFatturaElettronicaBodyTypeList = class;
  TXMLDatiGeneraliType = class;
  TXMLDatiGeneraliDocumentoType = class;
  TXMLDatiRitenutaType = class;
  TXMLDatiBolloType = class;
  TXMLDatiCassaPrevidenzialeType = class;
  TXMLDatiCassaPrevidenzialeTypeList = class;
  TXMLScontoMaggiorazioneType = class;
  TXMLScontoMaggiorazioneTypeList = class;
  TXMLDatiDocumentiCorrelatiType = class;
  TXMLDatiDocumentiCorrelatiTypeList = class;
  TXMLDatiSALType = class;
  TXMLDatiSALTypeList = class;
  TXMLDatiDDTType = class;
  TXMLDatiDDTTypeList = class;
  TXMLDatiTrasportoType = class;
  TXMLDatiAnagraficiVettoreType = class;
  TXMLFatturaPrincipaleType = class;
  TXMLDatiBeniServiziType = class;
  TXMLDettaglioLineeType = class;
  TXMLDettaglioLineeTypeList = class;
  TXMLCodiceArticoloType = class;
  TXMLCodiceArticoloTypeList = class;
  TXMLAltriDatiGestionaliType = class;
  TXMLAltriDatiGestionaliTypeList = class;
  TXMLDatiRiepilogoType = class;
  TXMLDatiRiepilogoTypeList = class;
  TXMLDatiVeicoliType = class;
  TXMLDatiPagamentoType = class;
  TXMLDatiPagamentoTypeList = class;
  TXMLDettaglioPagamentoType = class;
  TXMLDettaglioPagamentoTypeList = class;
  TXMLAllegatiType = class;
  TXMLAllegatiTypeList = class;
  TXMLSignatureType_ds = class;
  TXMLSignedInfoType_ds = class;
  TXMLCanonicalizationMethodType_ds = class;
  TXMLSignatureMethodType_ds = class;
  TXMLReferenceType_ds = class;
  TXMLReferenceType_dsList = class;
  TXMLTransformsType_ds = class;
  TXMLTransformType_ds = class;
  TXMLDigestMethodType_ds = class;
  TXMLSignatureValueType_ds = class;
  TXMLKeyInfoType_ds = class;
  TXMLKeyValueType_ds = class;
  TXMLKeyValueType_dsList = class;
  TXMLDSAKeyValueType_ds = class;
  TXMLRSAKeyValueType_ds = class;
  TXMLRetrievalMethodType_ds = class;
  TXMLRetrievalMethodType_dsList = class;
  TXMLX509DataType_ds = class;
  TXMLX509DataType_dsList = class;
  TXMLX509IssuerSerialType_ds = class;
  TXMLX509IssuerSerialType_dsList = class;
  TXMLPGPDataType_ds = class;
  TXMLPGPDataType_dsList = class;
  TXMLSPKIDataType_ds = class;
  TXMLSPKIDataType_dsList = class;
  TXMLObjectType_ds = class;
  TXMLObjectType_dsList = class;
  TXMLString200LatinTypeList = class;
  TXMLRiferimentoNumeroLineaTypeList = class;
  TXMLBase64BinaryList = class;
  TXMLString_List = class;

{ TXMLFatturaElettronicaType }

  [ioEntity]
  TXMLFatturaElettronicaType = class(TXMLNode, IXMLFatturaElettronicaType, IInterface)
  private
    FFatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList;
  protected
    { IXMLFatturaElettronicaType }
    function Get_Versione: UnicodeString;
    function Get_FatturaElettronicaHeader: IXMLFatturaElettronicaHeaderType;
    function Get_FatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList;
    function Get_Signature: IXMLSignatureType_ds;
    procedure Set_Versione(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
    property Versione: UnicodeString read Get_Versione write Set_Versione;
    [ioBelongsTo('IXMLFatturaElettronicaHeaderType')]
    property FatturaElettronicaHeader: IXMLFatturaElettronicaHeaderType read Get_FatturaElettronicaHeader;
    [ioBelongsTo('IXMLFatturaElettronicaBodyTypeList')]
    property FatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList read Get_FatturaElettronicaBody;
    property Signature: IXMLSignatureType_ds read Get_Signature;
  end;

{ TXMLFatturaElettronicaHeaderType }

  [ioEntity]
  TXMLFatturaElettronicaHeaderType = class(TXMLNode, IXMLFatturaElettronicaHeaderType)
  protected
    { IXMLFatturaElettronicaHeaderType }
    function Get_DatiTrasmissione: IXMLDatiTrasmissioneType;
    function Get_CedentePrestatore: IXMLCedentePrestatoreType;
    function Get_RappresentanteFiscale: IXMLRappresentanteFiscaleType;
    function Get_CessionarioCommittente: IXMLCessionarioCommittenteType;
    function Get_TerzoIntermediarioOSoggettoEmittente: IXMLTerzoIntermediarioSoggettoEmittenteType;
    function Get_SoggettoEmittente: UnicodeString;
    procedure Set_SoggettoEmittente(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
    property DatiTrasmissione: IXMLDatiTrasmissioneType read Get_DatiTrasmissione;
    [ioBelongsTo('IXMLCedentePrestatoreType')]
    property CedentePrestatore: IXMLCedentePrestatoreType read Get_CedentePrestatore;
    property RappresentanteFiscale: IXMLRappresentanteFiscaleType read Get_RappresentanteFiscale;
    property CessionarioCommittente: IXMLCessionarioCommittenteType read Get_CessionarioCommittente;
    property TerzoIntermediarioOSoggettoEmittente: IXMLTerzoIntermediarioSoggettoEmittenteType read Get_TerzoIntermediarioOSoggettoEmittente;
    property SoggettoEmittente: UnicodeString read Get_SoggettoEmittente write Set_SoggettoEmittente;
  end;

{ TXMLDatiTrasmissioneType }

  [ioEntity]
  TXMLDatiTrasmissioneType = class(TXMLNode, IXMLDatiTrasmissioneType)
  protected
    { IXMLDatiTrasmissioneType }
    function Get_IdTrasmittente: IXMLIdFiscaleType;
    function Get_ProgressivoInvio: UnicodeString;
    function Get_FormatoTrasmissione: UnicodeString;
    function Get_CodiceDestinatario: UnicodeString;
    function Get_ContattiTrasmittente: IXMLContattiTrasmittenteType;
    procedure Set_ProgressivoInvio(Value: UnicodeString);
    procedure Set_FormatoTrasmissione(Value: UnicodeString);
    procedure Set_CodiceDestinatario(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLIdFiscaleType }

  [ioEntity]
  TXMLIdFiscaleType = class(TXMLNode, IXMLIdFiscaleType)
  protected
    { IXMLIdFiscaleType }
    function Get_IdPaese: UnicodeString;
    function Get_IdCodice: UnicodeString;
    procedure Set_IdPaese(Value: UnicodeString);
    procedure Set_IdCodice(Value: UnicodeString);
  public
    property IdPaese: UnicodeString read Get_IdPaese write Set_IdPaese;
    property IdCodice: UnicodeString read Get_IdCodice write Set_IdCodice;
  end;

{ TXMLContattiTrasmittenteType }

  [ioEntity]
  TXMLContattiTrasmittenteType = class(TXMLNode, IXMLContattiTrasmittenteType)
  protected
    { IXMLContattiTrasmittenteType }
    function Get_Telefono: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_Telefono(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
  end;

{ TXMLCedentePrestatoreType }

  [ioEntity]
  TXMLCedentePrestatoreType = class(TXMLNode, IXMLCedentePrestatoreType)
  protected
    { IXMLCedentePrestatoreType }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiCedenteType;
    function Get_Sede: IXMLIndirizzoType;
    function Get_StabileOrganizzazione: IXMLIndirizzoType;
    function Get_IscrizioneREA: IXMLIscrizioneREAType;
    function Get_Contatti: IXMLContattiType;
    function Get_RiferimentoAmministrazione: UnicodeString;
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
    [ioBelongsTo('IXMLDatiAnagraficiCedenteType')]
    property DatiAnagrafici: IXMLDatiAnagraficiCedenteType read Get_DatiAnagrafici;
    property Sede: IXMLIndirizzoType read Get_Sede;
    property StabileOrganizzazione: IXMLIndirizzoType read Get_StabileOrganizzazione;
    property IscrizioneREA: IXMLIscrizioneREAType read Get_IscrizioneREA;
    property Contatti: IXMLContattiType read Get_Contatti;
    property RiferimentoAmministrazione: UnicodeString read Get_RiferimentoAmministrazione write Set_RiferimentoAmministrazione;
  end;

{ TXMLDatiAnagraficiCedenteType }

  [ioEntity]
  TXMLDatiAnagraficiCedenteType = class(TXMLNode, IXMLDatiAnagraficiCedenteType)
  protected
    { IXMLDatiAnagraficiCedenteType }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    function Get_AlboProfessionale: UnicodeString;
    function Get_ProvinciaAlbo: UnicodeString;
    function Get_NumeroIscrizioneAlbo: UnicodeString;
    function Get_DataIscrizioneAlbo: UnicodeString;
    function Get_RegimeFiscale: UnicodeString;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    procedure Set_AlboProfessionale(Value: UnicodeString);
    procedure Set_ProvinciaAlbo(Value: UnicodeString);
    procedure Set_NumeroIscrizioneAlbo(Value: UnicodeString);
    procedure Set_DataIscrizioneAlbo(Value: UnicodeString);
    procedure Set_RegimeFiscale(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
    [ioBelongsTo('IXMLIdFiscaleType')]
    property IdFiscaleIVA: IXMLIdFiscaleType read Get_IdFiscaleIVA;
    property CodiceFiscale: UnicodeString read Get_CodiceFiscale write Set_CodiceFiscale;
    [ioBelongsTo('IXMLAnagraficaType')]
    property Anagrafica: IXMLAnagraficaType read Get_Anagrafica;
    property AlboProfessionale: UnicodeString read Get_AlboProfessionale write Set_AlboProfessionale;
    property ProvinciaAlbo: UnicodeString read Get_ProvinciaAlbo write Set_ProvinciaAlbo;
    property NumeroIscrizioneAlbo: UnicodeString read Get_NumeroIscrizioneAlbo write Set_NumeroIscrizioneAlbo;
    property DataIscrizioneAlbo: UnicodeString read Get_DataIscrizioneAlbo write Set_DataIscrizioneAlbo;
    property RegimeFiscale: UnicodeString read Get_RegimeFiscale write Set_RegimeFiscale;
  end;

{ TXMLAnagraficaType }

  [ioEntity]
  TXMLAnagraficaType = class(TXMLNode, IXMLAnagraficaType)
  protected
    { IXMLAnagraficaType }
    function Get_Denominazione: UnicodeString;
    function Get_Nome: UnicodeString;
    function Get_Cognome: UnicodeString;
    function Get_Titolo: UnicodeString;
    function Get_CodEORI: UnicodeString;
    procedure Set_Denominazione(Value: UnicodeString);
    procedure Set_Nome(Value: UnicodeString);
    procedure Set_Cognome(Value: UnicodeString);
    procedure Set_Titolo(Value: UnicodeString);
    procedure Set_CodEORI(Value: UnicodeString);
  public
    property Denominazione: UnicodeString read Get_Denominazione write Set_Denominazione;
    property Nome: UnicodeString read Get_Nome write Set_Nome;
    property Cognome: UnicodeString read Get_Cognome write Set_Cognome;
    property Titolo: UnicodeString read Get_Titolo write Set_Titolo;
    property CodEORI: UnicodeString read Get_CodEORI write Set_CodEORI;
  end;

{ TXMLIndirizzoType }

  [ioEntity]
  TXMLIndirizzoType = class(TXMLNode, IXMLIndirizzoType)
  protected
    { IXMLIndirizzoType }
    function Get_Indirizzo: UnicodeString;
    function Get_NumeroCivico: UnicodeString;
    function Get_CAP: UnicodeString;
    function Get_Comune: UnicodeString;
    function Get_Provincia: UnicodeString;
    function Get_Nazione: UnicodeString;
    procedure Set_Indirizzo(Value: UnicodeString);
    procedure Set_NumeroCivico(Value: UnicodeString);
    procedure Set_CAP(Value: UnicodeString);
    procedure Set_Comune(Value: UnicodeString);
    procedure Set_Provincia(Value: UnicodeString);
    procedure Set_Nazione(Value: UnicodeString);
  end;

{ TXMLIscrizioneREAType }

  [ioEntity]
  TXMLIscrizioneREAType = class(TXMLNode, IXMLIscrizioneREAType)
  protected
    { IXMLIscrizioneREAType }
    function Get_Ufficio: UnicodeString;
    function Get_NumeroREA: UnicodeString;
    function Get_CapitaleSociale: UnicodeString;
    function Get_SocioUnico: UnicodeString;
    function Get_StatoLiquidazione: UnicodeString;
    procedure Set_Ufficio(Value: UnicodeString);
    procedure Set_NumeroREA(Value: UnicodeString);
    procedure Set_CapitaleSociale(Value: UnicodeString);
    procedure Set_SocioUnico(Value: UnicodeString);
    procedure Set_StatoLiquidazione(Value: UnicodeString);
  end;

{ TXMLContattiType }

  [ioEntity]
  TXMLContattiType = class(TXMLNode, IXMLContattiType)
  protected
    { IXMLContattiType }
    function Get_Telefono: UnicodeString;
    function Get_Fax: UnicodeString;
    function Get_Email: UnicodeString;
    procedure Set_Telefono(Value: UnicodeString);
    procedure Set_Fax(Value: UnicodeString);
    procedure Set_Email(Value: UnicodeString);
  end;

{ TXMLRappresentanteFiscaleType }

  [ioEntity]
  TXMLRappresentanteFiscaleType = class(TXMLNode, IXMLRappresentanteFiscaleType)
  protected
    { IXMLRappresentanteFiscaleType }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiRappresentanteType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiAnagraficiRappresentanteType }

  [ioEntity]
  TXMLDatiAnagraficiRappresentanteType = class(TXMLNode, IXMLDatiAnagraficiRappresentanteType)
  protected
    { IXMLDatiAnagraficiRappresentanteType }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCessionarioCommittenteType }

  [ioEntity]
  TXMLCessionarioCommittenteType = class(TXMLNode, IXMLCessionarioCommittenteType)
  protected
    { IXMLCessionarioCommittenteType }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiCessionarioType;
    function Get_Sede: IXMLIndirizzoType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiAnagraficiCessionarioType }

  [ioEntity]
  TXMLDatiAnagraficiCessionarioType = class(TXMLNode, IXMLDatiAnagraficiCessionarioType)
  protected
    { IXMLDatiAnagraficiCessionarioType }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTerzoIntermediarioSoggettoEmittenteType }

  [ioEntity]
  TXMLTerzoIntermediarioSoggettoEmittenteType = class(TXMLNode, IXMLTerzoIntermediarioSoggettoEmittenteType)
  protected
    { IXMLTerzoIntermediarioSoggettoEmittenteType }
    function Get_DatiAnagrafici: IXMLDatiAnagraficiTerzoIntermediarioType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiAnagraficiTerzoIntermediarioType }

  [ioEntity]
  TXMLDatiAnagraficiTerzoIntermediarioType = class(TXMLNode, IXMLDatiAnagraficiTerzoIntermediarioType)
  protected
    { IXMLDatiAnagraficiTerzoIntermediarioType }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    procedure Set_CodiceFiscale(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFatturaElettronicaBodyType }

  [ioEntity]
  TXMLFatturaElettronicaBodyType = class(TXMLNode, IXMLFatturaElettronicaBodyType)
  private
    FDatiPagamento: IXMLDatiPagamentoTypeList;
    FAllegati: IXMLAllegatiTypeList;
  protected
    { IXMLFatturaElettronicaBodyType }
    function Get_DatiGenerali: IXMLDatiGeneraliType;
    function Get_DatiBeniServizi: IXMLDatiBeniServiziType;
    function Get_DatiVeicoli: IXMLDatiVeicoliType;
    function Get_DatiPagamento: IXMLDatiPagamentoTypeList;
    function Get_Allegati: IXMLAllegatiTypeList;
  public
    procedure AfterConstruction; override;
    [ioBelongsTo('IXMLDatiGeneraliType')]
    property DatiGenerali: IXMLDatiGeneraliType read Get_DatiGenerali;
    property DatiBeniServizi: IXMLDatiBeniServiziType read Get_DatiBeniServizi;
    property DatiVeicoli: IXMLDatiVeicoliType read Get_DatiVeicoli;
    property DatiPagamento: IXMLDatiPagamentoTypeList read Get_DatiPagamento;
    property Allegati: IXMLAllegatiTypeList read Get_Allegati;
  end;

{ TXMLFatturaElettronicaBodyTypeList }

  [ioEntity]
  TXMLFatturaElettronicaBodyTypeList = class(TXMLNodeCollection, IXMLFatturaElettronicaBodyTypeList)
  protected
    { IXMLFatturaElettronicaBodyTypeList }
    function Add: IXMLFatturaElettronicaBodyType;
    function Insert(const Index: Integer): IXMLFatturaElettronicaBodyType;

    function Get_Item(Index: Integer): IXMLFatturaElettronicaBodyType;
    property Items[Index: Integer]: IXMLFatturaElettronicaBodyType read Get_Item; default;

    procedure Delete(Index: Integer);  // Redeclared for RTTI visibility
    property Count;                    // Redeclared for RTTI visibility
  end;

{ TXMLDatiGeneraliType }

  [ioEntity]
  TXMLDatiGeneraliType = class(TXMLNode, IXMLDatiGeneraliType)
  private
    FDatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList;
    FDatiContratto: IXMLDatiDocumentiCorrelatiTypeList;
    FDatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList;
    FDatiRicezione: IXMLDatiDocumentiCorrelatiTypeList;
    FDatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList;
    FDatiSAL: IXMLDatiSALTypeList;
    FDatiDDT: IXMLDatiDDTTypeList;
  protected
    { IXMLDatiGeneraliType }
    function Get_DatiGeneraliDocumento: IXMLDatiGeneraliDocumentoType;
    function Get_DatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiContratto: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiRicezione: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList;
    function Get_DatiSAL: IXMLDatiSALTypeList;
    function Get_DatiDDT: IXMLDatiDDTTypeList;
    function Get_DatiTrasporto: IXMLDatiTrasportoType;
    function Get_FatturaPrincipale: IXMLFatturaPrincipaleType;
  public
    procedure AfterConstruction; override;
    [ioBelongsTo('IXMLDatiGeneraliDocumentoType')]
    property DatiGeneraliDocumento: IXMLDatiGeneraliDocumentoType read Get_DatiGeneraliDocumento;
    property DatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiOrdineAcquisto;
    property DatiContratto: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiContratto;
    property DatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiConvenzione;
    property DatiRicezione: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiRicezione;
    property DatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList read Get_DatiFattureCollegate;
    property DatiSAL: IXMLDatiSALTypeList read Get_DatiSAL;
    property DatiDDT: IXMLDatiDDTTypeList read Get_DatiDDT;
    property DatiTrasporto: IXMLDatiTrasportoType read Get_DatiTrasporto;
    property FatturaPrincipale: IXMLFatturaPrincipaleType read Get_FatturaPrincipale;
  end;

{ TXMLDatiGeneraliDocumentoType }

  [ioEntity]
  TXMLDatiGeneraliDocumentoType = class(TXMLNode, IXMLDatiGeneraliDocumentoType)
  private
    FDatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList;
    FScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    FCausale: IXMLString200LatinTypeList;
  protected
    { IXMLDatiGeneraliDocumentoType }
    function Get_TipoDocumento: UnicodeString;
    function Get_Divisa: UnicodeString;
    function Get_Data: UnicodeString;
    function Get_Numero: UnicodeString;
    function Get_DatiRitenuta: IXMLDatiRitenutaType;
    function Get_DatiBollo: IXMLDatiBolloType;
    function Get_DatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList;
    function Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    function Get_ImportoTotaleDocumento: UnicodeString;
    function Get_Arrotondamento: UnicodeString;
    function Get_Causale: IXMLString200LatinTypeList;
    function Get_Art73: UnicodeString;
    procedure Set_TipoDocumento(Value: UnicodeString);
    procedure Set_Divisa(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    procedure Set_Numero(Value: UnicodeString);
    procedure Set_ImportoTotaleDocumento(Value: UnicodeString);
    procedure Set_Arrotondamento(Value: UnicodeString);
    procedure Set_Art73(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
    property TipoDocumento: UnicodeString read Get_TipoDocumento write Set_TipoDocumento;
    property Divisa: UnicodeString read Get_Divisa write Set_Divisa;
    property Data: UnicodeString read Get_Data write Set_Data;
    property Numero: UnicodeString read Get_Numero write Set_Numero;
    property DatiRitenuta: IXMLDatiRitenutaType read Get_DatiRitenuta;
    property DatiBollo: IXMLDatiBolloType read Get_DatiBollo;
    property DatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList read Get_DatiCassaPrevidenziale;
    property ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList read Get_ScontoMaggiorazione;
    property ImportoTotaleDocumento: UnicodeString read Get_ImportoTotaleDocumento write Set_ImportoTotaleDocumento;
    property Arrotondamento: UnicodeString read Get_Arrotondamento write Set_Arrotondamento;
    property Causale: IXMLString200LatinTypeList read Get_Causale;
    property Art73: UnicodeString read Get_Art73 write Set_Art73;
  end;

{ TXMLDatiRitenutaType }

  [ioEntity]
  TXMLDatiRitenutaType = class(TXMLNode, IXMLDatiRitenutaType)
  protected
    { IXMLDatiRitenutaType }
    function Get_TipoRitenuta: UnicodeString;
    function Get_ImportoRitenuta: UnicodeString;
    function Get_AliquotaRitenuta: UnicodeString;
    function Get_CausalePagamento: UnicodeString;
    procedure Set_TipoRitenuta(Value: UnicodeString);
    procedure Set_ImportoRitenuta(Value: UnicodeString);
    procedure Set_AliquotaRitenuta(Value: UnicodeString);
    procedure Set_CausalePagamento(Value: UnicodeString);
  end;

{ TXMLDatiBolloType }

  [ioEntity]
  TXMLDatiBolloType = class(TXMLNode, IXMLDatiBolloType)
  protected
    { IXMLDatiBolloType }
    function Get_BolloVirtuale: UnicodeString;
    function Get_ImportoBollo: UnicodeString;
    procedure Set_BolloVirtuale(Value: UnicodeString);
    procedure Set_ImportoBollo(Value: UnicodeString);
  end;

{ TXMLDatiCassaPrevidenzialeType }

  [ioEntity]
  TXMLDatiCassaPrevidenzialeType = class(TXMLNode, IXMLDatiCassaPrevidenzialeType)
  protected
    { IXMLDatiCassaPrevidenzialeType }
    function Get_TipoCassa: UnicodeString;
    function Get_AlCassa: UnicodeString;
    function Get_ImportoContributoCassa: UnicodeString;
    function Get_ImponibileCassa: UnicodeString;
    function Get_AliquotaIVA: UnicodeString;
    function Get_Ritenuta: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_RiferimentoAmministrazione: UnicodeString;
    procedure Set_TipoCassa(Value: UnicodeString);
    procedure Set_AlCassa(Value: UnicodeString);
    procedure Set_ImportoContributoCassa(Value: UnicodeString);
    procedure Set_ImponibileCassa(Value: UnicodeString);
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Ritenuta(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
  end;

{ TXMLDatiCassaPrevidenzialeTypeList }

  [ioEntity]
  TXMLDatiCassaPrevidenzialeTypeList = class(TXMLNodeCollection, IXMLDatiCassaPrevidenzialeTypeList)
  protected
    { IXMLDatiCassaPrevidenzialeTypeList }
    function Add: IXMLDatiCassaPrevidenzialeType;
    function Insert(const Index: Integer): IXMLDatiCassaPrevidenzialeType;

    function Get_Item(Index: Integer): IXMLDatiCassaPrevidenzialeType;
  end;

{ TXMLScontoMaggiorazioneType }

  [ioEntity]
  TXMLScontoMaggiorazioneType = class(TXMLNode, IXMLScontoMaggiorazioneType)
  protected
    { IXMLScontoMaggiorazioneType }
    function Get_Tipo: UnicodeString;
    function Get_Percentuale: UnicodeString;
    function Get_Importo: UnicodeString;
    procedure Set_Tipo(Value: UnicodeString);
    procedure Set_Percentuale(Value: UnicodeString);
    procedure Set_Importo(Value: UnicodeString);
  end;

{ TXMLScontoMaggiorazioneTypeList }

  [ioEntity]
  TXMLScontoMaggiorazioneTypeList = class(TXMLNodeCollection, IXMLScontoMaggiorazioneTypeList)
  protected
    { IXMLScontoMaggiorazioneTypeList }
    function Add: IXMLScontoMaggiorazioneType;
    function Insert(const Index: Integer): IXMLScontoMaggiorazioneType;

    function Get_Item(Index: Integer): IXMLScontoMaggiorazioneType;
  end;

{ TXMLDatiDocumentiCorrelatiType }

  [ioEntity]
  TXMLDatiDocumentiCorrelatiType = class(TXMLNode, IXMLDatiDocumentiCorrelatiType)
  private
    FRiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
  protected
    { IXMLDatiDocumentiCorrelatiType }
    function Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
    function Get_IdDocumento: UnicodeString;
    function Get_Data: UnicodeString;
    function Get_NumItem: UnicodeString;
    function Get_CodiceCommessaConvenzione: UnicodeString;
    function Get_CodiceCUP: UnicodeString;
    function Get_CodiceCIG: UnicodeString;
    procedure Set_IdDocumento(Value: UnicodeString);
    procedure Set_Data(Value: UnicodeString);
    procedure Set_NumItem(Value: UnicodeString);
    procedure Set_CodiceCommessaConvenzione(Value: UnicodeString);
    procedure Set_CodiceCUP(Value: UnicodeString);
    procedure Set_CodiceCIG(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiDocumentiCorrelatiTypeList }

  [ioEntity]
  TXMLDatiDocumentiCorrelatiTypeList = class(TXMLNodeCollection, IXMLDatiDocumentiCorrelatiTypeList)
  protected
    { IXMLDatiDocumentiCorrelatiTypeList }
    function Add: IXMLDatiDocumentiCorrelatiType;
    function Insert(const Index: Integer): IXMLDatiDocumentiCorrelatiType;

    function Get_Item(Index: Integer): IXMLDatiDocumentiCorrelatiType;
  end;

{ TXMLDatiSALType }

  [ioEntity]
  TXMLDatiSALType = class(TXMLNode, IXMLDatiSALType)
  protected
    { IXMLDatiSALType }
    function Get_RiferimentoFase: Integer;
    procedure Set_RiferimentoFase(Value: Integer);
  end;

{ TXMLDatiSALTypeList }

  [ioEntity]
  TXMLDatiSALTypeList = class(TXMLNodeCollection, IXMLDatiSALTypeList)
  protected
    { IXMLDatiSALTypeList }
    function Add: IXMLDatiSALType;
    function Insert(const Index: Integer): IXMLDatiSALType;

    function Get_Item(Index: Integer): IXMLDatiSALType;
  end;

{ TXMLDatiDDTType }

  [ioEntity]
  TXMLDatiDDTType = class(TXMLNode, IXMLDatiDDTType)
  private
    FRiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
  protected
    { IXMLDatiDDTType }
    function Get_NumeroDDT: UnicodeString;
    function Get_DataDDT: UnicodeString;
    function Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
    procedure Set_NumeroDDT(Value: UnicodeString);
    procedure Set_DataDDT(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiDDTTypeList }

  [ioEntity]
  TXMLDatiDDTTypeList = class(TXMLNodeCollection, IXMLDatiDDTTypeList)
  protected
    { IXMLDatiDDTTypeList }
    function Add: IXMLDatiDDTType;
    function Insert(const Index: Integer): IXMLDatiDDTType;

    function Get_Item(Index: Integer): IXMLDatiDDTType;
  end;

{ TXMLDatiTrasportoType }

  [ioEntity]
  TXMLDatiTrasportoType = class(TXMLNode, IXMLDatiTrasportoType)
  protected
    { IXMLDatiTrasportoType }
    function Get_DatiAnagraficiVettore: IXMLDatiAnagraficiVettoreType;
    function Get_MezzoTrasporto: UnicodeString;
    function Get_CausaleTrasporto: UnicodeString;
    function Get_NumeroColli: Integer;
    function Get_Descrizione: UnicodeString;
    function Get_UnitaMisuraPeso: UnicodeString;
    function Get_PesoLordo: UnicodeString;
    function Get_PesoNetto: UnicodeString;
    function Get_DataOraRitiro: UnicodeString;
    function Get_DataInizioTrasporto: UnicodeString;
    function Get_TipoResa: UnicodeString;
    function Get_IndirizzoResa: IXMLIndirizzoType;
    function Get_DataOraConsegna: UnicodeString;
    procedure Set_MezzoTrasporto(Value: UnicodeString);
    procedure Set_CausaleTrasporto(Value: UnicodeString);
    procedure Set_NumeroColli(Value: Integer);
    procedure Set_Descrizione(Value: UnicodeString);
    procedure Set_UnitaMisuraPeso(Value: UnicodeString);
    procedure Set_PesoLordo(Value: UnicodeString);
    procedure Set_PesoNetto(Value: UnicodeString);
    procedure Set_DataOraRitiro(Value: UnicodeString);
    procedure Set_DataInizioTrasporto(Value: UnicodeString);
    procedure Set_TipoResa(Value: UnicodeString);
    procedure Set_DataOraConsegna(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiAnagraficiVettoreType }

  [ioEntity]
  TXMLDatiAnagraficiVettoreType = class(TXMLNode, IXMLDatiAnagraficiVettoreType)
  protected
    { IXMLDatiAnagraficiVettoreType }
    function Get_IdFiscaleIVA: IXMLIdFiscaleType;
    function Get_CodiceFiscale: UnicodeString;
    function Get_Anagrafica: IXMLAnagraficaType;
    function Get_NumeroLicenzaGuida: UnicodeString;
    procedure Set_CodiceFiscale(Value: UnicodeString);
    procedure Set_NumeroLicenzaGuida(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLFatturaPrincipaleType }

  [ioEntity]
  TXMLFatturaPrincipaleType = class(TXMLNode, IXMLFatturaPrincipaleType)
  protected
    { IXMLFatturaPrincipaleType }
    function Get_NumeroFatturaPrincipale: UnicodeString;
    function Get_DataFatturaPrincipale: UnicodeString;
    procedure Set_NumeroFatturaPrincipale(Value: UnicodeString);
    procedure Set_DataFatturaPrincipale(Value: UnicodeString);
  end;

{ TXMLDatiBeniServiziType }

  [ioEntity]
  TXMLDatiBeniServiziType = class(TXMLNode, IXMLDatiBeniServiziType)
  private
    FDettaglioLinee: IXMLDettaglioLineeTypeList;
    FDatiRiepilogo: IXMLDatiRiepilogoTypeList;
  protected
    { IXMLDatiBeniServiziType }
    function Get_DettaglioLinee: IXMLDettaglioLineeTypeList;
    function Get_DatiRiepilogo: IXMLDatiRiepilogoTypeList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDettaglioLineeType }

  [ioEntity]
  TXMLDettaglioLineeType = class(TXMLNode, IXMLDettaglioLineeType)
  private
    FCodiceArticolo: IXMLCodiceArticoloTypeList;
    FScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    FAltriDatiGestionali: IXMLAltriDatiGestionaliTypeList;
  protected
    { IXMLDettaglioLineeType }
    function Get_NumeroLinea: Integer;
    function Get_TipoCessionePrestazione: UnicodeString;
    function Get_CodiceArticolo: IXMLCodiceArticoloTypeList;
    function Get_Descrizione: UnicodeString;
    function Get_Quantita: UnicodeString;
    function Get_UnitaMisura: UnicodeString;
    function Get_DataInizioPeriodo: UnicodeString;
    function Get_DataFinePeriodo: UnicodeString;
    function Get_PrezzoUnitario: UnicodeString;
    function Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
    function Get_PrezzoTotale: UnicodeString;
    function Get_AliquotaIVA: UnicodeString;
    function Get_Ritenuta: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_RiferimentoAmministrazione: UnicodeString;
    function Get_AltriDatiGestionali: IXMLAltriDatiGestionaliTypeList;
    procedure Set_NumeroLinea(Value: Integer);
    procedure Set_TipoCessionePrestazione(Value: UnicodeString);
    procedure Set_Descrizione(Value: UnicodeString);
    procedure Set_Quantita(Value: UnicodeString);
    procedure Set_UnitaMisura(Value: UnicodeString);
    procedure Set_DataInizioPeriodo(Value: UnicodeString);
    procedure Set_DataFinePeriodo(Value: UnicodeString);
    procedure Set_PrezzoUnitario(Value: UnicodeString);
    procedure Set_PrezzoTotale(Value: UnicodeString);
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Ritenuta(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_RiferimentoAmministrazione(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDettaglioLineeTypeList }

  [ioEntity]
  TXMLDettaglioLineeTypeList = class(TXMLNodeCollection, IXMLDettaglioLineeTypeList)
  protected
    { IXMLDettaglioLineeTypeList }
    function Add: IXMLDettaglioLineeType;
    function Insert(const Index: Integer): IXMLDettaglioLineeType;

    function Get_Item(Index: Integer): IXMLDettaglioLineeType;
  end;

{ TXMLCodiceArticoloType }

  [ioEntity]
  TXMLCodiceArticoloType = class(TXMLNode, IXMLCodiceArticoloType)
  protected
    { IXMLCodiceArticoloType }
    function Get_CodiceTipo: UnicodeString;
    function Get_CodiceValore: UnicodeString;
    procedure Set_CodiceTipo(Value: UnicodeString);
    procedure Set_CodiceValore(Value: UnicodeString);
  end;

{ TXMLCodiceArticoloTypeList }

  [ioEntity]
  TXMLCodiceArticoloTypeList = class(TXMLNodeCollection, IXMLCodiceArticoloTypeList)
  protected
    { IXMLCodiceArticoloTypeList }
    function Add: IXMLCodiceArticoloType;
    function Insert(const Index: Integer): IXMLCodiceArticoloType;

    function Get_Item(Index: Integer): IXMLCodiceArticoloType;
  end;

{ TXMLAltriDatiGestionaliType }

  [ioEntity]
  TXMLAltriDatiGestionaliType = class(TXMLNode, IXMLAltriDatiGestionaliType)
  protected
    { IXMLAltriDatiGestionaliType }
    function Get_TipoDato: UnicodeString;
    function Get_RiferimentoTesto: UnicodeString;
    function Get_RiferimentoNumero: UnicodeString;
    function Get_RiferimentoData: UnicodeString;
    procedure Set_TipoDato(Value: UnicodeString);
    procedure Set_RiferimentoTesto(Value: UnicodeString);
    procedure Set_RiferimentoNumero(Value: UnicodeString);
    procedure Set_RiferimentoData(Value: UnicodeString);
  end;

{ TXMLAltriDatiGestionaliTypeList }

  [ioEntity]
  TXMLAltriDatiGestionaliTypeList = class(TXMLNodeCollection, IXMLAltriDatiGestionaliTypeList)
  protected
    { IXMLAltriDatiGestionaliTypeList }
    function Add: IXMLAltriDatiGestionaliType;
    function Insert(const Index: Integer): IXMLAltriDatiGestionaliType;

    function Get_Item(Index: Integer): IXMLAltriDatiGestionaliType;
  end;

{ TXMLDatiRiepilogoType }

  [ioEntity]
  TXMLDatiRiepilogoType = class(TXMLNode, IXMLDatiRiepilogoType)
  protected
    { IXMLDatiRiepilogoType }
    function Get_AliquotaIVA: UnicodeString;
    function Get_Natura: UnicodeString;
    function Get_SpeseAccessorie: UnicodeString;
    function Get_Arrotondamento: UnicodeString;
    function Get_ImponibileImporto: UnicodeString;
    function Get_Imposta: UnicodeString;
    function Get_EsigibilitaIVA: UnicodeString;
    function Get_RiferimentoNormativo: UnicodeString;
    procedure Set_AliquotaIVA(Value: UnicodeString);
    procedure Set_Natura(Value: UnicodeString);
    procedure Set_SpeseAccessorie(Value: UnicodeString);
    procedure Set_Arrotondamento(Value: UnicodeString);
    procedure Set_ImponibileImporto(Value: UnicodeString);
    procedure Set_Imposta(Value: UnicodeString);
    procedure Set_EsigibilitaIVA(Value: UnicodeString);
    procedure Set_RiferimentoNormativo(Value: UnicodeString);
  end;

{ TXMLDatiRiepilogoTypeList }

  [ioEntity]
  TXMLDatiRiepilogoTypeList = class(TXMLNodeCollection, IXMLDatiRiepilogoTypeList)
  protected
    { IXMLDatiRiepilogoTypeList }
    function Add: IXMLDatiRiepilogoType;
    function Insert(const Index: Integer): IXMLDatiRiepilogoType;

    function Get_Item(Index: Integer): IXMLDatiRiepilogoType;
  end;

{ TXMLDatiVeicoliType }

  [ioEntity]
  TXMLDatiVeicoliType = class(TXMLNode, IXMLDatiVeicoliType)
  protected
    { IXMLDatiVeicoliType }
    function Get_Data: UnicodeString;
    function Get_TotalePercorso: UnicodeString;
    procedure Set_Data(Value: UnicodeString);
    procedure Set_TotalePercorso(Value: UnicodeString);
  end;

{ TXMLDatiPagamentoType }

  [ioEntity]
  TXMLDatiPagamentoType = class(TXMLNode, IXMLDatiPagamentoType)
  private
    FDettaglioPagamento: IXMLDettaglioPagamentoTypeList;
  protected
    { IXMLDatiPagamentoType }
    function Get_CondizioniPagamento: UnicodeString;
    function Get_DettaglioPagamento: IXMLDettaglioPagamentoTypeList;
    procedure Set_CondizioniPagamento(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDatiPagamentoTypeList }

  [ioEntity]
  TXMLDatiPagamentoTypeList = class(TXMLNodeCollection, IXMLDatiPagamentoTypeList)
  protected
    { IXMLDatiPagamentoTypeList }
    function Add: IXMLDatiPagamentoType;
    function Insert(const Index: Integer): IXMLDatiPagamentoType;

    function Get_Item(Index: Integer): IXMLDatiPagamentoType;
  end;

{ TXMLDettaglioPagamentoType }

  [ioEntity]
  TXMLDettaglioPagamentoType = class(TXMLNode, IXMLDettaglioPagamentoType)
  protected
    { IXMLDettaglioPagamentoType }
    function Get_Beneficiario: UnicodeString;
    function Get_ModalitaPagamento: UnicodeString;
    function Get_DataRiferimentoTerminiPagamento: UnicodeString;
    function Get_GiorniTerminiPagamento: Integer;
    function Get_DataScadenzaPagamento: UnicodeString;
    function Get_ImportoPagamento: UnicodeString;
    function Get_CodUfficioPostale: UnicodeString;
    function Get_CognomeQuietanzante: UnicodeString;
    function Get_NomeQuietanzante: UnicodeString;
    function Get_CFQuietanzante: UnicodeString;
    function Get_TitoloQuietanzante: UnicodeString;
    function Get_IstitutoFinanziario: UnicodeString;
    function Get_IBAN: UnicodeString;
    function Get_ABI: UnicodeString;
    function Get_CAB: UnicodeString;
    function Get_BIC: UnicodeString;
    function Get_ScontoPagamentoAnticipato: UnicodeString;
    function Get_DataLimitePagamentoAnticipato: UnicodeString;
    function Get_PenalitaPagamentiRitardati: UnicodeString;
    function Get_DataDecorrenzaPenale: UnicodeString;
    function Get_CodicePagamento: UnicodeString;
    procedure Set_Beneficiario(Value: UnicodeString);
    procedure Set_ModalitaPagamento(Value: UnicodeString);
    procedure Set_DataRiferimentoTerminiPagamento(Value: UnicodeString);
    procedure Set_GiorniTerminiPagamento(Value: Integer);
    procedure Set_DataScadenzaPagamento(Value: UnicodeString);
    procedure Set_ImportoPagamento(Value: UnicodeString);
    procedure Set_CodUfficioPostale(Value: UnicodeString);
    procedure Set_CognomeQuietanzante(Value: UnicodeString);
    procedure Set_NomeQuietanzante(Value: UnicodeString);
    procedure Set_CFQuietanzante(Value: UnicodeString);
    procedure Set_TitoloQuietanzante(Value: UnicodeString);
    procedure Set_IstitutoFinanziario(Value: UnicodeString);
    procedure Set_IBAN(Value: UnicodeString);
    procedure Set_ABI(Value: UnicodeString);
    procedure Set_CAB(Value: UnicodeString);
    procedure Set_BIC(Value: UnicodeString);
    procedure Set_ScontoPagamentoAnticipato(Value: UnicodeString);
    procedure Set_DataLimitePagamentoAnticipato(Value: UnicodeString);
    procedure Set_PenalitaPagamentiRitardati(Value: UnicodeString);
    procedure Set_DataDecorrenzaPenale(Value: UnicodeString);
    procedure Set_CodicePagamento(Value: UnicodeString);
  end;

{ TXMLDettaglioPagamentoTypeList }

  [ioEntity]
  TXMLDettaglioPagamentoTypeList = class(TXMLNodeCollection, IXMLDettaglioPagamentoTypeList)
  protected
    { IXMLDettaglioPagamentoTypeList }
    function Add: IXMLDettaglioPagamentoType;
    function Insert(const Index: Integer): IXMLDettaglioPagamentoType;

    function Get_Item(Index: Integer): IXMLDettaglioPagamentoType;
  end;

{ TXMLAllegatiType }

  [ioEntity]
  TXMLAllegatiType = class(TXMLNode, IXMLAllegatiType)
  protected
    { IXMLAllegatiType }
    function Get_NomeAttachment: UnicodeString;
    function Get_AlgoritmoCompressione: UnicodeString;
    function Get_FormatoAttachment: UnicodeString;
    function Get_DescrizioneAttachment: UnicodeString;
    function Get_Attachment: UnicodeString;
    procedure Set_NomeAttachment(Value: UnicodeString);
    procedure Set_AlgoritmoCompressione(Value: UnicodeString);
    procedure Set_FormatoAttachment(Value: UnicodeString);
    procedure Set_DescrizioneAttachment(Value: UnicodeString);
    procedure Set_Attachment(Value: UnicodeString);
  end;

{ TXMLAllegatiTypeList }

  [ioEntity]
  TXMLAllegatiTypeList = class(TXMLNodeCollection, IXMLAllegatiTypeList)
  protected
    { IXMLAllegatiTypeList }
    function Add: IXMLAllegatiType;
    function Insert(const Index: Integer): IXMLAllegatiType;

    function Get_Item(Index: Integer): IXMLAllegatiType;
  end;

{ TXMLSignatureType_ds }

  [ioEntity]
  TXMLSignatureType_ds = class(TXMLNode, IXMLSignatureType_ds)
  private
    FObject_: IXMLObjectType_dsList;
  protected
    { IXMLSignatureType_ds }
    function Get_Id: UnicodeString;
    function Get_SignedInfo: IXMLSignedInfoType_ds;
    function Get_SignatureValue: IXMLSignatureValueType_ds;
    function Get_KeyInfo: IXMLKeyInfoType_ds;
    function Get_Object_: IXMLObjectType_dsList;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSignedInfoType_ds }

  [ioEntity]
  TXMLSignedInfoType_ds = class(TXMLNode, IXMLSignedInfoType_ds)
  private
    FReference: IXMLReferenceType_dsList;
  protected
    { IXMLSignedInfoType_ds }
    function Get_Id: UnicodeString;
    function Get_CanonicalizationMethod: IXMLCanonicalizationMethodType_ds;
    function Get_SignatureMethod: IXMLSignatureMethodType_ds;
    function Get_Reference: IXMLReferenceType_dsList;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLCanonicalizationMethodType_ds }

  [ioEntity]
  TXMLCanonicalizationMethodType_ds = class(TXMLNode, IXMLCanonicalizationMethodType_ds)
  protected
    { IXMLCanonicalizationMethodType_ds }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
  end;

{ TXMLSignatureMethodType_ds }

  [ioEntity]
  TXMLSignatureMethodType_ds = class(TXMLNode, IXMLSignatureMethodType_ds)
  protected
    { IXMLSignatureMethodType_ds }
    function Get_Algorithm: UnicodeString;
    function Get_HMACOutputLength: Integer;
    procedure Set_Algorithm(Value: UnicodeString);
    procedure Set_HMACOutputLength(Value: Integer);
  end;

{ TXMLReferenceType_ds }

  [ioEntity]
  TXMLReferenceType_ds = class(TXMLNode, IXMLReferenceType_ds)
  protected
    { IXMLReferenceType_ds }
    function Get_Id: UnicodeString;
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    function Get_DigestMethod: IXMLDigestMethodType_ds;
    function Get_DigestValue: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
    procedure Set_DigestValue(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLReferenceType_dsList }

  [ioEntity]
  TXMLReferenceType_dsList = class(TXMLNodeCollection, IXMLReferenceType_dsList)
  protected
    { IXMLReferenceType_dsList }
    function Add: IXMLReferenceType_ds;
    function Insert(const Index: Integer): IXMLReferenceType_ds;

    function Get_Item(Index: Integer): IXMLReferenceType_ds;
  end;

{ TXMLTransformsType_ds }

  [ioEntity]
  TXMLTransformsType_ds = class(TXMLNodeCollection, IXMLTransformsType_ds)
  protected
    { IXMLTransformsType_ds }
    function Get_Transform(Index: Integer): IXMLTransformType_ds;
    function Add: IXMLTransformType_ds;
    function Insert(const Index: Integer): IXMLTransformType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLTransformType_ds }

  [ioEntity]
  TXMLTransformType_ds = class(TXMLNodeCollection, IXMLTransformType_ds)
  protected
    { IXMLTransformType_ds }
    function Get_Algorithm: UnicodeString;
    function Get_XPath(Index: Integer): UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
    function Add(const XPath: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLDigestMethodType_ds }

  [ioEntity]
  TXMLDigestMethodType_ds = class(TXMLNode, IXMLDigestMethodType_ds)
  protected
    { IXMLDigestMethodType_ds }
    function Get_Algorithm: UnicodeString;
    procedure Set_Algorithm(Value: UnicodeString);
  end;

{ TXMLSignatureValueType_ds }

  [ioEntity]
  TXMLSignatureValueType_ds = class(TXMLNode, IXMLSignatureValueType_ds)
  protected
    { IXMLSignatureValueType_ds }
    function Get_Id: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
  end;

{ TXMLKeyInfoType_ds }

  [ioEntity]
  TXMLKeyInfoType_ds = class(TXMLNode, IXMLKeyInfoType_ds)
  private
    FKeyName: IXMLString_List;
    FKeyValue: IXMLKeyValueType_dsList;
    FRetrievalMethod: IXMLRetrievalMethodType_dsList;
    FX509Data: IXMLX509DataType_dsList;
    FPGPData: IXMLPGPDataType_dsList;
    FSPKIData: IXMLSPKIDataType_dsList;
    FMgmtData: IXMLString_List;
  protected
    { IXMLKeyInfoType_ds }
    function Get_Id: UnicodeString;
    function Get_KeyName: IXMLString_List;
    function Get_KeyValue: IXMLKeyValueType_dsList;
    function Get_RetrievalMethod: IXMLRetrievalMethodType_dsList;
    function Get_X509Data: IXMLX509DataType_dsList;
    function Get_PGPData: IXMLPGPDataType_dsList;
    function Get_SPKIData: IXMLSPKIDataType_dsList;
    function Get_MgmtData: IXMLString_List;
    procedure Set_Id(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLKeyValueType_ds }

  [ioEntity]
  TXMLKeyValueType_ds = class(TXMLNode, IXMLKeyValueType_ds)
  protected
    { IXMLKeyValueType_ds }
    function Get_DSAKeyValue: IXMLDSAKeyValueType_ds;
    function Get_RSAKeyValue: IXMLRSAKeyValueType_ds;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLKeyValueType_dsList }

  [ioEntity]
  TXMLKeyValueType_dsList = class(TXMLNodeCollection, IXMLKeyValueType_dsList)
  protected
    { IXMLKeyValueType_dsList }
    function Add: IXMLKeyValueType_ds;
    function Insert(const Index: Integer): IXMLKeyValueType_ds;

    function Get_Item(Index: Integer): IXMLKeyValueType_ds;
  end;

{ TXMLDSAKeyValueType_ds }

  [ioEntity]
  TXMLDSAKeyValueType_ds = class(TXMLNode, IXMLDSAKeyValueType_ds)
  protected
    { IXMLDSAKeyValueType_ds }
    function Get_P: UnicodeString;
    function Get_Q: UnicodeString;
    function Get_G: UnicodeString;
    function Get_Y: UnicodeString;
    function Get_J: UnicodeString;
    function Get_Seed: UnicodeString;
    function Get_PgenCounter: UnicodeString;
    procedure Set_P(Value: UnicodeString);
    procedure Set_Q(Value: UnicodeString);
    procedure Set_G(Value: UnicodeString);
    procedure Set_Y(Value: UnicodeString);
    procedure Set_J(Value: UnicodeString);
    procedure Set_Seed(Value: UnicodeString);
    procedure Set_PgenCounter(Value: UnicodeString);
  end;

{ TXMLRSAKeyValueType_ds }

  [ioEntity]
  TXMLRSAKeyValueType_ds = class(TXMLNode, IXMLRSAKeyValueType_ds)
  protected
    { IXMLRSAKeyValueType_ds }
    function Get_Modulus: UnicodeString;
    function Get_Exponent: UnicodeString;
    procedure Set_Modulus(Value: UnicodeString);
    procedure Set_Exponent(Value: UnicodeString);
  end;

{ TXMLRetrievalMethodType_ds }

  [ioEntity]
  TXMLRetrievalMethodType_ds = class(TXMLNode, IXMLRetrievalMethodType_ds)
  protected
    { IXMLRetrievalMethodType_ds }
    function Get_URI: UnicodeString;
    function Get_Type_: UnicodeString;
    function Get_Transforms: IXMLTransformsType_ds;
    procedure Set_URI(Value: UnicodeString);
    procedure Set_Type_(Value: UnicodeString);
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRetrievalMethodType_dsList }

  [ioEntity]
  TXMLRetrievalMethodType_dsList = class(TXMLNodeCollection, IXMLRetrievalMethodType_dsList)
  protected
    { IXMLRetrievalMethodType_dsList }
    function Add: IXMLRetrievalMethodType_ds;
    function Insert(const Index: Integer): IXMLRetrievalMethodType_ds;

    function Get_Item(Index: Integer): IXMLRetrievalMethodType_ds;
  end;

{ TXMLX509DataType_ds }

  [ioEntity]
  TXMLX509DataType_ds = class(TXMLNode, IXMLX509DataType_ds)
  private
    FX509IssuerSerial: IXMLX509IssuerSerialType_dsList;
    FX509SKI: IXMLBase64BinaryList;
    FX509SubjectName: IXMLString_List;
    FX509Certificate: IXMLBase64BinaryList;
    FX509CRL: IXMLBase64BinaryList;
  protected
    { IXMLX509DataType_ds }
    function Get_X509IssuerSerial: IXMLX509IssuerSerialType_dsList;
    function Get_X509SKI: IXMLBase64BinaryList;
    function Get_X509SubjectName: IXMLString_List;
    function Get_X509Certificate: IXMLBase64BinaryList;
    function Get_X509CRL: IXMLBase64BinaryList;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLX509DataType_dsList }

  [ioEntity]
  TXMLX509DataType_dsList = class(TXMLNodeCollection, IXMLX509DataType_dsList)
  protected
    { IXMLX509DataType_dsList }
    function Add: IXMLX509DataType_ds;
    function Insert(const Index: Integer): IXMLX509DataType_ds;

    function Get_Item(Index: Integer): IXMLX509DataType_ds;
  end;

{ TXMLX509IssuerSerialType_ds }

  [ioEntity]
  TXMLX509IssuerSerialType_ds = class(TXMLNode, IXMLX509IssuerSerialType_ds)
  protected
    { IXMLX509IssuerSerialType_ds }
    function Get_X509IssuerName: UnicodeString;
    function Get_X509SerialNumber: Integer;
    procedure Set_X509IssuerName(Value: UnicodeString);
    procedure Set_X509SerialNumber(Value: Integer);
  end;

{ TXMLX509IssuerSerialType_dsList }

  [ioEntity]
  TXMLX509IssuerSerialType_dsList = class(TXMLNodeCollection, IXMLX509IssuerSerialType_dsList)
  protected
    { IXMLX509IssuerSerialType_dsList }
    function Add: IXMLX509IssuerSerialType_ds;
    function Insert(const Index: Integer): IXMLX509IssuerSerialType_ds;

    function Get_Item(Index: Integer): IXMLX509IssuerSerialType_ds;
  end;

{ TXMLPGPDataType_ds }

  [ioEntity]
  TXMLPGPDataType_ds = class(TXMLNode, IXMLPGPDataType_ds)
  protected
    { IXMLPGPDataType_ds }
    function Get_PGPKeyID: UnicodeString;
    function Get_PGPKeyPacket: UnicodeString;
    procedure Set_PGPKeyID(Value: UnicodeString);
    procedure Set_PGPKeyPacket(Value: UnicodeString);
  end;

{ TXMLPGPDataType_dsList }

  [ioEntity]
  TXMLPGPDataType_dsList = class(TXMLNodeCollection, IXMLPGPDataType_dsList)
  protected
    { IXMLPGPDataType_dsList }
    function Add: IXMLPGPDataType_ds;
    function Insert(const Index: Integer): IXMLPGPDataType_ds;

    function Get_Item(Index: Integer): IXMLPGPDataType_ds;
  end;

{ TXMLSPKIDataType_ds }

  [ioEntity]
  TXMLSPKIDataType_ds = class(TXMLNodeCollection, IXMLSPKIDataType_ds)
  protected
    { IXMLSPKIDataType_ds }
    function Get_SPKISexp(Index: Integer): UnicodeString;
    function Add(const SPKISexp: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const SPKISexp: UnicodeString): IXMLNode;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLSPKIDataType_dsList }

  [ioEntity]
  TXMLSPKIDataType_dsList = class(TXMLNodeCollection, IXMLSPKIDataType_dsList)
  protected
    { IXMLSPKIDataType_dsList }
    function Add: IXMLSPKIDataType_ds;
    function Insert(const Index: Integer): IXMLSPKIDataType_ds;

    function Get_Item(Index: Integer): IXMLSPKIDataType_ds;
  end;

{ TXMLObjectType_ds }

  [ioEntity]
  TXMLObjectType_ds = class(TXMLNode, IXMLObjectType_ds)
  protected
    { IXMLObjectType_ds }
    function Get_Id: UnicodeString;
    function Get_MimeType: UnicodeString;
    function Get_Encoding: UnicodeString;
    procedure Set_Id(Value: UnicodeString);
    procedure Set_MimeType(Value: UnicodeString);
    procedure Set_Encoding(Value: UnicodeString);
  end;

{ TXMLObjectType_dsList }

  [ioEntity]
  TXMLObjectType_dsList = class(TXMLNodeCollection, IXMLObjectType_dsList)
  protected
    { IXMLObjectType_dsList }
    function Add: IXMLObjectType_ds;
    function Insert(const Index: Integer): IXMLObjectType_ds;

    function Get_Item(Index: Integer): IXMLObjectType_ds;
  end;

{ TXMLString200LatinTypeList }

  [ioEntity]
  TXMLString200LatinTypeList = class(TXMLNodeCollection, IXMLString200LatinTypeList)
  protected
    { IXMLString200LatinTypeList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ TXMLRiferimentoNumeroLineaTypeList }

  [ioEntity]
  TXMLRiferimentoNumeroLineaTypeList = class(TXMLNodeCollection, IXMLRiferimentoNumeroLineaTypeList)
  protected
    { IXMLRiferimentoNumeroLineaTypeList }
    function Add(const Value: Integer): IXMLNode;
    function Insert(const Index: Integer; const Value: Integer): IXMLNode;

    function Get_Item(Index: Integer): Integer;
  end;

{ TXMLBase64BinaryList }

  [ioEntity]
  TXMLBase64BinaryList = class(TXMLNodeCollection, IXMLBase64BinaryList)
  protected
    { IXMLBase64BinaryList }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ TXMLString_List }

  [ioEntity]
  TXMLString_List = class(TXMLNodeCollection, IXMLString_List)
  protected
    { IXMLString_List }
    function Add(const Value: UnicodeString): IXMLNode;
    function Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;

    function Get_Item(Index: Integer): UnicodeString;
  end;

{ Global Functions }

function GetFatturaElettronica(Doc: IXMLDocument): IXMLFatturaElettronicaType;
function LoadFatturaElettronica(const FileName: string): IXMLFatturaElettronicaType;
function NewFatturaElettronica: IXMLFatturaElettronicaType;

const
  TargetNamespace = 'http://www.fatturapa.gov.it/sdi/fatturapa/v1.1';

implementation

{ Global Functions }

function GetFatturaElettronica(Doc: IXMLDocument): IXMLFatturaElettronicaType;
begin
  Result := Doc.GetDocBinding('FatturaElettronica', TXMLFatturaElettronicaType, TargetNamespace) as IXMLFatturaElettronicaType;
end;

function LoadFatturaElettronica(const FileName: string): IXMLFatturaElettronicaType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('FatturaElettronica', TXMLFatturaElettronicaType, TargetNamespace) as IXMLFatturaElettronicaType;
end;

function NewFatturaElettronica: IXMLFatturaElettronicaType;
begin
  Result := NewXMLDocument.GetDocBinding('FatturaElettronica', TXMLFatturaElettronicaType, TargetNamespace) as IXMLFatturaElettronicaType;
end;

{ TXMLFatturaElettronicaType }

procedure TXMLFatturaElettronicaType.AfterConstruction;
begin
  RegisterChildNode('FatturaElettronicaHeader', TXMLFatturaElettronicaHeaderType);
  RegisterChildNode('FatturaElettronicaBody', TXMLFatturaElettronicaBodyType);
  RegisterChildNode('Signature', TXMLSignatureType_ds);
  FFatturaElettronicaBody := CreateCollection(TXMLFatturaElettronicaBodyTypeList, IXMLFatturaElettronicaBodyType, 'FatturaElettronicaBody') as IXMLFatturaElettronicaBodyTypeList;
  inherited;
end;

function TXMLFatturaElettronicaType.Get_Versione: UnicodeString;
begin
  Result := AttributeNodes['versione'].Text;
end;

procedure TXMLFatturaElettronicaType.Set_Versione(Value: UnicodeString);
begin
  SetAttribute('versione', Value);
end;

function TXMLFatturaElettronicaType.Get_FatturaElettronicaHeader: IXMLFatturaElettronicaHeaderType;
begin
  Result := ChildNodes['FatturaElettronicaHeader'] as IXMLFatturaElettronicaHeaderType;
end;

function TXMLFatturaElettronicaType.Get_FatturaElettronicaBody: IXMLFatturaElettronicaBodyTypeList;
begin
  Result := FFatturaElettronicaBody;
end;

function TXMLFatturaElettronicaType.Get_Signature: IXMLSignatureType_ds;
begin
  Result := ChildNodes['Signature'] as IXMLSignatureType_ds;
end;

{ TXMLFatturaElettronicaHeaderType }

procedure TXMLFatturaElettronicaHeaderType.AfterConstruction;
begin
  RegisterChildNode('DatiTrasmissione', TXMLDatiTrasmissioneType);
  RegisterChildNode('CedentePrestatore', TXMLCedentePrestatoreType);
  RegisterChildNode('RappresentanteFiscale', TXMLRappresentanteFiscaleType);
  RegisterChildNode('CessionarioCommittente', TXMLCessionarioCommittenteType);
  RegisterChildNode('TerzoIntermediarioOSoggettoEmittente', TXMLTerzoIntermediarioSoggettoEmittenteType);
  inherited;
end;

function TXMLFatturaElettronicaHeaderType.Get_DatiTrasmissione: IXMLDatiTrasmissioneType;
begin
  Result := ChildNodes['DatiTrasmissione'] as IXMLDatiTrasmissioneType;
end;

function TXMLFatturaElettronicaHeaderType.Get_CedentePrestatore: IXMLCedentePrestatoreType;
begin
  Result := ChildNodes['CedentePrestatore'] as IXMLCedentePrestatoreType;
end;

function TXMLFatturaElettronicaHeaderType.Get_RappresentanteFiscale: IXMLRappresentanteFiscaleType;
begin
  Result := ChildNodes['RappresentanteFiscale'] as IXMLRappresentanteFiscaleType;
end;

function TXMLFatturaElettronicaHeaderType.Get_CessionarioCommittente: IXMLCessionarioCommittenteType;
begin
  Result := ChildNodes['CessionarioCommittente'] as IXMLCessionarioCommittenteType;
end;

function TXMLFatturaElettronicaHeaderType.Get_TerzoIntermediarioOSoggettoEmittente: IXMLTerzoIntermediarioSoggettoEmittenteType;
begin
  Result := ChildNodes['TerzoIntermediarioOSoggettoEmittente'] as IXMLTerzoIntermediarioSoggettoEmittenteType;
end;

function TXMLFatturaElettronicaHeaderType.Get_SoggettoEmittente: UnicodeString;
begin
  Result := ChildNodes['SoggettoEmittente'].Text;
end;

procedure TXMLFatturaElettronicaHeaderType.Set_SoggettoEmittente(Value: UnicodeString);
begin
  ChildNodes['SoggettoEmittente'].NodeValue := Value;
end;

{ TXMLDatiTrasmissioneType }

procedure TXMLDatiTrasmissioneType.AfterConstruction;
begin
  RegisterChildNode('IdTrasmittente', TXMLIdFiscaleType);
  RegisterChildNode('ContattiTrasmittente', TXMLContattiTrasmittenteType);
  inherited;
end;

function TXMLDatiTrasmissioneType.Get_IdTrasmittente: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdTrasmittente'] as IXMLIdFiscaleType;
end;

function TXMLDatiTrasmissioneType.Get_ProgressivoInvio: UnicodeString;
begin
  Result := ChildNodes['ProgressivoInvio'].Text;
end;

procedure TXMLDatiTrasmissioneType.Set_ProgressivoInvio(Value: UnicodeString);
begin
  ChildNodes['ProgressivoInvio'].NodeValue := Value;
end;

function TXMLDatiTrasmissioneType.Get_FormatoTrasmissione: UnicodeString;
begin
  Result := ChildNodes['FormatoTrasmissione'].Text;
end;

procedure TXMLDatiTrasmissioneType.Set_FormatoTrasmissione(Value: UnicodeString);
begin
  ChildNodes['FormatoTrasmissione'].NodeValue := Value;
end;

function TXMLDatiTrasmissioneType.Get_CodiceDestinatario: UnicodeString;
begin
  Result := ChildNodes['CodiceDestinatario'].Text;
end;

procedure TXMLDatiTrasmissioneType.Set_CodiceDestinatario(Value: UnicodeString);
begin
  ChildNodes['CodiceDestinatario'].NodeValue := Value;
end;

function TXMLDatiTrasmissioneType.Get_ContattiTrasmittente: IXMLContattiTrasmittenteType;
begin
  Result := ChildNodes['ContattiTrasmittente'] as IXMLContattiTrasmittenteType;
end;

{ TXMLIdFiscaleType }

function TXMLIdFiscaleType.Get_IdPaese: UnicodeString;
begin
  Result := ChildNodes['IdPaese'].Text;
end;

procedure TXMLIdFiscaleType.Set_IdPaese(Value: UnicodeString);
begin
  ChildNodes['IdPaese'].NodeValue := Value;
end;

function TXMLIdFiscaleType.Get_IdCodice: UnicodeString;
begin
  Result := ChildNodes['IdCodice'].Text;
end;

procedure TXMLIdFiscaleType.Set_IdCodice(Value: UnicodeString);
begin
  ChildNodes['IdCodice'].NodeValue := Value;
end;

{ TXMLContattiTrasmittenteType }

function TXMLContattiTrasmittenteType.Get_Telefono: UnicodeString;
begin
  Result := ChildNodes['Telefono'].Text;
end;

procedure TXMLContattiTrasmittenteType.Set_Telefono(Value: UnicodeString);
begin
  ChildNodes['Telefono'].NodeValue := Value;
end;

function TXMLContattiTrasmittenteType.Get_Email: UnicodeString;
begin
  Result := ChildNodes['Email'].Text;
end;

procedure TXMLContattiTrasmittenteType.Set_Email(Value: UnicodeString);
begin
  ChildNodes['Email'].NodeValue := Value;
end;

{ TXMLCedentePrestatoreType }

procedure TXMLCedentePrestatoreType.AfterConstruction;
begin
  RegisterChildNode('DatiAnagrafici', TXMLDatiAnagraficiCedenteType);
  RegisterChildNode('Sede', TXMLIndirizzoType);
  RegisterChildNode('StabileOrganizzazione', TXMLIndirizzoType);
  RegisterChildNode('IscrizioneREA', TXMLIscrizioneREAType);
  RegisterChildNode('Contatti', TXMLContattiType);
  inherited;
end;

function TXMLCedentePrestatoreType.Get_DatiAnagrafici: IXMLDatiAnagraficiCedenteType;
begin
  Result := ChildNodes['DatiAnagrafici'] as IXMLDatiAnagraficiCedenteType;
end;

function TXMLCedentePrestatoreType.Get_Sede: IXMLIndirizzoType;
begin
  Result := ChildNodes['Sede'] as IXMLIndirizzoType;
end;

function TXMLCedentePrestatoreType.Get_StabileOrganizzazione: IXMLIndirizzoType;
begin
  Result := ChildNodes['StabileOrganizzazione'] as IXMLIndirizzoType;
end;

function TXMLCedentePrestatoreType.Get_IscrizioneREA: IXMLIscrizioneREAType;
begin
  Result := ChildNodes['IscrizioneREA'] as IXMLIscrizioneREAType;
end;

function TXMLCedentePrestatoreType.Get_Contatti: IXMLContattiType;
begin
  Result := ChildNodes['Contatti'] as IXMLContattiType;
end;

function TXMLCedentePrestatoreType.Get_RiferimentoAmministrazione: UnicodeString;
begin
  Result := ChildNodes['RiferimentoAmministrazione'].Text;
end;

procedure TXMLCedentePrestatoreType.Set_RiferimentoAmministrazione(Value: UnicodeString);
begin
  ChildNodes['RiferimentoAmministrazione'].NodeValue := Value;
end;

{ TXMLDatiAnagraficiCedenteType }

procedure TXMLDatiAnagraficiCedenteType.AfterConstruction;
begin
  RegisterChildNode('IdFiscaleIVA', TXMLIdFiscaleType);
  RegisterChildNode('Anagrafica', TXMLAnagraficaType);
  inherited;
end;

function TXMLDatiAnagraficiCedenteType.Get_IdFiscaleIVA: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdFiscaleIVA'] as IXMLIdFiscaleType;
end;

function TXMLDatiAnagraficiCedenteType.Get_CodiceFiscale: UnicodeString;
begin
  Result := ChildNodes['CodiceFiscale'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_CodiceFiscale(Value: UnicodeString);
begin
  ChildNodes['CodiceFiscale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCedenteType.Get_Anagrafica: IXMLAnagraficaType;
begin
  Result := ChildNodes['Anagrafica'] as IXMLAnagraficaType;
end;

function TXMLDatiAnagraficiCedenteType.Get_AlboProfessionale: UnicodeString;
begin
  Result := ChildNodes['AlboProfessionale'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_AlboProfessionale(Value: UnicodeString);
begin
  ChildNodes['AlboProfessionale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCedenteType.Get_ProvinciaAlbo: UnicodeString;
begin
  Result := ChildNodes['ProvinciaAlbo'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_ProvinciaAlbo(Value: UnicodeString);
begin
  ChildNodes['ProvinciaAlbo'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCedenteType.Get_NumeroIscrizioneAlbo: UnicodeString;
begin
  Result := ChildNodes['NumeroIscrizioneAlbo'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_NumeroIscrizioneAlbo(Value: UnicodeString);
begin
  ChildNodes['NumeroIscrizioneAlbo'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCedenteType.Get_DataIscrizioneAlbo: UnicodeString;
begin
  Result := ChildNodes['DataIscrizioneAlbo'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_DataIscrizioneAlbo(Value: UnicodeString);
begin
  ChildNodes['DataIscrizioneAlbo'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCedenteType.Get_RegimeFiscale: UnicodeString;
begin
  Result := ChildNodes['RegimeFiscale'].Text;
end;

procedure TXMLDatiAnagraficiCedenteType.Set_RegimeFiscale(Value: UnicodeString);
begin
  ChildNodes['RegimeFiscale'].NodeValue := Value;
end;

{ TXMLAnagraficaType }

function TXMLAnagraficaType.Get_Denominazione: UnicodeString;
begin
  Result := ChildNodes['Denominazione'].Text;
end;

procedure TXMLAnagraficaType.Set_Denominazione(Value: UnicodeString);
begin
  ChildNodes['Denominazione'].NodeValue := Value;
end;

function TXMLAnagraficaType.Get_Nome: UnicodeString;
begin
  Result := ChildNodes['Nome'].Text;
end;

procedure TXMLAnagraficaType.Set_Nome(Value: UnicodeString);
begin
  ChildNodes['Nome'].NodeValue := Value;
end;

function TXMLAnagraficaType.Get_Cognome: UnicodeString;
begin
  Result := ChildNodes['Cognome'].Text;
end;

procedure TXMLAnagraficaType.Set_Cognome(Value: UnicodeString);
begin
  ChildNodes['Cognome'].NodeValue := Value;
end;

function TXMLAnagraficaType.Get_Titolo: UnicodeString;
begin
  Result := ChildNodes['Titolo'].Text;
end;

procedure TXMLAnagraficaType.Set_Titolo(Value: UnicodeString);
begin
  ChildNodes['Titolo'].NodeValue := Value;
end;

function TXMLAnagraficaType.Get_CodEORI: UnicodeString;
begin
  Result := ChildNodes['CodEORI'].Text;
end;

procedure TXMLAnagraficaType.Set_CodEORI(Value: UnicodeString);
begin
  ChildNodes['CodEORI'].NodeValue := Value;
end;

{ TXMLIndirizzoType }

function TXMLIndirizzoType.Get_Indirizzo: UnicodeString;
begin
  Result := ChildNodes['Indirizzo'].Text;
end;

procedure TXMLIndirizzoType.Set_Indirizzo(Value: UnicodeString);
begin
  ChildNodes['Indirizzo'].NodeValue := Value;
end;

function TXMLIndirizzoType.Get_NumeroCivico: UnicodeString;
begin
  Result := ChildNodes['NumeroCivico'].Text;
end;

procedure TXMLIndirizzoType.Set_NumeroCivico(Value: UnicodeString);
begin
  ChildNodes['NumeroCivico'].NodeValue := Value;
end;

function TXMLIndirizzoType.Get_CAP: UnicodeString;
begin
  Result := ChildNodes['CAP'].Text;
end;

procedure TXMLIndirizzoType.Set_CAP(Value: UnicodeString);
begin
  ChildNodes['CAP'].NodeValue := Value;
end;

function TXMLIndirizzoType.Get_Comune: UnicodeString;
begin
  Result := ChildNodes['Comune'].Text;
end;

procedure TXMLIndirizzoType.Set_Comune(Value: UnicodeString);
begin
  ChildNodes['Comune'].NodeValue := Value;
end;

function TXMLIndirizzoType.Get_Provincia: UnicodeString;
begin
  Result := ChildNodes['Provincia'].Text;
end;

procedure TXMLIndirizzoType.Set_Provincia(Value: UnicodeString);
begin
  ChildNodes['Provincia'].NodeValue := Value;
end;

function TXMLIndirizzoType.Get_Nazione: UnicodeString;
begin
  Result := ChildNodes['Nazione'].Text;
end;

procedure TXMLIndirizzoType.Set_Nazione(Value: UnicodeString);
begin
  ChildNodes['Nazione'].NodeValue := Value;
end;

{ TXMLIscrizioneREAType }

function TXMLIscrizioneREAType.Get_Ufficio: UnicodeString;
begin
  Result := ChildNodes['Ufficio'].Text;
end;

procedure TXMLIscrizioneREAType.Set_Ufficio(Value: UnicodeString);
begin
  ChildNodes['Ufficio'].NodeValue := Value;
end;

function TXMLIscrizioneREAType.Get_NumeroREA: UnicodeString;
begin
  Result := ChildNodes['NumeroREA'].Text;
end;

procedure TXMLIscrizioneREAType.Set_NumeroREA(Value: UnicodeString);
begin
  ChildNodes['NumeroREA'].NodeValue := Value;
end;

function TXMLIscrizioneREAType.Get_CapitaleSociale: UnicodeString;
begin
  Result := ChildNodes['CapitaleSociale'].Text;
end;

procedure TXMLIscrizioneREAType.Set_CapitaleSociale(Value: UnicodeString);
begin
  ChildNodes['CapitaleSociale'].NodeValue := Value;
end;

function TXMLIscrizioneREAType.Get_SocioUnico: UnicodeString;
begin
  Result := ChildNodes['SocioUnico'].Text;
end;

procedure TXMLIscrizioneREAType.Set_SocioUnico(Value: UnicodeString);
begin
  ChildNodes['SocioUnico'].NodeValue := Value;
end;

function TXMLIscrizioneREAType.Get_StatoLiquidazione: UnicodeString;
begin
  Result := ChildNodes['StatoLiquidazione'].Text;
end;

procedure TXMLIscrizioneREAType.Set_StatoLiquidazione(Value: UnicodeString);
begin
  ChildNodes['StatoLiquidazione'].NodeValue := Value;
end;

{ TXMLContattiType }

function TXMLContattiType.Get_Telefono: UnicodeString;
begin
  Result := ChildNodes['Telefono'].Text;
end;

procedure TXMLContattiType.Set_Telefono(Value: UnicodeString);
begin
  ChildNodes['Telefono'].NodeValue := Value;
end;

function TXMLContattiType.Get_Fax: UnicodeString;
begin
  Result := ChildNodes['Fax'].Text;
end;

procedure TXMLContattiType.Set_Fax(Value: UnicodeString);
begin
  ChildNodes['Fax'].NodeValue := Value;
end;

function TXMLContattiType.Get_Email: UnicodeString;
begin
  Result := ChildNodes['Email'].Text;
end;

procedure TXMLContattiType.Set_Email(Value: UnicodeString);
begin
  ChildNodes['Email'].NodeValue := Value;
end;

{ TXMLRappresentanteFiscaleType }

procedure TXMLRappresentanteFiscaleType.AfterConstruction;
begin
  RegisterChildNode('DatiAnagrafici', TXMLDatiAnagraficiRappresentanteType);
  inherited;
end;

function TXMLRappresentanteFiscaleType.Get_DatiAnagrafici: IXMLDatiAnagraficiRappresentanteType;
begin
  Result := ChildNodes['DatiAnagrafici'] as IXMLDatiAnagraficiRappresentanteType;
end;

{ TXMLDatiAnagraficiRappresentanteType }

procedure TXMLDatiAnagraficiRappresentanteType.AfterConstruction;
begin
  RegisterChildNode('IdFiscaleIVA', TXMLIdFiscaleType);
  RegisterChildNode('Anagrafica', TXMLAnagraficaType);
  inherited;
end;

function TXMLDatiAnagraficiRappresentanteType.Get_IdFiscaleIVA: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdFiscaleIVA'] as IXMLIdFiscaleType;
end;

function TXMLDatiAnagraficiRappresentanteType.Get_CodiceFiscale: UnicodeString;
begin
  Result := ChildNodes['CodiceFiscale'].Text;
end;

procedure TXMLDatiAnagraficiRappresentanteType.Set_CodiceFiscale(Value: UnicodeString);
begin
  ChildNodes['CodiceFiscale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiRappresentanteType.Get_Anagrafica: IXMLAnagraficaType;
begin
  Result := ChildNodes['Anagrafica'] as IXMLAnagraficaType;
end;

{ TXMLCessionarioCommittenteType }

procedure TXMLCessionarioCommittenteType.AfterConstruction;
begin
  RegisterChildNode('DatiAnagrafici', TXMLDatiAnagraficiCessionarioType);
  RegisterChildNode('Sede', TXMLIndirizzoType);
  inherited;
end;

function TXMLCessionarioCommittenteType.Get_DatiAnagrafici: IXMLDatiAnagraficiCessionarioType;
begin
  Result := ChildNodes['DatiAnagrafici'] as IXMLDatiAnagraficiCessionarioType;
end;

function TXMLCessionarioCommittenteType.Get_Sede: IXMLIndirizzoType;
begin
  Result := ChildNodes['Sede'] as IXMLIndirizzoType;
end;

{ TXMLDatiAnagraficiCessionarioType }

procedure TXMLDatiAnagraficiCessionarioType.AfterConstruction;
begin
  RegisterChildNode('IdFiscaleIVA', TXMLIdFiscaleType);
  RegisterChildNode('Anagrafica', TXMLAnagraficaType);
  inherited;
end;

function TXMLDatiAnagraficiCessionarioType.Get_IdFiscaleIVA: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdFiscaleIVA'] as IXMLIdFiscaleType;
end;

function TXMLDatiAnagraficiCessionarioType.Get_CodiceFiscale: UnicodeString;
begin
  Result := ChildNodes['CodiceFiscale'].Text;
end;

procedure TXMLDatiAnagraficiCessionarioType.Set_CodiceFiscale(Value: UnicodeString);
begin
  ChildNodes['CodiceFiscale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiCessionarioType.Get_Anagrafica: IXMLAnagraficaType;
begin
  Result := ChildNodes['Anagrafica'] as IXMLAnagraficaType;
end;

{ TXMLTerzoIntermediarioSoggettoEmittenteType }

procedure TXMLTerzoIntermediarioSoggettoEmittenteType.AfterConstruction;
begin
  RegisterChildNode('DatiAnagrafici', TXMLDatiAnagraficiTerzoIntermediarioType);
  inherited;
end;

function TXMLTerzoIntermediarioSoggettoEmittenteType.Get_DatiAnagrafici: IXMLDatiAnagraficiTerzoIntermediarioType;
begin
  Result := ChildNodes['DatiAnagrafici'] as IXMLDatiAnagraficiTerzoIntermediarioType;
end;

{ TXMLDatiAnagraficiTerzoIntermediarioType }

procedure TXMLDatiAnagraficiTerzoIntermediarioType.AfterConstruction;
begin
  RegisterChildNode('IdFiscaleIVA', TXMLIdFiscaleType);
  RegisterChildNode('Anagrafica', TXMLAnagraficaType);
  inherited;
end;

function TXMLDatiAnagraficiTerzoIntermediarioType.Get_IdFiscaleIVA: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdFiscaleIVA'] as IXMLIdFiscaleType;
end;

function TXMLDatiAnagraficiTerzoIntermediarioType.Get_CodiceFiscale: UnicodeString;
begin
  Result := ChildNodes['CodiceFiscale'].Text;
end;

procedure TXMLDatiAnagraficiTerzoIntermediarioType.Set_CodiceFiscale(Value: UnicodeString);
begin
  ChildNodes['CodiceFiscale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiTerzoIntermediarioType.Get_Anagrafica: IXMLAnagraficaType;
begin
  Result := ChildNodes['Anagrafica'] as IXMLAnagraficaType;
end;

{ TXMLFatturaElettronicaBodyType }

procedure TXMLFatturaElettronicaBodyType.AfterConstruction;
begin
  RegisterChildNode('DatiGenerali', TXMLDatiGeneraliType);
  RegisterChildNode('DatiBeniServizi', TXMLDatiBeniServiziType);
  RegisterChildNode('DatiVeicoli', TXMLDatiVeicoliType);
  RegisterChildNode('DatiPagamento', TXMLDatiPagamentoType);
  RegisterChildNode('Allegati', TXMLAllegatiType);
  FDatiPagamento := CreateCollection(TXMLDatiPagamentoTypeList, IXMLDatiPagamentoType, 'DatiPagamento') as IXMLDatiPagamentoTypeList;
  FAllegati := CreateCollection(TXMLAllegatiTypeList, IXMLAllegatiType, 'Allegati') as IXMLAllegatiTypeList;
  inherited;
end;

function TXMLFatturaElettronicaBodyType.Get_DatiGenerali: IXMLDatiGeneraliType;
begin
  Result := ChildNodes['DatiGenerali'] as IXMLDatiGeneraliType;
end;

function TXMLFatturaElettronicaBodyType.Get_DatiBeniServizi: IXMLDatiBeniServiziType;
begin
  Result := ChildNodes['DatiBeniServizi'] as IXMLDatiBeniServiziType;
end;

function TXMLFatturaElettronicaBodyType.Get_DatiVeicoli: IXMLDatiVeicoliType;
begin
  Result := ChildNodes['DatiVeicoli'] as IXMLDatiVeicoliType;
end;

function TXMLFatturaElettronicaBodyType.Get_DatiPagamento: IXMLDatiPagamentoTypeList;
begin
  Result := FDatiPagamento;
end;

function TXMLFatturaElettronicaBodyType.Get_Allegati: IXMLAllegatiTypeList;
begin
  Result := FAllegati;
end;

{ TXMLFatturaElettronicaBodyTypeList }

function TXMLFatturaElettronicaBodyTypeList.Add: IXMLFatturaElettronicaBodyType;
begin
  Result := AddItem(-1) as IXMLFatturaElettronicaBodyType;
end;

function TXMLFatturaElettronicaBodyTypeList.Insert(const Index: Integer): IXMLFatturaElettronicaBodyType;
begin
  Result := AddItem(Index) as IXMLFatturaElettronicaBodyType;
end;

procedure TXMLFatturaElettronicaBodyTypeList.Delete(Index: Integer);
begin
  Inherited Delete(Index);
end;

function TXMLFatturaElettronicaBodyTypeList.Get_Item(Index: Integer): IXMLFatturaElettronicaBodyType;
begin
  Result := List[Index] as IXMLFatturaElettronicaBodyType;
end;

{ TXMLDatiGeneraliType }

procedure TXMLDatiGeneraliType.AfterConstruction;
begin
  RegisterChildNode('DatiGeneraliDocumento', TXMLDatiGeneraliDocumentoType);
  RegisterChildNode('DatiOrdineAcquisto', TXMLDatiDocumentiCorrelatiType);
  RegisterChildNode('DatiContratto', TXMLDatiDocumentiCorrelatiType);
  RegisterChildNode('DatiConvenzione', TXMLDatiDocumentiCorrelatiType);
  RegisterChildNode('DatiRicezione', TXMLDatiDocumentiCorrelatiType);
  RegisterChildNode('DatiFattureCollegate', TXMLDatiDocumentiCorrelatiType);
  RegisterChildNode('DatiSAL', TXMLDatiSALType);
  RegisterChildNode('DatiDDT', TXMLDatiDDTType);
  RegisterChildNode('DatiTrasporto', TXMLDatiTrasportoType);
  RegisterChildNode('FatturaPrincipale', TXMLFatturaPrincipaleType);
  FDatiOrdineAcquisto := CreateCollection(TXMLDatiDocumentiCorrelatiTypeList, IXMLDatiDocumentiCorrelatiType, 'DatiOrdineAcquisto') as IXMLDatiDocumentiCorrelatiTypeList;
  FDatiContratto := CreateCollection(TXMLDatiDocumentiCorrelatiTypeList, IXMLDatiDocumentiCorrelatiType, 'DatiContratto') as IXMLDatiDocumentiCorrelatiTypeList;
  FDatiConvenzione := CreateCollection(TXMLDatiDocumentiCorrelatiTypeList, IXMLDatiDocumentiCorrelatiType, 'DatiConvenzione') as IXMLDatiDocumentiCorrelatiTypeList;
  FDatiRicezione := CreateCollection(TXMLDatiDocumentiCorrelatiTypeList, IXMLDatiDocumentiCorrelatiType, 'DatiRicezione') as IXMLDatiDocumentiCorrelatiTypeList;
  FDatiFattureCollegate := CreateCollection(TXMLDatiDocumentiCorrelatiTypeList, IXMLDatiDocumentiCorrelatiType, 'DatiFattureCollegate') as IXMLDatiDocumentiCorrelatiTypeList;
  FDatiSAL := CreateCollection(TXMLDatiSALTypeList, IXMLDatiSALType, 'DatiSAL') as IXMLDatiSALTypeList;
  FDatiDDT := CreateCollection(TXMLDatiDDTTypeList, IXMLDatiDDTType, 'DatiDDT') as IXMLDatiDDTTypeList;
  inherited;
end;

function TXMLDatiGeneraliType.Get_DatiGeneraliDocumento: IXMLDatiGeneraliDocumentoType;
begin
  Result := ChildNodes['DatiGeneraliDocumento'] as IXMLDatiGeneraliDocumentoType;
end;

function TXMLDatiGeneraliType.Get_DatiOrdineAcquisto: IXMLDatiDocumentiCorrelatiTypeList;
begin
  Result := FDatiOrdineAcquisto;
end;

function TXMLDatiGeneraliType.Get_DatiContratto: IXMLDatiDocumentiCorrelatiTypeList;
begin
  Result := FDatiContratto;
end;

function TXMLDatiGeneraliType.Get_DatiConvenzione: IXMLDatiDocumentiCorrelatiTypeList;
begin
  Result := FDatiConvenzione;
end;

function TXMLDatiGeneraliType.Get_DatiRicezione: IXMLDatiDocumentiCorrelatiTypeList;
begin
  Result := FDatiRicezione;
end;

function TXMLDatiGeneraliType.Get_DatiFattureCollegate: IXMLDatiDocumentiCorrelatiTypeList;
begin
  Result := FDatiFattureCollegate;
end;

function TXMLDatiGeneraliType.Get_DatiSAL: IXMLDatiSALTypeList;
begin
  Result := FDatiSAL;
end;

function TXMLDatiGeneraliType.Get_DatiDDT: IXMLDatiDDTTypeList;
begin
  Result := FDatiDDT;
end;

function TXMLDatiGeneraliType.Get_DatiTrasporto: IXMLDatiTrasportoType;
begin
  Result := ChildNodes['DatiTrasporto'] as IXMLDatiTrasportoType;
end;

function TXMLDatiGeneraliType.Get_FatturaPrincipale: IXMLFatturaPrincipaleType;
begin
  Result := ChildNodes['FatturaPrincipale'] as IXMLFatturaPrincipaleType;
end;

{ TXMLDatiGeneraliDocumentoType }

procedure TXMLDatiGeneraliDocumentoType.AfterConstruction;
begin
  RegisterChildNode('DatiRitenuta', TXMLDatiRitenutaType);
  RegisterChildNode('DatiBollo', TXMLDatiBolloType);
  RegisterChildNode('DatiCassaPrevidenziale', TXMLDatiCassaPrevidenzialeType);
  RegisterChildNode('ScontoMaggiorazione', TXMLScontoMaggiorazioneType);
  FDatiCassaPrevidenziale := CreateCollection(TXMLDatiCassaPrevidenzialeTypeList, IXMLDatiCassaPrevidenzialeType, 'DatiCassaPrevidenziale') as IXMLDatiCassaPrevidenzialeTypeList;
  FScontoMaggiorazione := CreateCollection(TXMLScontoMaggiorazioneTypeList, IXMLScontoMaggiorazioneType, 'ScontoMaggiorazione') as IXMLScontoMaggiorazioneTypeList;
  FCausale := CreateCollection(TXMLString200LatinTypeList, IXMLNode, 'Causale') as IXMLString200LatinTypeList;
  inherited;
end;

function TXMLDatiGeneraliDocumentoType.Get_TipoDocumento: UnicodeString;
begin
  Result := ChildNodes['TipoDocumento'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_TipoDocumento(Value: UnicodeString);
begin
  ChildNodes['TipoDocumento'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_Divisa: UnicodeString;
begin
  Result := ChildNodes['Divisa'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_Divisa(Value: UnicodeString);
begin
  ChildNodes['Divisa'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_Data: UnicodeString;
begin
  Result := ChildNodes['Data'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_Data(Value: UnicodeString);
begin
  ChildNodes['Data'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_Numero: UnicodeString;
begin
  Result := ChildNodes['Numero'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_Numero(Value: UnicodeString);
begin
  ChildNodes['Numero'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_DatiRitenuta: IXMLDatiRitenutaType;
begin
  Result := ChildNodes['DatiRitenuta'] as IXMLDatiRitenutaType;
end;

function TXMLDatiGeneraliDocumentoType.Get_DatiBollo: IXMLDatiBolloType;
begin
  Result := ChildNodes['DatiBollo'] as IXMLDatiBolloType;
end;

function TXMLDatiGeneraliDocumentoType.Get_DatiCassaPrevidenziale: IXMLDatiCassaPrevidenzialeTypeList;
begin
  Result := FDatiCassaPrevidenziale;
end;

function TXMLDatiGeneraliDocumentoType.Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
begin
  Result := FScontoMaggiorazione;
end;

function TXMLDatiGeneraliDocumentoType.Get_ImportoTotaleDocumento: UnicodeString;
begin
  Result := ChildNodes['ImportoTotaleDocumento'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_ImportoTotaleDocumento(Value: UnicodeString);
begin
  ChildNodes['ImportoTotaleDocumento'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_Arrotondamento: UnicodeString;
begin
  Result := ChildNodes['Arrotondamento'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_Arrotondamento(Value: UnicodeString);
begin
  ChildNodes['Arrotondamento'].NodeValue := Value;
end;

function TXMLDatiGeneraliDocumentoType.Get_Causale: IXMLString200LatinTypeList;
begin
  Result := FCausale;
end;

function TXMLDatiGeneraliDocumentoType.Get_Art73: UnicodeString;
begin
  Result := ChildNodes['Art73'].Text;
end;

procedure TXMLDatiGeneraliDocumentoType.Set_Art73(Value: UnicodeString);
begin
  ChildNodes['Art73'].NodeValue := Value;
end;

{ TXMLDatiRitenutaType }

function TXMLDatiRitenutaType.Get_TipoRitenuta: UnicodeString;
begin
  Result := ChildNodes['TipoRitenuta'].Text;
end;

procedure TXMLDatiRitenutaType.Set_TipoRitenuta(Value: UnicodeString);
begin
  ChildNodes['TipoRitenuta'].NodeValue := Value;
end;

function TXMLDatiRitenutaType.Get_ImportoRitenuta: UnicodeString;
begin
  Result := ChildNodes['ImportoRitenuta'].Text;
end;

procedure TXMLDatiRitenutaType.Set_ImportoRitenuta(Value: UnicodeString);
begin
  ChildNodes['ImportoRitenuta'].NodeValue := Value;
end;

function TXMLDatiRitenutaType.Get_AliquotaRitenuta: UnicodeString;
begin
  Result := ChildNodes['AliquotaRitenuta'].Text;
end;

procedure TXMLDatiRitenutaType.Set_AliquotaRitenuta(Value: UnicodeString);
begin
  ChildNodes['AliquotaRitenuta'].NodeValue := Value;
end;

function TXMLDatiRitenutaType.Get_CausalePagamento: UnicodeString;
begin
  Result := ChildNodes['CausalePagamento'].Text;
end;

procedure TXMLDatiRitenutaType.Set_CausalePagamento(Value: UnicodeString);
begin
  ChildNodes['CausalePagamento'].NodeValue := Value;
end;

{ TXMLDatiBolloType }

function TXMLDatiBolloType.Get_BolloVirtuale: UnicodeString;
begin
  Result := ChildNodes['BolloVirtuale'].Text;
end;

procedure TXMLDatiBolloType.Set_BolloVirtuale(Value: UnicodeString);
begin
  ChildNodes['BolloVirtuale'].NodeValue := Value;
end;

function TXMLDatiBolloType.Get_ImportoBollo: UnicodeString;
begin
  Result := ChildNodes['ImportoBollo'].Text;
end;

procedure TXMLDatiBolloType.Set_ImportoBollo(Value: UnicodeString);
begin
  ChildNodes['ImportoBollo'].NodeValue := Value;
end;

{ TXMLDatiCassaPrevidenzialeType }

function TXMLDatiCassaPrevidenzialeType.Get_TipoCassa: UnicodeString;
begin
  Result := ChildNodes['TipoCassa'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_TipoCassa(Value: UnicodeString);
begin
  ChildNodes['TipoCassa'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_AlCassa: UnicodeString;
begin
  Result := ChildNodes['AlCassa'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_AlCassa(Value: UnicodeString);
begin
  ChildNodes['AlCassa'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_ImportoContributoCassa: UnicodeString;
begin
  Result := ChildNodes['ImportoContributoCassa'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_ImportoContributoCassa(Value: UnicodeString);
begin
  ChildNodes['ImportoContributoCassa'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_ImponibileCassa: UnicodeString;
begin
  Result := ChildNodes['ImponibileCassa'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_ImponibileCassa(Value: UnicodeString);
begin
  ChildNodes['ImponibileCassa'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_AliquotaIVA: UnicodeString;
begin
  Result := ChildNodes['AliquotaIVA'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_AliquotaIVA(Value: UnicodeString);
begin
  ChildNodes['AliquotaIVA'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_Ritenuta: UnicodeString;
begin
  Result := ChildNodes['Ritenuta'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_Ritenuta(Value: UnicodeString);
begin
  ChildNodes['Ritenuta'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_Natura: UnicodeString;
begin
  Result := ChildNodes['Natura'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_Natura(Value: UnicodeString);
begin
  ChildNodes['Natura'].NodeValue := Value;
end;

function TXMLDatiCassaPrevidenzialeType.Get_RiferimentoAmministrazione: UnicodeString;
begin
  Result := ChildNodes['RiferimentoAmministrazione'].Text;
end;

procedure TXMLDatiCassaPrevidenzialeType.Set_RiferimentoAmministrazione(Value: UnicodeString);
begin
  ChildNodes['RiferimentoAmministrazione'].NodeValue := Value;
end;

{ TXMLDatiCassaPrevidenzialeTypeList }

function TXMLDatiCassaPrevidenzialeTypeList.Add: IXMLDatiCassaPrevidenzialeType;
begin
  Result := AddItem(-1) as IXMLDatiCassaPrevidenzialeType;
end;

function TXMLDatiCassaPrevidenzialeTypeList.Insert(const Index: Integer): IXMLDatiCassaPrevidenzialeType;
begin
  Result := AddItem(Index) as IXMLDatiCassaPrevidenzialeType;
end;

function TXMLDatiCassaPrevidenzialeTypeList.Get_Item(Index: Integer): IXMLDatiCassaPrevidenzialeType;
begin
  Result := List[Index] as IXMLDatiCassaPrevidenzialeType;
end;

{ TXMLScontoMaggiorazioneType }

function TXMLScontoMaggiorazioneType.Get_Tipo: UnicodeString;
begin
  Result := ChildNodes['Tipo'].Text;
end;

procedure TXMLScontoMaggiorazioneType.Set_Tipo(Value: UnicodeString);
begin
  ChildNodes['Tipo'].NodeValue := Value;
end;

function TXMLScontoMaggiorazioneType.Get_Percentuale: UnicodeString;
begin
  Result := ChildNodes['Percentuale'].Text;
end;

procedure TXMLScontoMaggiorazioneType.Set_Percentuale(Value: UnicodeString);
begin
  ChildNodes['Percentuale'].NodeValue := Value;
end;

function TXMLScontoMaggiorazioneType.Get_Importo: UnicodeString;
begin
  Result := ChildNodes['Importo'].Text;
end;

procedure TXMLScontoMaggiorazioneType.Set_Importo(Value: UnicodeString);
begin
  ChildNodes['Importo'].NodeValue := Value;
end;

{ TXMLScontoMaggiorazioneTypeList }

function TXMLScontoMaggiorazioneTypeList.Add: IXMLScontoMaggiorazioneType;
begin
  Result := AddItem(-1) as IXMLScontoMaggiorazioneType;
end;

function TXMLScontoMaggiorazioneTypeList.Insert(const Index: Integer): IXMLScontoMaggiorazioneType;
begin
  Result := AddItem(Index) as IXMLScontoMaggiorazioneType;
end;

function TXMLScontoMaggiorazioneTypeList.Get_Item(Index: Integer): IXMLScontoMaggiorazioneType;
begin
  Result := List[Index] as IXMLScontoMaggiorazioneType;
end;

{ TXMLDatiDocumentiCorrelatiType }

procedure TXMLDatiDocumentiCorrelatiType.AfterConstruction;
begin
  FRiferimentoNumeroLinea := CreateCollection(TXMLRiferimentoNumeroLineaTypeList, IXMLNode, 'RiferimentoNumeroLinea') as IXMLRiferimentoNumeroLineaTypeList;
  inherited;
end;

function TXMLDatiDocumentiCorrelatiType.Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
begin
  Result := FRiferimentoNumeroLinea;
end;

function TXMLDatiDocumentiCorrelatiType.Get_IdDocumento: UnicodeString;
begin
  Result := ChildNodes['IdDocumento'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_IdDocumento(Value: UnicodeString);
begin
  ChildNodes['IdDocumento'].NodeValue := Value;
end;

function TXMLDatiDocumentiCorrelatiType.Get_Data: UnicodeString;
begin
  Result := ChildNodes['Data'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_Data(Value: UnicodeString);
begin
  ChildNodes['Data'].NodeValue := Value;
end;

function TXMLDatiDocumentiCorrelatiType.Get_NumItem: UnicodeString;
begin
  Result := ChildNodes['NumItem'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_NumItem(Value: UnicodeString);
begin
  ChildNodes['NumItem'].NodeValue := Value;
end;

function TXMLDatiDocumentiCorrelatiType.Get_CodiceCommessaConvenzione: UnicodeString;
begin
  Result := ChildNodes['CodiceCommessaConvenzione'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_CodiceCommessaConvenzione(Value: UnicodeString);
begin
  ChildNodes['CodiceCommessaConvenzione'].NodeValue := Value;
end;

function TXMLDatiDocumentiCorrelatiType.Get_CodiceCUP: UnicodeString;
begin
  Result := ChildNodes['CodiceCUP'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_CodiceCUP(Value: UnicodeString);
begin
  ChildNodes['CodiceCUP'].NodeValue := Value;
end;

function TXMLDatiDocumentiCorrelatiType.Get_CodiceCIG: UnicodeString;
begin
  Result := ChildNodes['CodiceCIG'].Text;
end;

procedure TXMLDatiDocumentiCorrelatiType.Set_CodiceCIG(Value: UnicodeString);
begin
  ChildNodes['CodiceCIG'].NodeValue := Value;
end;

{ TXMLDatiDocumentiCorrelatiTypeList }

function TXMLDatiDocumentiCorrelatiTypeList.Add: IXMLDatiDocumentiCorrelatiType;
begin
  Result := AddItem(-1) as IXMLDatiDocumentiCorrelatiType;
end;

function TXMLDatiDocumentiCorrelatiTypeList.Insert(const Index: Integer): IXMLDatiDocumentiCorrelatiType;
begin
  Result := AddItem(Index) as IXMLDatiDocumentiCorrelatiType;
end;

function TXMLDatiDocumentiCorrelatiTypeList.Get_Item(Index: Integer): IXMLDatiDocumentiCorrelatiType;
begin
  Result := List[Index] as IXMLDatiDocumentiCorrelatiType;
end;

{ TXMLDatiSALType }

function TXMLDatiSALType.Get_RiferimentoFase: Integer;
begin
  Result := ChildNodes['RiferimentoFase'].NodeValue;
end;

procedure TXMLDatiSALType.Set_RiferimentoFase(Value: Integer);
begin
  ChildNodes['RiferimentoFase'].NodeValue := Value;
end;

{ TXMLDatiSALTypeList }

function TXMLDatiSALTypeList.Add: IXMLDatiSALType;
begin
  Result := AddItem(-1) as IXMLDatiSALType;
end;

function TXMLDatiSALTypeList.Insert(const Index: Integer): IXMLDatiSALType;
begin
  Result := AddItem(Index) as IXMLDatiSALType;
end;

function TXMLDatiSALTypeList.Get_Item(Index: Integer): IXMLDatiSALType;
begin
  Result := List[Index] as IXMLDatiSALType;
end;

{ TXMLDatiDDTType }

procedure TXMLDatiDDTType.AfterConstruction;
begin
  FRiferimentoNumeroLinea := CreateCollection(TXMLRiferimentoNumeroLineaTypeList, IXMLNode, 'RiferimentoNumeroLinea') as IXMLRiferimentoNumeroLineaTypeList;
  inherited;
end;

function TXMLDatiDDTType.Get_NumeroDDT: UnicodeString;
begin
  Result := ChildNodes['NumeroDDT'].Text;
end;

procedure TXMLDatiDDTType.Set_NumeroDDT(Value: UnicodeString);
begin
  ChildNodes['NumeroDDT'].NodeValue := Value;
end;

function TXMLDatiDDTType.Get_DataDDT: UnicodeString;
begin
  Result := ChildNodes['DataDDT'].Text;
end;

procedure TXMLDatiDDTType.Set_DataDDT(Value: UnicodeString);
begin
  ChildNodes['DataDDT'].NodeValue := Value;
end;

function TXMLDatiDDTType.Get_RiferimentoNumeroLinea: IXMLRiferimentoNumeroLineaTypeList;
begin
  Result := FRiferimentoNumeroLinea;
end;

{ TXMLDatiDDTTypeList }

function TXMLDatiDDTTypeList.Add: IXMLDatiDDTType;
begin
  Result := AddItem(-1) as IXMLDatiDDTType;
end;

function TXMLDatiDDTTypeList.Insert(const Index: Integer): IXMLDatiDDTType;
begin
  Result := AddItem(Index) as IXMLDatiDDTType;
end;

function TXMLDatiDDTTypeList.Get_Item(Index: Integer): IXMLDatiDDTType;
begin
  Result := List[Index] as IXMLDatiDDTType;
end;

{ TXMLDatiTrasportoType }

procedure TXMLDatiTrasportoType.AfterConstruction;
begin
  RegisterChildNode('DatiAnagraficiVettore', TXMLDatiAnagraficiVettoreType);
  RegisterChildNode('IndirizzoResa', TXMLIndirizzoType);
  inherited;
end;

function TXMLDatiTrasportoType.Get_DatiAnagraficiVettore: IXMLDatiAnagraficiVettoreType;
begin
  Result := ChildNodes['DatiAnagraficiVettore'] as IXMLDatiAnagraficiVettoreType;
end;

function TXMLDatiTrasportoType.Get_MezzoTrasporto: UnicodeString;
begin
  Result := ChildNodes['MezzoTrasporto'].Text;
end;

procedure TXMLDatiTrasportoType.Set_MezzoTrasporto(Value: UnicodeString);
begin
  ChildNodes['MezzoTrasporto'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_CausaleTrasporto: UnicodeString;
begin
  Result := ChildNodes['CausaleTrasporto'].Text;
end;

procedure TXMLDatiTrasportoType.Set_CausaleTrasporto(Value: UnicodeString);
begin
  ChildNodes['CausaleTrasporto'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_NumeroColli: Integer;
begin
  Result := ChildNodes['NumeroColli'].NodeValue;
end;

procedure TXMLDatiTrasportoType.Set_NumeroColli(Value: Integer);
begin
  ChildNodes['NumeroColli'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_Descrizione: UnicodeString;
begin
  Result := ChildNodes['Descrizione'].Text;
end;

procedure TXMLDatiTrasportoType.Set_Descrizione(Value: UnicodeString);
begin
  ChildNodes['Descrizione'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_UnitaMisuraPeso: UnicodeString;
begin
  Result := ChildNodes['UnitaMisuraPeso'].Text;
end;

procedure TXMLDatiTrasportoType.Set_UnitaMisuraPeso(Value: UnicodeString);
begin
  ChildNodes['UnitaMisuraPeso'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_PesoLordo: UnicodeString;
begin
  Result := ChildNodes['PesoLordo'].Text;
end;

procedure TXMLDatiTrasportoType.Set_PesoLordo(Value: UnicodeString);
begin
  ChildNodes['PesoLordo'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_PesoNetto: UnicodeString;
begin
  Result := ChildNodes['PesoNetto'].Text;
end;

procedure TXMLDatiTrasportoType.Set_PesoNetto(Value: UnicodeString);
begin
  ChildNodes['PesoNetto'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_DataOraRitiro: UnicodeString;
begin
  Result := ChildNodes['DataOraRitiro'].Text;
end;

procedure TXMLDatiTrasportoType.Set_DataOraRitiro(Value: UnicodeString);
begin
  ChildNodes['DataOraRitiro'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_DataInizioTrasporto: UnicodeString;
begin
  Result := ChildNodes['DataInizioTrasporto'].Text;
end;

procedure TXMLDatiTrasportoType.Set_DataInizioTrasporto(Value: UnicodeString);
begin
  ChildNodes['DataInizioTrasporto'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_TipoResa: UnicodeString;
begin
  Result := ChildNodes['TipoResa'].Text;
end;

procedure TXMLDatiTrasportoType.Set_TipoResa(Value: UnicodeString);
begin
  ChildNodes['TipoResa'].NodeValue := Value;
end;

function TXMLDatiTrasportoType.Get_IndirizzoResa: IXMLIndirizzoType;
begin
  Result := ChildNodes['IndirizzoResa'] as IXMLIndirizzoType;
end;

function TXMLDatiTrasportoType.Get_DataOraConsegna: UnicodeString;
begin
  Result := ChildNodes['DataOraConsegna'].Text;
end;

procedure TXMLDatiTrasportoType.Set_DataOraConsegna(Value: UnicodeString);
begin
  ChildNodes['DataOraConsegna'].NodeValue := Value;
end;

{ TXMLDatiAnagraficiVettoreType }

procedure TXMLDatiAnagraficiVettoreType.AfterConstruction;
begin
  RegisterChildNode('IdFiscaleIVA', TXMLIdFiscaleType);
  RegisterChildNode('Anagrafica', TXMLAnagraficaType);
  inherited;
end;

function TXMLDatiAnagraficiVettoreType.Get_IdFiscaleIVA: IXMLIdFiscaleType;
begin
  Result := ChildNodes['IdFiscaleIVA'] as IXMLIdFiscaleType;
end;

function TXMLDatiAnagraficiVettoreType.Get_CodiceFiscale: UnicodeString;
begin
  Result := ChildNodes['CodiceFiscale'].Text;
end;

procedure TXMLDatiAnagraficiVettoreType.Set_CodiceFiscale(Value: UnicodeString);
begin
  ChildNodes['CodiceFiscale'].NodeValue := Value;
end;

function TXMLDatiAnagraficiVettoreType.Get_Anagrafica: IXMLAnagraficaType;
begin
  Result := ChildNodes['Anagrafica'] as IXMLAnagraficaType;
end;

function TXMLDatiAnagraficiVettoreType.Get_NumeroLicenzaGuida: UnicodeString;
begin
  Result := ChildNodes['NumeroLicenzaGuida'].Text;
end;

procedure TXMLDatiAnagraficiVettoreType.Set_NumeroLicenzaGuida(Value: UnicodeString);
begin
  ChildNodes['NumeroLicenzaGuida'].NodeValue := Value;
end;

{ TXMLFatturaPrincipaleType }

function TXMLFatturaPrincipaleType.Get_NumeroFatturaPrincipale: UnicodeString;
begin
  Result := ChildNodes['NumeroFatturaPrincipale'].Text;
end;

procedure TXMLFatturaPrincipaleType.Set_NumeroFatturaPrincipale(Value: UnicodeString);
begin
  ChildNodes['NumeroFatturaPrincipale'].NodeValue := Value;
end;

function TXMLFatturaPrincipaleType.Get_DataFatturaPrincipale: UnicodeString;
begin
  Result := ChildNodes['DataFatturaPrincipale'].Text;
end;

procedure TXMLFatturaPrincipaleType.Set_DataFatturaPrincipale(Value: UnicodeString);
begin
  ChildNodes['DataFatturaPrincipale'].NodeValue := Value;
end;

{ TXMLDatiBeniServiziType }

procedure TXMLDatiBeniServiziType.AfterConstruction;
begin
  RegisterChildNode('DettaglioLinee', TXMLDettaglioLineeType);
  RegisterChildNode('DatiRiepilogo', TXMLDatiRiepilogoType);
  FDettaglioLinee := CreateCollection(TXMLDettaglioLineeTypeList, IXMLDettaglioLineeType, 'DettaglioLinee') as IXMLDettaglioLineeTypeList;
  FDatiRiepilogo := CreateCollection(TXMLDatiRiepilogoTypeList, IXMLDatiRiepilogoType, 'DatiRiepilogo') as IXMLDatiRiepilogoTypeList;
  inherited;
end;

function TXMLDatiBeniServiziType.Get_DettaglioLinee: IXMLDettaglioLineeTypeList;
begin
  Result := FDettaglioLinee;
end;

function TXMLDatiBeniServiziType.Get_DatiRiepilogo: IXMLDatiRiepilogoTypeList;
begin
  Result := FDatiRiepilogo;
end;

{ TXMLDettaglioLineeType }

procedure TXMLDettaglioLineeType.AfterConstruction;
begin
  RegisterChildNode('CodiceArticolo', TXMLCodiceArticoloType);
  RegisterChildNode('ScontoMaggiorazione', TXMLScontoMaggiorazioneType);
  RegisterChildNode('AltriDatiGestionali', TXMLAltriDatiGestionaliType);
  FCodiceArticolo := CreateCollection(TXMLCodiceArticoloTypeList, IXMLCodiceArticoloType, 'CodiceArticolo') as IXMLCodiceArticoloTypeList;
  FScontoMaggiorazione := CreateCollection(TXMLScontoMaggiorazioneTypeList, IXMLScontoMaggiorazioneType, 'ScontoMaggiorazione') as IXMLScontoMaggiorazioneTypeList;
  FAltriDatiGestionali := CreateCollection(TXMLAltriDatiGestionaliTypeList, IXMLAltriDatiGestionaliType, 'AltriDatiGestionali') as IXMLAltriDatiGestionaliTypeList;
  inherited;
end;

function TXMLDettaglioLineeType.Get_NumeroLinea: Integer;
begin
  Result := ChildNodes['NumeroLinea'].NodeValue;
end;

procedure TXMLDettaglioLineeType.Set_NumeroLinea(Value: Integer);
begin
  ChildNodes['NumeroLinea'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_TipoCessionePrestazione: UnicodeString;
begin
  Result := ChildNodes['TipoCessionePrestazione'].Text;
end;

procedure TXMLDettaglioLineeType.Set_TipoCessionePrestazione(Value: UnicodeString);
begin
  ChildNodes['TipoCessionePrestazione'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_CodiceArticolo: IXMLCodiceArticoloTypeList;
begin
  Result := FCodiceArticolo;
end;

function TXMLDettaglioLineeType.Get_Descrizione: UnicodeString;
begin
  Result := ChildNodes['Descrizione'].Text;
end;

procedure TXMLDettaglioLineeType.Set_Descrizione(Value: UnicodeString);
begin
  ChildNodes['Descrizione'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_Quantita: UnicodeString;
begin
  Result := ChildNodes['Quantita'].Text;
end;

procedure TXMLDettaglioLineeType.Set_Quantita(Value: UnicodeString);
begin
  ChildNodes['Quantita'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_UnitaMisura: UnicodeString;
begin
  Result := ChildNodes['UnitaMisura'].Text;
end;

procedure TXMLDettaglioLineeType.Set_UnitaMisura(Value: UnicodeString);
begin
  ChildNodes['UnitaMisura'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_DataInizioPeriodo: UnicodeString;
begin
  Result := ChildNodes['DataInizioPeriodo'].Text;
end;

procedure TXMLDettaglioLineeType.Set_DataInizioPeriodo(Value: UnicodeString);
begin
  ChildNodes['DataInizioPeriodo'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_DataFinePeriodo: UnicodeString;
begin
  Result := ChildNodes['DataFinePeriodo'].Text;
end;

procedure TXMLDettaglioLineeType.Set_DataFinePeriodo(Value: UnicodeString);
begin
  ChildNodes['DataFinePeriodo'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_PrezzoUnitario: UnicodeString;
begin
  Result := ChildNodes['PrezzoUnitario'].Text;
end;

procedure TXMLDettaglioLineeType.Set_PrezzoUnitario(Value: UnicodeString);
begin
  ChildNodes['PrezzoUnitario'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_ScontoMaggiorazione: IXMLScontoMaggiorazioneTypeList;
begin
  Result := FScontoMaggiorazione;
end;

function TXMLDettaglioLineeType.Get_PrezzoTotale: UnicodeString;
begin
  Result := ChildNodes['PrezzoTotale'].Text;
end;

procedure TXMLDettaglioLineeType.Set_PrezzoTotale(Value: UnicodeString);
begin
  ChildNodes['PrezzoTotale'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_AliquotaIVA: UnicodeString;
begin
  Result := ChildNodes['AliquotaIVA'].Text;
end;

procedure TXMLDettaglioLineeType.Set_AliquotaIVA(Value: UnicodeString);
begin
  ChildNodes['AliquotaIVA'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_Ritenuta: UnicodeString;
begin
  Result := ChildNodes['Ritenuta'].Text;
end;

procedure TXMLDettaglioLineeType.Set_Ritenuta(Value: UnicodeString);
begin
  ChildNodes['Ritenuta'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_Natura: UnicodeString;
begin
  Result := ChildNodes['Natura'].Text;
end;

procedure TXMLDettaglioLineeType.Set_Natura(Value: UnicodeString);
begin
  ChildNodes['Natura'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_RiferimentoAmministrazione: UnicodeString;
begin
  Result := ChildNodes['RiferimentoAmministrazione'].Text;
end;

procedure TXMLDettaglioLineeType.Set_RiferimentoAmministrazione(Value: UnicodeString);
begin
  ChildNodes['RiferimentoAmministrazione'].NodeValue := Value;
end;

function TXMLDettaglioLineeType.Get_AltriDatiGestionali: IXMLAltriDatiGestionaliTypeList;
begin
  Result := FAltriDatiGestionali;
end;

{ TXMLDettaglioLineeTypeList }

function TXMLDettaglioLineeTypeList.Add: IXMLDettaglioLineeType;
begin
  Result := AddItem(-1) as IXMLDettaglioLineeType;
end;

function TXMLDettaglioLineeTypeList.Insert(const Index: Integer): IXMLDettaglioLineeType;
begin
  Result := AddItem(Index) as IXMLDettaglioLineeType;
end;

function TXMLDettaglioLineeTypeList.Get_Item(Index: Integer): IXMLDettaglioLineeType;
begin
  Result := List[Index] as IXMLDettaglioLineeType;
end;

{ TXMLCodiceArticoloType }

function TXMLCodiceArticoloType.Get_CodiceTipo: UnicodeString;
begin
  Result := ChildNodes['CodiceTipo'].Text;
end;

procedure TXMLCodiceArticoloType.Set_CodiceTipo(Value: UnicodeString);
begin
  ChildNodes['CodiceTipo'].NodeValue := Value;
end;

function TXMLCodiceArticoloType.Get_CodiceValore: UnicodeString;
begin
  Result := ChildNodes['CodiceValore'].Text;
end;

procedure TXMLCodiceArticoloType.Set_CodiceValore(Value: UnicodeString);
begin
  ChildNodes['CodiceValore'].NodeValue := Value;
end;

{ TXMLCodiceArticoloTypeList }

function TXMLCodiceArticoloTypeList.Add: IXMLCodiceArticoloType;
begin
  Result := AddItem(-1) as IXMLCodiceArticoloType;
end;

function TXMLCodiceArticoloTypeList.Insert(const Index: Integer): IXMLCodiceArticoloType;
begin
  Result := AddItem(Index) as IXMLCodiceArticoloType;
end;

function TXMLCodiceArticoloTypeList.Get_Item(Index: Integer): IXMLCodiceArticoloType;
begin
  Result := List[Index] as IXMLCodiceArticoloType;
end;

{ TXMLAltriDatiGestionaliType }

function TXMLAltriDatiGestionaliType.Get_TipoDato: UnicodeString;
begin
  Result := ChildNodes['TipoDato'].Text;
end;

procedure TXMLAltriDatiGestionaliType.Set_TipoDato(Value: UnicodeString);
begin
  ChildNodes['TipoDato'].NodeValue := Value;
end;

function TXMLAltriDatiGestionaliType.Get_RiferimentoTesto: UnicodeString;
begin
  Result := ChildNodes['RiferimentoTesto'].Text;
end;

procedure TXMLAltriDatiGestionaliType.Set_RiferimentoTesto(Value: UnicodeString);
begin
  ChildNodes['RiferimentoTesto'].NodeValue := Value;
end;

function TXMLAltriDatiGestionaliType.Get_RiferimentoNumero: UnicodeString;
begin
  Result := ChildNodes['RiferimentoNumero'].Text;
end;

procedure TXMLAltriDatiGestionaliType.Set_RiferimentoNumero(Value: UnicodeString);
begin
  ChildNodes['RiferimentoNumero'].NodeValue := Value;
end;

function TXMLAltriDatiGestionaliType.Get_RiferimentoData: UnicodeString;
begin
  Result := ChildNodes['RiferimentoData'].Text;
end;

procedure TXMLAltriDatiGestionaliType.Set_RiferimentoData(Value: UnicodeString);
begin
  ChildNodes['RiferimentoData'].NodeValue := Value;
end;

{ TXMLAltriDatiGestionaliTypeList }

function TXMLAltriDatiGestionaliTypeList.Add: IXMLAltriDatiGestionaliType;
begin
  Result := AddItem(-1) as IXMLAltriDatiGestionaliType;
end;

function TXMLAltriDatiGestionaliTypeList.Insert(const Index: Integer): IXMLAltriDatiGestionaliType;
begin
  Result := AddItem(Index) as IXMLAltriDatiGestionaliType;
end;

function TXMLAltriDatiGestionaliTypeList.Get_Item(Index: Integer): IXMLAltriDatiGestionaliType;
begin
  Result := List[Index] as IXMLAltriDatiGestionaliType;
end;

{ TXMLDatiRiepilogoType }

function TXMLDatiRiepilogoType.Get_AliquotaIVA: UnicodeString;
begin
  Result := ChildNodes['AliquotaIVA'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_AliquotaIVA(Value: UnicodeString);
begin
  ChildNodes['AliquotaIVA'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_Natura: UnicodeString;
begin
  Result := ChildNodes['Natura'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_Natura(Value: UnicodeString);
begin
  ChildNodes['Natura'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_SpeseAccessorie: UnicodeString;
begin
  Result := ChildNodes['SpeseAccessorie'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_SpeseAccessorie(Value: UnicodeString);
begin
  ChildNodes['SpeseAccessorie'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_Arrotondamento: UnicodeString;
begin
  Result := ChildNodes['Arrotondamento'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_Arrotondamento(Value: UnicodeString);
begin
  ChildNodes['Arrotondamento'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_ImponibileImporto: UnicodeString;
begin
  Result := ChildNodes['ImponibileImporto'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_ImponibileImporto(Value: UnicodeString);
begin
  ChildNodes['ImponibileImporto'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_Imposta: UnicodeString;
begin
  Result := ChildNodes['Imposta'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_Imposta(Value: UnicodeString);
begin
  ChildNodes['Imposta'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_EsigibilitaIVA: UnicodeString;
begin
  Result := ChildNodes['EsigibilitaIVA'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_EsigibilitaIVA(Value: UnicodeString);
begin
  ChildNodes['EsigibilitaIVA'].NodeValue := Value;
end;

function TXMLDatiRiepilogoType.Get_RiferimentoNormativo: UnicodeString;
begin
  Result := ChildNodes['RiferimentoNormativo'].Text;
end;

procedure TXMLDatiRiepilogoType.Set_RiferimentoNormativo(Value: UnicodeString);
begin
  ChildNodes['RiferimentoNormativo'].NodeValue := Value;
end;

{ TXMLDatiRiepilogoTypeList }

function TXMLDatiRiepilogoTypeList.Add: IXMLDatiRiepilogoType;
begin
  Result := AddItem(-1) as IXMLDatiRiepilogoType;
end;

function TXMLDatiRiepilogoTypeList.Insert(const Index: Integer): IXMLDatiRiepilogoType;
begin
  Result := AddItem(Index) as IXMLDatiRiepilogoType;
end;

function TXMLDatiRiepilogoTypeList.Get_Item(Index: Integer): IXMLDatiRiepilogoType;
begin
  Result := List[Index] as IXMLDatiRiepilogoType;
end;

{ TXMLDatiVeicoliType }

function TXMLDatiVeicoliType.Get_Data: UnicodeString;
begin
  Result := ChildNodes['Data'].Text;
end;

procedure TXMLDatiVeicoliType.Set_Data(Value: UnicodeString);
begin
  ChildNodes['Data'].NodeValue := Value;
end;

function TXMLDatiVeicoliType.Get_TotalePercorso: UnicodeString;
begin
  Result := ChildNodes['TotalePercorso'].Text;
end;

procedure TXMLDatiVeicoliType.Set_TotalePercorso(Value: UnicodeString);
begin
  ChildNodes['TotalePercorso'].NodeValue := Value;
end;

{ TXMLDatiPagamentoType }

procedure TXMLDatiPagamentoType.AfterConstruction;
begin
  RegisterChildNode('DettaglioPagamento', TXMLDettaglioPagamentoType);
  FDettaglioPagamento := CreateCollection(TXMLDettaglioPagamentoTypeList, IXMLDettaglioPagamentoType, 'DettaglioPagamento') as IXMLDettaglioPagamentoTypeList;
  inherited;
end;

function TXMLDatiPagamentoType.Get_CondizioniPagamento: UnicodeString;
begin
  Result := ChildNodes['CondizioniPagamento'].Text;
end;

procedure TXMLDatiPagamentoType.Set_CondizioniPagamento(Value: UnicodeString);
begin
  ChildNodes['CondizioniPagamento'].NodeValue := Value;
end;

function TXMLDatiPagamentoType.Get_DettaglioPagamento: IXMLDettaglioPagamentoTypeList;
begin
  Result := FDettaglioPagamento;
end;

{ TXMLDatiPagamentoTypeList }

function TXMLDatiPagamentoTypeList.Add: IXMLDatiPagamentoType;
begin
  Result := AddItem(-1) as IXMLDatiPagamentoType;
end;

function TXMLDatiPagamentoTypeList.Insert(const Index: Integer): IXMLDatiPagamentoType;
begin
  Result := AddItem(Index) as IXMLDatiPagamentoType;
end;

function TXMLDatiPagamentoTypeList.Get_Item(Index: Integer): IXMLDatiPagamentoType;
begin
  Result := List[Index] as IXMLDatiPagamentoType;
end;

{ TXMLDettaglioPagamentoType }

function TXMLDettaglioPagamentoType.Get_Beneficiario: UnicodeString;
begin
  Result := ChildNodes['Beneficiario'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_Beneficiario(Value: UnicodeString);
begin
  ChildNodes['Beneficiario'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_ModalitaPagamento: UnicodeString;
begin
  Result := ChildNodes['ModalitaPagamento'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_ModalitaPagamento(Value: UnicodeString);
begin
  ChildNodes['ModalitaPagamento'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_DataRiferimentoTerminiPagamento: UnicodeString;
begin
  Result := ChildNodes['DataRiferimentoTerminiPagamento'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_DataRiferimentoTerminiPagamento(Value: UnicodeString);
begin
  ChildNodes['DataRiferimentoTerminiPagamento'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_GiorniTerminiPagamento: Integer;
begin
  Result := ChildNodes['GiorniTerminiPagamento'].NodeValue;
end;

procedure TXMLDettaglioPagamentoType.Set_GiorniTerminiPagamento(Value: Integer);
begin
  ChildNodes['GiorniTerminiPagamento'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_DataScadenzaPagamento: UnicodeString;
begin
  Result := ChildNodes['DataScadenzaPagamento'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_DataScadenzaPagamento(Value: UnicodeString);
begin
  ChildNodes['DataScadenzaPagamento'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_ImportoPagamento: UnicodeString;
begin
  Result := ChildNodes['ImportoPagamento'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_ImportoPagamento(Value: UnicodeString);
begin
  ChildNodes['ImportoPagamento'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_CodUfficioPostale: UnicodeString;
begin
  Result := ChildNodes['CodUfficioPostale'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_CodUfficioPostale(Value: UnicodeString);
begin
  ChildNodes['CodUfficioPostale'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_CognomeQuietanzante: UnicodeString;
begin
  Result := ChildNodes['CognomeQuietanzante'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_CognomeQuietanzante(Value: UnicodeString);
begin
  ChildNodes['CognomeQuietanzante'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_NomeQuietanzante: UnicodeString;
begin
  Result := ChildNodes['NomeQuietanzante'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_NomeQuietanzante(Value: UnicodeString);
begin
  ChildNodes['NomeQuietanzante'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_CFQuietanzante: UnicodeString;
begin
  Result := ChildNodes['CFQuietanzante'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_CFQuietanzante(Value: UnicodeString);
begin
  ChildNodes['CFQuietanzante'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_TitoloQuietanzante: UnicodeString;
begin
  Result := ChildNodes['TitoloQuietanzante'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_TitoloQuietanzante(Value: UnicodeString);
begin
  ChildNodes['TitoloQuietanzante'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_IstitutoFinanziario: UnicodeString;
begin
  Result := ChildNodes['IstitutoFinanziario'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_IstitutoFinanziario(Value: UnicodeString);
begin
  ChildNodes['IstitutoFinanziario'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_IBAN: UnicodeString;
begin
  Result := ChildNodes['IBAN'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_IBAN(Value: UnicodeString);
begin
  ChildNodes['IBAN'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_ABI: UnicodeString;
begin
  Result := ChildNodes['ABI'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_ABI(Value: UnicodeString);
begin
  ChildNodes['ABI'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_CAB: UnicodeString;
begin
  Result := ChildNodes['CAB'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_CAB(Value: UnicodeString);
begin
  ChildNodes['CAB'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_BIC: UnicodeString;
begin
  Result := ChildNodes['BIC'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_BIC(Value: UnicodeString);
begin
  ChildNodes['BIC'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_ScontoPagamentoAnticipato: UnicodeString;
begin
  Result := ChildNodes['ScontoPagamentoAnticipato'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_ScontoPagamentoAnticipato(Value: UnicodeString);
begin
  ChildNodes['ScontoPagamentoAnticipato'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_DataLimitePagamentoAnticipato: UnicodeString;
begin
  Result := ChildNodes['DataLimitePagamentoAnticipato'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_DataLimitePagamentoAnticipato(Value: UnicodeString);
begin
  ChildNodes['DataLimitePagamentoAnticipato'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_PenalitaPagamentiRitardati: UnicodeString;
begin
  Result := ChildNodes['PenalitaPagamentiRitardati'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_PenalitaPagamentiRitardati(Value: UnicodeString);
begin
  ChildNodes['PenalitaPagamentiRitardati'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_DataDecorrenzaPenale: UnicodeString;
begin
  Result := ChildNodes['DataDecorrenzaPenale'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_DataDecorrenzaPenale(Value: UnicodeString);
begin
  ChildNodes['DataDecorrenzaPenale'].NodeValue := Value;
end;

function TXMLDettaglioPagamentoType.Get_CodicePagamento: UnicodeString;
begin
  Result := ChildNodes['CodicePagamento'].Text;
end;

procedure TXMLDettaglioPagamentoType.Set_CodicePagamento(Value: UnicodeString);
begin
  ChildNodes['CodicePagamento'].NodeValue := Value;
end;

{ TXMLDettaglioPagamentoTypeList }

function TXMLDettaglioPagamentoTypeList.Add: IXMLDettaglioPagamentoType;
begin
  Result := AddItem(-1) as IXMLDettaglioPagamentoType;
end;

function TXMLDettaglioPagamentoTypeList.Insert(const Index: Integer): IXMLDettaglioPagamentoType;
begin
  Result := AddItem(Index) as IXMLDettaglioPagamentoType;
end;

function TXMLDettaglioPagamentoTypeList.Get_Item(Index: Integer): IXMLDettaglioPagamentoType;
begin
  Result := List[Index] as IXMLDettaglioPagamentoType;
end;

{ TXMLAllegatiType }

function TXMLAllegatiType.Get_NomeAttachment: UnicodeString;
begin
  Result := ChildNodes['NomeAttachment'].Text;
end;

procedure TXMLAllegatiType.Set_NomeAttachment(Value: UnicodeString);
begin
  ChildNodes['NomeAttachment'].NodeValue := Value;
end;

function TXMLAllegatiType.Get_AlgoritmoCompressione: UnicodeString;
begin
  Result := ChildNodes['AlgoritmoCompressione'].Text;
end;

procedure TXMLAllegatiType.Set_AlgoritmoCompressione(Value: UnicodeString);
begin
  ChildNodes['AlgoritmoCompressione'].NodeValue := Value;
end;

function TXMLAllegatiType.Get_FormatoAttachment: UnicodeString;
begin
  Result := ChildNodes['FormatoAttachment'].Text;
end;

procedure TXMLAllegatiType.Set_FormatoAttachment(Value: UnicodeString);
begin
  ChildNodes['FormatoAttachment'].NodeValue := Value;
end;

function TXMLAllegatiType.Get_DescrizioneAttachment: UnicodeString;
begin
  Result := ChildNodes['DescrizioneAttachment'].Text;
end;

procedure TXMLAllegatiType.Set_DescrizioneAttachment(Value: UnicodeString);
begin
  ChildNodes['DescrizioneAttachment'].NodeValue := Value;
end;

function TXMLAllegatiType.Get_Attachment: UnicodeString;
begin
  Result := ChildNodes['Attachment'].Text;
end;

procedure TXMLAllegatiType.Set_Attachment(Value: UnicodeString);
begin
  ChildNodes['Attachment'].NodeValue := Value;
end;

{ TXMLAllegatiTypeList }

function TXMLAllegatiTypeList.Add: IXMLAllegatiType;
begin
  Result := AddItem(-1) as IXMLAllegatiType;
end;

function TXMLAllegatiTypeList.Insert(const Index: Integer): IXMLAllegatiType;
begin
  Result := AddItem(Index) as IXMLAllegatiType;
end;

function TXMLAllegatiTypeList.Get_Item(Index: Integer): IXMLAllegatiType;
begin
  Result := List[Index] as IXMLAllegatiType;
end;

{ TXMLSignatureType_ds }

procedure TXMLSignatureType_ds.AfterConstruction;
begin
  RegisterChildNode('SignedInfo', TXMLSignedInfoType_ds);
  RegisterChildNode('SignatureValue', TXMLSignatureValueType_ds);
  RegisterChildNode('KeyInfo', TXMLKeyInfoType_ds);
  RegisterChildNode('Object', TXMLObjectType_ds);
  FObject_ := CreateCollection(TXMLObjectType_dsList, IXMLObjectType_ds, 'Object') as IXMLObjectType_dsList;
  inherited;
end;

function TXMLSignatureType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignatureType_ds.Get_SignedInfo: IXMLSignedInfoType_ds;
begin
  Result := ChildNodes['SignedInfo'] as IXMLSignedInfoType_ds;
end;

function TXMLSignatureType_ds.Get_SignatureValue: IXMLSignatureValueType_ds;
begin
  Result := ChildNodes['SignatureValue'] as IXMLSignatureValueType_ds;
end;

function TXMLSignatureType_ds.Get_KeyInfo: IXMLKeyInfoType_ds;
begin
  Result := ChildNodes['KeyInfo'] as IXMLKeyInfoType_ds;
end;

function TXMLSignatureType_ds.Get_Object_: IXMLObjectType_dsList;
begin
  Result := FObject_;
end;

{ TXMLSignedInfoType_ds }

procedure TXMLSignedInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('CanonicalizationMethod', TXMLCanonicalizationMethodType_ds);
  RegisterChildNode('SignatureMethod', TXMLSignatureMethodType_ds);
  RegisterChildNode('Reference', TXMLReferenceType_ds);
  FReference := CreateCollection(TXMLReferenceType_dsList, IXMLReferenceType_ds, 'Reference') as IXMLReferenceType_dsList;
  inherited;
end;

function TXMLSignedInfoType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignedInfoType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLSignedInfoType_ds.Get_CanonicalizationMethod: IXMLCanonicalizationMethodType_ds;
begin
  Result := ChildNodes['CanonicalizationMethod'] as IXMLCanonicalizationMethodType_ds;
end;

function TXMLSignedInfoType_ds.Get_SignatureMethod: IXMLSignatureMethodType_ds;
begin
  Result := ChildNodes['SignatureMethod'] as IXMLSignatureMethodType_ds;
end;

function TXMLSignedInfoType_ds.Get_Reference: IXMLReferenceType_dsList;
begin
  Result := FReference;
end;

{ TXMLCanonicalizationMethodType_ds }

function TXMLCanonicalizationMethodType_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLCanonicalizationMethodType_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureMethodType_ds }

function TXMLSignatureMethodType_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLSignatureMethodType_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLSignatureMethodType_ds.Get_HMACOutputLength: Integer;
begin
  Result := ChildNodes['HMACOutputLength'].NodeValue;
end;

procedure TXMLSignatureMethodType_ds.Set_HMACOutputLength(Value: Integer);
begin
  ChildNodes['HMACOutputLength'].NodeValue := Value;
end;

{ TXMLReferenceType_ds }

procedure TXMLReferenceType_ds.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType_ds);
  RegisterChildNode('DigestMethod', TXMLDigestMethodType_ds);
  inherited;
end;

function TXMLReferenceType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLReferenceType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLReferenceType_ds.Get_URI: UnicodeString;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLReferenceType_ds.Set_URI(Value: UnicodeString);
begin
  SetAttribute('URI', Value);
end;

function TXMLReferenceType_ds.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLReferenceType_ds.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLReferenceType_ds.Get_Transforms: IXMLTransformsType_ds;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType_ds;
end;

function TXMLReferenceType_ds.Get_DigestMethod: IXMLDigestMethodType_ds;
begin
  Result := ChildNodes['DigestMethod'] as IXMLDigestMethodType_ds;
end;

function TXMLReferenceType_ds.Get_DigestValue: UnicodeString;
begin
  Result := ChildNodes['DigestValue'].Text;
end;

procedure TXMLReferenceType_ds.Set_DigestValue(Value: UnicodeString);
begin
  ChildNodes['DigestValue'].NodeValue := Value;
end;

{ TXMLReferenceType_dsList }

function TXMLReferenceType_dsList.Add: IXMLReferenceType_ds;
begin
  Result := AddItem(-1) as IXMLReferenceType_ds;
end;

function TXMLReferenceType_dsList.Insert(const Index: Integer): IXMLReferenceType_ds;
begin
  Result := AddItem(Index) as IXMLReferenceType_ds;
end;

function TXMLReferenceType_dsList.Get_Item(Index: Integer): IXMLReferenceType_ds;
begin
  Result := List[Index] as IXMLReferenceType_ds;
end;

{ TXMLTransformsType_ds }

procedure TXMLTransformsType_ds.AfterConstruction;
begin
  RegisterChildNode('Transform', TXMLTransformType_ds);
  ItemTag := 'Transform';
  ItemInterface := IXMLTransformType_ds;
  inherited;
end;

function TXMLTransformsType_ds.Get_Transform(Index: Integer): IXMLTransformType_ds;
begin
  Result := List[Index] as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Add: IXMLTransformType_ds;
begin
  Result := AddItem(-1) as IXMLTransformType_ds;
end;

function TXMLTransformsType_ds.Insert(const Index: Integer): IXMLTransformType_ds;
begin
  Result := AddItem(Index) as IXMLTransformType_ds;
end;

{ TXMLTransformType_ds }

procedure TXMLTransformType_ds.AfterConstruction;
begin
  ItemTag := 'XPath';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLTransformType_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLTransformType_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

function TXMLTransformType_ds.Get_XPath(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLTransformType_ds.Add(const XPath: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := XPath;
end;

function TXMLTransformType_ds.Insert(const Index: Integer; const XPath: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := XPath;
end;

{ TXMLDigestMethodType_ds }

function TXMLDigestMethodType_ds.Get_Algorithm: UnicodeString;
begin
  Result := AttributeNodes['Algorithm'].Text;
end;

procedure TXMLDigestMethodType_ds.Set_Algorithm(Value: UnicodeString);
begin
  SetAttribute('Algorithm', Value);
end;

{ TXMLSignatureValueType_ds }

function TXMLSignatureValueType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLSignatureValueType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

{ TXMLKeyInfoType_ds }

procedure TXMLKeyInfoType_ds.AfterConstruction;
begin
  RegisterChildNode('KeyValue', TXMLKeyValueType_ds);
  RegisterChildNode('RetrievalMethod', TXMLRetrievalMethodType_ds);
  RegisterChildNode('X509Data', TXMLX509DataType_ds);
  RegisterChildNode('PGPData', TXMLPGPDataType_ds);
  RegisterChildNode('SPKIData', TXMLSPKIDataType_ds);
  FKeyName := CreateCollection(TXMLString_List, IXMLNode, 'KeyName') as IXMLString_List;
  FKeyValue := CreateCollection(TXMLKeyValueType_dsList, IXMLKeyValueType_ds, 'KeyValue') as IXMLKeyValueType_dsList;
  FRetrievalMethod := CreateCollection(TXMLRetrievalMethodType_dsList, IXMLRetrievalMethodType_ds, 'RetrievalMethod') as IXMLRetrievalMethodType_dsList;
  FX509Data := CreateCollection(TXMLX509DataType_dsList, IXMLX509DataType_ds, 'X509Data') as IXMLX509DataType_dsList;
  FPGPData := CreateCollection(TXMLPGPDataType_dsList, IXMLPGPDataType_ds, 'PGPData') as IXMLPGPDataType_dsList;
  FSPKIData := CreateCollection(TXMLSPKIDataType_dsList, IXMLSPKIDataType_ds, 'SPKIData') as IXMLSPKIDataType_dsList;
  FMgmtData := CreateCollection(TXMLString_List, IXMLNode, 'MgmtData') as IXMLString_List;
  inherited;
end;

function TXMLKeyInfoType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLKeyInfoType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLKeyInfoType_ds.Get_KeyName: IXMLString_List;
begin
  Result := FKeyName;
end;

function TXMLKeyInfoType_ds.Get_KeyValue: IXMLKeyValueType_dsList;
begin
  Result := FKeyValue;
end;

function TXMLKeyInfoType_ds.Get_RetrievalMethod: IXMLRetrievalMethodType_dsList;
begin
  Result := FRetrievalMethod;
end;

function TXMLKeyInfoType_ds.Get_X509Data: IXMLX509DataType_dsList;
begin
  Result := FX509Data;
end;

function TXMLKeyInfoType_ds.Get_PGPData: IXMLPGPDataType_dsList;
begin
  Result := FPGPData;
end;

function TXMLKeyInfoType_ds.Get_SPKIData: IXMLSPKIDataType_dsList;
begin
  Result := FSPKIData;
end;

function TXMLKeyInfoType_ds.Get_MgmtData: IXMLString_List;
begin
  Result := FMgmtData;
end;

{ TXMLKeyValueType_ds }

procedure TXMLKeyValueType_ds.AfterConstruction;
begin
  RegisterChildNode('DSAKeyValue', TXMLDSAKeyValueType_ds);
  RegisterChildNode('RSAKeyValue', TXMLRSAKeyValueType_ds);
  inherited;
end;

function TXMLKeyValueType_ds.Get_DSAKeyValue: IXMLDSAKeyValueType_ds;
begin
  Result := ChildNodes['DSAKeyValue'] as IXMLDSAKeyValueType_ds;
end;

function TXMLKeyValueType_ds.Get_RSAKeyValue: IXMLRSAKeyValueType_ds;
begin
  Result := ChildNodes['RSAKeyValue'] as IXMLRSAKeyValueType_ds;
end;

{ TXMLKeyValueType_dsList }

function TXMLKeyValueType_dsList.Add: IXMLKeyValueType_ds;
begin
  Result := AddItem(-1) as IXMLKeyValueType_ds;
end;

function TXMLKeyValueType_dsList.Insert(const Index: Integer): IXMLKeyValueType_ds;
begin
  Result := AddItem(Index) as IXMLKeyValueType_ds;
end;

function TXMLKeyValueType_dsList.Get_Item(Index: Integer): IXMLKeyValueType_ds;
begin
  Result := List[Index] as IXMLKeyValueType_ds;
end;

{ TXMLDSAKeyValueType_ds }

function TXMLDSAKeyValueType_ds.Get_P: UnicodeString;
begin
  Result := ChildNodes[WideString('P')].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_P(Value: UnicodeString);
begin
  ChildNodes[WideString('P')].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_Q: UnicodeString;
begin
  Result := ChildNodes[WideString('Q')].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_Q(Value: UnicodeString);
begin
  ChildNodes[WideString('Q')].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_G: UnicodeString;
begin
  Result := ChildNodes[WideString('G')].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_G(Value: UnicodeString);
begin
  ChildNodes[WideString('G')].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_Y: UnicodeString;
begin
  Result := ChildNodes[WideString('Y')].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_Y(Value: UnicodeString);
begin
  ChildNodes[WideString('Y')].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_J: UnicodeString;
begin
  Result := ChildNodes[WideString('J')].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_J(Value: UnicodeString);
begin
  ChildNodes[WideString('J')].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_Seed: UnicodeString;
begin
  Result := ChildNodes['Seed'].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_Seed(Value: UnicodeString);
begin
  ChildNodes['Seed'].NodeValue := Value;
end;

function TXMLDSAKeyValueType_ds.Get_PgenCounter: UnicodeString;
begin
  Result := ChildNodes['PgenCounter'].Text;
end;

procedure TXMLDSAKeyValueType_ds.Set_PgenCounter(Value: UnicodeString);
begin
  ChildNodes['PgenCounter'].NodeValue := Value;
end;

{ TXMLRSAKeyValueType_ds }

function TXMLRSAKeyValueType_ds.Get_Modulus: UnicodeString;
begin
  Result := ChildNodes['Modulus'].Text;
end;

procedure TXMLRSAKeyValueType_ds.Set_Modulus(Value: UnicodeString);
begin
  ChildNodes['Modulus'].NodeValue := Value;
end;

function TXMLRSAKeyValueType_ds.Get_Exponent: UnicodeString;
begin
  Result := ChildNodes['Exponent'].Text;
end;

procedure TXMLRSAKeyValueType_ds.Set_Exponent(Value: UnicodeString);
begin
  ChildNodes['Exponent'].NodeValue := Value;
end;

{ TXMLRetrievalMethodType_ds }

procedure TXMLRetrievalMethodType_ds.AfterConstruction;
begin
  RegisterChildNode('Transforms', TXMLTransformsType_ds);
  inherited;
end;

function TXMLRetrievalMethodType_ds.Get_URI: UnicodeString;
begin
  Result := AttributeNodes['URI'].Text;
end;

procedure TXMLRetrievalMethodType_ds.Set_URI(Value: UnicodeString);
begin
  SetAttribute('URI', Value);
end;

function TXMLRetrievalMethodType_ds.Get_Type_: UnicodeString;
begin
  Result := AttributeNodes['Type'].Text;
end;

procedure TXMLRetrievalMethodType_ds.Set_Type_(Value: UnicodeString);
begin
  SetAttribute('Type', Value);
end;

function TXMLRetrievalMethodType_ds.Get_Transforms: IXMLTransformsType_ds;
begin
  Result := ChildNodes['Transforms'] as IXMLTransformsType_ds;
end;

{ TXMLRetrievalMethodType_dsList }

function TXMLRetrievalMethodType_dsList.Add: IXMLRetrievalMethodType_ds;
begin
  Result := AddItem(-1) as IXMLRetrievalMethodType_ds;
end;

function TXMLRetrievalMethodType_dsList.Insert(const Index: Integer): IXMLRetrievalMethodType_ds;
begin
  Result := AddItem(Index) as IXMLRetrievalMethodType_ds;
end;

function TXMLRetrievalMethodType_dsList.Get_Item(Index: Integer): IXMLRetrievalMethodType_ds;
begin
  Result := List[Index] as IXMLRetrievalMethodType_ds;
end;

{ TXMLX509DataType_ds }

procedure TXMLX509DataType_ds.AfterConstruction;
begin
  RegisterChildNode('X509IssuerSerial', TXMLX509IssuerSerialType_ds);
  FX509IssuerSerial := CreateCollection(TXMLX509IssuerSerialType_dsList, IXMLX509IssuerSerialType_ds, 'X509IssuerSerial') as IXMLX509IssuerSerialType_dsList;
  FX509SKI := CreateCollection(TXMLBase64BinaryList, IXMLNode, 'X509SKI') as IXMLBase64BinaryList;
  FX509SubjectName := CreateCollection(TXMLString_List, IXMLNode, 'X509SubjectName') as IXMLString_List;
  FX509Certificate := CreateCollection(TXMLBase64BinaryList, IXMLNode, 'X509Certificate') as IXMLBase64BinaryList;
  FX509CRL := CreateCollection(TXMLBase64BinaryList, IXMLNode, 'X509CRL') as IXMLBase64BinaryList;
  inherited;
end;

function TXMLX509DataType_ds.Get_X509IssuerSerial: IXMLX509IssuerSerialType_dsList;
begin
  Result := FX509IssuerSerial;
end;

function TXMLX509DataType_ds.Get_X509SKI: IXMLBase64BinaryList;
begin
  Result := FX509SKI;
end;

function TXMLX509DataType_ds.Get_X509SubjectName: IXMLString_List;
begin
  Result := FX509SubjectName;
end;

function TXMLX509DataType_ds.Get_X509Certificate: IXMLBase64BinaryList;
begin
  Result := FX509Certificate;
end;

function TXMLX509DataType_ds.Get_X509CRL: IXMLBase64BinaryList;
begin
  Result := FX509CRL;
end;

{ TXMLX509DataType_dsList }

function TXMLX509DataType_dsList.Add: IXMLX509DataType_ds;
begin
  Result := AddItem(-1) as IXMLX509DataType_ds;
end;

function TXMLX509DataType_dsList.Insert(const Index: Integer): IXMLX509DataType_ds;
begin
  Result := AddItem(Index) as IXMLX509DataType_ds;
end;

function TXMLX509DataType_dsList.Get_Item(Index: Integer): IXMLX509DataType_ds;
begin
  Result := List[Index] as IXMLX509DataType_ds;
end;

{ TXMLX509IssuerSerialType_ds }

function TXMLX509IssuerSerialType_ds.Get_X509IssuerName: UnicodeString;
begin
  Result := ChildNodes['X509IssuerName'].Text;
end;

procedure TXMLX509IssuerSerialType_ds.Set_X509IssuerName(Value: UnicodeString);
begin
  ChildNodes['X509IssuerName'].NodeValue := Value;
end;

function TXMLX509IssuerSerialType_ds.Get_X509SerialNumber: Integer;
begin
  Result := ChildNodes['X509SerialNumber'].NodeValue;
end;

procedure TXMLX509IssuerSerialType_ds.Set_X509SerialNumber(Value: Integer);
begin
  ChildNodes['X509SerialNumber'].NodeValue := Value;
end;

{ TXMLX509IssuerSerialType_dsList }

function TXMLX509IssuerSerialType_dsList.Add: IXMLX509IssuerSerialType_ds;
begin
  Result := AddItem(-1) as IXMLX509IssuerSerialType_ds;
end;

function TXMLX509IssuerSerialType_dsList.Insert(const Index: Integer): IXMLX509IssuerSerialType_ds;
begin
  Result := AddItem(Index) as IXMLX509IssuerSerialType_ds;
end;

function TXMLX509IssuerSerialType_dsList.Get_Item(Index: Integer): IXMLX509IssuerSerialType_ds;
begin
  Result := List[Index] as IXMLX509IssuerSerialType_ds;
end;

{ TXMLPGPDataType_ds }

function TXMLPGPDataType_ds.Get_PGPKeyID: UnicodeString;
begin
  Result := ChildNodes['PGPKeyID'].Text;
end;

procedure TXMLPGPDataType_ds.Set_PGPKeyID(Value: UnicodeString);
begin
  ChildNodes['PGPKeyID'].NodeValue := Value;
end;

function TXMLPGPDataType_ds.Get_PGPKeyPacket: UnicodeString;
begin
  Result := ChildNodes['PGPKeyPacket'].Text;
end;

procedure TXMLPGPDataType_ds.Set_PGPKeyPacket(Value: UnicodeString);
begin
  ChildNodes['PGPKeyPacket'].NodeValue := Value;
end;

{ TXMLPGPDataType_dsList }

function TXMLPGPDataType_dsList.Add: IXMLPGPDataType_ds;
begin
  Result := AddItem(-1) as IXMLPGPDataType_ds;
end;

function TXMLPGPDataType_dsList.Insert(const Index: Integer): IXMLPGPDataType_ds;
begin
  Result := AddItem(Index) as IXMLPGPDataType_ds;
end;

function TXMLPGPDataType_dsList.Get_Item(Index: Integer): IXMLPGPDataType_ds;
begin
  Result := List[Index] as IXMLPGPDataType_ds;
end;

{ TXMLSPKIDataType_ds }

procedure TXMLSPKIDataType_ds.AfterConstruction;
begin
  ItemTag := 'SPKISexp';
  ItemInterface := IXMLNode;
  inherited;
end;

function TXMLSPKIDataType_ds.Get_SPKISexp(Index: Integer): UnicodeString;
begin
  Result := List[Index].Text;
end;

function TXMLSPKIDataType_ds.Add(const SPKISexp: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := SPKISexp;
end;

function TXMLSPKIDataType_ds.Insert(const Index: Integer; const SPKISexp: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := SPKISexp;
end;

{ TXMLSPKIDataType_dsList }

function TXMLSPKIDataType_dsList.Add: IXMLSPKIDataType_ds;
begin
  Result := AddItem(-1) as IXMLSPKIDataType_ds;
end;

function TXMLSPKIDataType_dsList.Insert(const Index: Integer): IXMLSPKIDataType_ds;
begin
  Result := AddItem(Index) as IXMLSPKIDataType_ds;
end;

function TXMLSPKIDataType_dsList.Get_Item(Index: Integer): IXMLSPKIDataType_ds;
begin
  Result := List[Index] as IXMLSPKIDataType_ds;
end;

{ TXMLObjectType_ds }

function TXMLObjectType_ds.Get_Id: UnicodeString;
begin
  Result := AttributeNodes['Id'].Text;
end;

procedure TXMLObjectType_ds.Set_Id(Value: UnicodeString);
begin
  SetAttribute('Id', Value);
end;

function TXMLObjectType_ds.Get_MimeType: UnicodeString;
begin
  Result := AttributeNodes['MimeType'].Text;
end;

procedure TXMLObjectType_ds.Set_MimeType(Value: UnicodeString);
begin
  SetAttribute('MimeType', Value);
end;

function TXMLObjectType_ds.Get_Encoding: UnicodeString;
begin
  Result := AttributeNodes['Encoding'].Text;
end;

procedure TXMLObjectType_ds.Set_Encoding(Value: UnicodeString);
begin
  SetAttribute('Encoding', Value);
end;

{ TXMLObjectType_dsList }

function TXMLObjectType_dsList.Add: IXMLObjectType_ds;
begin
  Result := AddItem(-1) as IXMLObjectType_ds;
end;

function TXMLObjectType_dsList.Insert(const Index: Integer): IXMLObjectType_ds;
begin
  Result := AddItem(Index) as IXMLObjectType_ds;
end;

function TXMLObjectType_dsList.Get_Item(Index: Integer): IXMLObjectType_ds;
begin
  Result := List[Index] as IXMLObjectType_ds;
end;

{ TXMLString200LatinTypeList }

function TXMLString200LatinTypeList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString200LatinTypeList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString200LatinTypeList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLRiferimentoNumeroLineaTypeList }

function TXMLRiferimentoNumeroLineaTypeList.Add(const Value: Integer): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLRiferimentoNumeroLineaTypeList.Insert(const Index: Integer; const Value: Integer): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLRiferimentoNumeroLineaTypeList.Get_Item(Index: Integer): Integer;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLBase64BinaryList }

function TXMLBase64BinaryList.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLBase64BinaryList.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLBase64BinaryList.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

{ TXMLString_List }

function TXMLString_List.Add(const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(-1);
  Result.NodeValue := Value;
end;

function TXMLString_List.Insert(const Index: Integer; const Value: UnicodeString): IXMLNode;
begin
  Result := AddItem(Index);
  Result.NodeValue := Value;
end;

function TXMLString_List.Get_Item(Index: Integer): UnicodeString;
begin
  Result := List[Index].NodeValue;
end;

end.