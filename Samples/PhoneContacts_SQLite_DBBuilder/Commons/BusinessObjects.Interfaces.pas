unit BusinessObjects.Interfaces;

interface

uses

{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  iORM.Containers.Interfaces,
  BusinessObjects.Base.Interfaces,
  iORM.CommonTypes;

type

  IProdItem = interface
    ['{222570A6-EC4A-4BE4-8A51-102171125DAA}']
  end;

  IProcessingCycle = interface(IBaseBO)
    ['{9A1C1BBC-3D00-44B1-A88E-1CE4FB5D3DC1}']
    procedure SetCompletato(const Value: Boolean);
    procedure SetSigla(const Value: String);
    function GetCompletato: Boolean;
    function GetSigla: String;
    procedure SetMaster_ID(const Value: Integer);
    function GetMaster_ID: Integer;
    procedure SetObjStatus(const Value: TioObjectStatus);
    function GetObjStatus: TioObjectStatus;
    property Sigla: String read GetSigla write SetSigla;
    property Completato: Boolean read GetCompletato write SetCompletato;
    property Master_ID: Integer read GetMaster_ID write SetMaster_ID;
    property ObjStatus: TioObjectStatus read GetObjStatus write SetObjStatus;
  end;

  IProcessing = interface(IBaseBO)
    ['{4F641398-672B-40BA-90D3-6C5FBB155DE2}']
    procedure SetDescription(const Value: String);
    procedure SetCode(const Value: String);
    function GetDescription: String;
    function GetCode: String;
    property Code: String read GetCode write SetCode;
    property Description: String read GetDescription write SetDescription;
  end;

  ITreatment = interface(IBaseBO)
    ['{396C4385-FC66-4F2F-BDEF-1DA2E7E6AE4F}']
    procedure SetToDo(const Value: Boolean);
    procedure SetNote(const Value: String);
    procedure SetTreatment(const Value: String);
    procedure SetMaster_ID(const Value: Integer);
    function GetToDo: Boolean;
    function GetMaster_ID: Integer;
    function GetNote: String;
    function GetTreatment: String;
    property Treatment: String read GetTreatment write SetTreatment;
    property ToDo: Boolean read GetToDo write SetToDo;
    property Note: String read GetNote write SetNote;
    property Master_ID: Integer read GetMaster_ID write SetMaster_ID;
  end;

  IBase = interface(IBaseBO)
    ['{C70DD2BA-C158-415A-9453-36B6B3B4976B}']
    procedure SetCreationDateTime(const Value: TDateTime);
    function GetCreationDateTime: TDateTime;
    procedure SetDrawing_Number(const Value: String);
    function GetDrawing_Number: String;
    property Drawing_Number: String read GetDrawing_Number write SetDrawing_Number;
    property CreationDateTime: TDateTime read GetCreationDateTime write SetCreationDateTime;
  end;

  IProductionOrderRow = interface(IBase)
    ['{26D0420B-21A6-4B8D-BC73-42A380A59E2D}']
    procedure SetMaterial_Quality(const Value: String);
    procedure SetProcessing_Cycle(const Value: IioList<IProcessingCycle>);
    procedure SetDraft(const Value: TBitmap);
    procedure SetDimensions(const Value: String);
    function GetMaterial_Quality: String;
    function GetProcessing_Cycle: IioList<IProcessingCycle>;
    function GetDraft: TBitmap;
    function GetDimensions: String;
    procedure SetTreatment_Row(const Value: String);
    function GetTreatment_Row: String;
    property Processing_Cycles: IioList<IProcessingCycle> read GetProcessing_Cycle write SetProcessing_Cycle;
    property Material_Quality: String read GetMaterial_Quality write SetMaterial_Quality;
    property Draft: TBitmap read GetDraft write SetDraft;
    property Dimensions: String read GetDimensions write SetDimensions;
    property Treatment_Row: String read GetTreatment_Row write SetTreatment_Row;
  end;

  IProductionOrderHeader = interface(IBase)
    ['{F63D8A6A-74CF-4E23-AE90-CC55FA0B36D6}']
    procedure SetProdItems(const Value: IioList<IProdItem>);
    function GetProdItems: IioList<IProdItem>;
    procedure SetCustomer(const Value: String);
    procedure SetDelivery_Date_Request(const Value: TDate);
    procedure SetOrder_Date(const Value: TDate);
    procedure SetOrder_Number(const Value: String);
    procedure SetTreatment(const Value: IioList<ITreatment>);
    function GetCustomer: String;
    function GetDelivery_Date_Request: TDate;
    function GetOrder_Date: TDate;
    function GetOrder_Number: String;
    function GetTreatment: IioList<ITreatment>;
    procedure SetFormat_Time(const Value: TTime);
    procedure SetLaser_Time(const Value: TTime);
    function GetFormat_Time: TTime;
    function GetLaser_Time: TTime;
    procedure SetCompiled_By(const Value: String);
    procedure SetDate_Of_Compilation(const Value: TDateTime);
    procedure SetDate_Of_Issue(const Value: TDateTime);
    procedure SetDelivery_Date(const Value: TDateTime);
    procedure SetRTE_Checked(const Value: String);
    function GetCompiled_By: String;
    function GetDate_Of_Compilation: TDateTime;
    function GetDate_Of_Issue: TDateTime;
    function GetDelivery_Date: TDateTime;
    function GetRTE_Checked: String;
    procedure SetDescription(const Value: String);
    function GetDescription: String;
    procedure SetCode(const Value: String);
    function GetCode: String;
    property Description: String read GetDescription write SetDescription;
    Property Code: String read GetCode write SetCode;
    property Order_Number: String read GetOrder_Number write SetOrder_Number;
    property Customer: String read GetCustomer write SetCustomer;
    property Order_Date: TDate read GetOrder_Date write SetOrder_Date;
    property Delivery_Date_Request: TDate read GetDelivery_Date_Request write SetDelivery_Date_Request;
    property Laser_Time: TTime read GetLaser_Time write SetLaser_Time;
    property Format_Time: TTime read GetFormat_Time write SetFormat_Time;
    property Date_Of_Issue: TDateTime read GetDate_Of_Issue write SetDate_Of_Issue;
    property Delivery_Date: TDateTime read GetDelivery_Date write SetDelivery_Date;
    property Compiled_By: String read GetCompiled_By write SetCompiled_By;
    property Date_Of_Compilation: TDateTime read GetDate_Of_Compilation write SetDate_Of_Compilation;
    property RTE_Checked: String read GetRTE_Checked write SetRTE_Checked;
    property ProdItems: IioList<IProdItem> read GetProdItems write SetProdItems;
    property Treatment: IioList<ITreatment> read GetTreatment write SetTreatment;

  end;

  ICommessaGestionale = interface(IBaseBO)
    ['{9637F8B7-AAB9-4536-8221-BF3AB13E5B67}']
    procedure SetAnno(const Value: Integer);
    procedure SetUnita_Misura(const Value: String);
    procedure SetCodice_Cliente(const Value: String);
    procedure SetCodice_Prodotto(const Value: String);
    procedure SetCodice_Tipo_Listino(const Value: String);
    procedure SetCommessa(const Value: String);
    procedure SetData(const Value: TDateTime);
    procedure SetData_Chiusura(const Value: TDateTime);
    procedure SetData_Consegna_Prevista(const Value: TDateTime);
    procedure SetData_Consegna_Richiesta(const Value: TDateTime);
    procedure SetData_Ordine_Cliente(const Value: TDateTime);
    procedure SetDescrizione_Prodotto(const Value: String);
    procedure SetDescrizione_Tipo_Listino(const Value: String);
    procedure SetNumero_Commessa(const Value: Integer);
    procedure SetQuantita(const Value: Single);
    procedure SetCliente(const Value: string);
    procedure SetRif_Ordine_Cliente(const Value: String);
    function GetAnno: Integer;
    function GetUnita_Misura: String;
    function GetCodice_Cliente: String;
    function GetCodice_Prodotto: String;
    function GetCodice_Tipo_Listino: String;
    function GetCommessa: String;
    function GetData: TDateTime;
    function GetData_Chiusura: TDateTime;
    function GetData_Consegna_Prevista: TDateTime;
    function GetData_Consegna_Richiesta: TDateTime;
    function GetData_Ordine_Cliente: TDateTime;
    function GetDescrizione_Prodotto: String;
    function GetDescrizione_Tipo_Listino: String;
    function GetNumero_Commessa: Integer;
    function GetQuantita: Single;
    function GetCliente: string;
    function GetRif_Ordine_Cliente: String;
    property Numero_Commessa: Integer read GetNumero_Commessa write SetNumero_Commessa;
    property Anno: Integer read GetAnno write SetAnno;
    property Data: TDateTime read GetData write SetData;
    property Codice_Cliente: String read GetCodice_Cliente write SetCodice_Cliente;
    property Cliente: string read GetCliente write SetCliente;
    property Rif_Ordine_Cliente: String read GetRif_Ordine_Cliente write SetRif_Ordine_Cliente;
    property Data_Ordine_Cliente: TDateTime read GetData_Ordine_Cliente write SetData_Ordine_Cliente;
    property Codice_Prodotto: String read GetCodice_Prodotto write SetCodice_Prodotto;
    property Descrizione_Prodotto: String read GetDescrizione_Prodotto write SetDescrizione_Prodotto;
    property Data_Consegna_Richiesta: TDateTime read GetData_Consegna_Richiesta write SetData_Consegna_Richiesta;
    property Data_Consegna_Prevista: TDateTime read GetData_Consegna_Prevista write SetData_Consegna_Prevista;
    property Unita_Misura: String read GetUnita_Misura write SetUnita_Misura;
    property Quantita: Single read GetQuantita write SetQuantita;
    property Codice_Tipo_Listino: String read GetCodice_Tipo_Listino write SetCodice_Tipo_Listino;
    property Descrizione_Tipo_Listino: String read GetDescrizione_Tipo_Listino write SetDescrizione_Tipo_Listino;
    property Data_Chiusura: TDateTime read GetData_Chiusura write SetData_Chiusura;
    property Commessa: String read GetCommessa write SetCommessa;
  end;

  ICommessaUT = interface(IBaseBO)
    ['{DE355847-8354-4806-B03C-8A68DE52C79A}']
    procedure SetDate_Prod_Start(const Value: String);
    procedure SetI_Delivery_Declared(const Value: String);
    procedure SetII_Delivery_Declared(const Value: String);
    procedure SetLaser_Program(const Value: String);
    procedure SetList_In_Production(const Value: String);
    procedure SetTechnical_Office_Availability(const Value: TDateTime);
    procedure SetTechnical_Office_Note(const Value: String);
    function GetDate_Prod_Start: String;
    function GetI_Delivery_Declared: String;
    function GetII_Delivery_Declared: String;
    function GetLaser_Program: String;
    function GetList_In_Production: String;
    function GetTechnical_Office_Availability: TDateTime;
    function GetTechnical_Office_Note: String;
    procedure SetCommessa_Gestionale_ID(const Value: Integer);
    function GetCommessa_Gestionale_ID: Integer;
    procedure SetProcessing_Cycle(const Value: IioList<IProcessingCycle>);
    function GetProcessing_Cycle: IioList<IProcessingCycle>;
    procedure SetLast_Process_Update(const Value: TDateTime);
    function GetLast_Process_Update: TDateTime;
    property Date_Prod_Start: String read GetDate_Prod_Start write SetDate_Prod_Start;
    property Laser_Program: String read GetLaser_Program write SetLaser_Program;
    property List_In_Production: String read GetList_In_Production write SetList_In_Production;
    property Technical_Office_Availability: TDateTime read GetTechnical_Office_Availability write SetTechnical_Office_Availability;
    property Technical_Office_Note: String read GetTechnical_Office_Note write SetTechnical_Office_Note;
    property I_Delivery_Declared: String read GetI_Delivery_Declared write SetI_Delivery_Declared;
    property II_Delivery_Declared: String read GetII_Delivery_Declared write SetII_Delivery_Declared;
    property Commessa_Gestionale_ID: Integer read GetCommessa_Gestionale_ID write SetCommessa_Gestionale_ID;
    property Last_Process_Update: TDateTime read GetLast_Process_Update write SetLast_Process_Update;
    property Processing_Cycle: IioList<IProcessingCycle> read GetProcessing_Cycle write SetProcessing_Cycle;
  end;

  IRicercaCommessa = interface
    ['{CE9F5E13-3003-4349-AE69-F921E5A5CCF8}']
    procedure SetCustomer(const Value: String);
    procedure SetCustomer_Order_Number(const Value: String);
    procedure SetExpected_Delivery_Date_From(const Value: TDate);
    procedure SetExpected_Delivery_Date_To(const Value: TDate);
    procedure SetExpiring_Days(const Value: Integer);
    procedure SetFrom_Date(const Value: TDate);
    procedure SetOpen(const Value: Boolean);
    procedure SetOrder_Number(const Value: String);
    procedure SetTo_Date(const Value: TDate);
    function GetCustomer: String;
    function GetCustomer_Order_Number: String;
    function GetExpected_Delivery_Date_From: TDate;
    function GetExpected_Delivery_Date_To: TDate;
    function GetExpiring_Days: Integer;
    function GetFrom_Date: TDate;
    function GetOpen: Boolean;
    function GetOrder_Number: String;
    function GetTo_Date: TDate;
    property Customer: String read GetCustomer write SetCustomer;
    property From_Date: TDate read GetFrom_Date write SetFrom_Date;
    property To_Date: TDate read GetTo_Date write SetTo_Date;
    Property Open: Boolean read GetOpen write SetOpen;
    property Order_Number: String read GetOrder_Number write SetOrder_Number;
    property Customer_Order_Number: String read GetCustomer_Order_Number write SetCustomer_Order_Number;
    property Expiring_Days: Integer read GetExpiring_Days write SetExpiring_Days;
    property Expected_Delivery_Date_From: TDate read GetExpected_Delivery_Date_From write SetExpected_Delivery_Date_From;
    property Expected_Delivery_Date_To: TDate read GetExpected_Delivery_Date_To write SetExpected_Delivery_Date_To;
  end;

implementation

end.
