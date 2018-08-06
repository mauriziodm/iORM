unit BusinessObjects;

interface

uses
  iORM.Attributes,
{$IFDEF FMX}
  FMX.Graphics,
{$ELSE}
  VCL.Graphics,
{$ENDIF}
  System.Generics.Collections,
  System.Classes,
  BusinessObjects.Base,
  BusinessObjects.Interfaces,
  iORM.Containers.Interfaces,
  iORM.CommonTypes;

type

  myRicerca = class(TCustomAttribute)
  private
    FValue: String;
  public
    constructor Create(const aValue: String);
    property Value: String read FValue;
  end;

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IBase)]
  TBase = class(TBaseBo, IBase)
  private
    FCreationDateTime: TDateTime;
    FDrawing_Number: String;
    procedure SetCreationDateTime(const Value: TDateTime);
    function GetCreationDateTime: TDateTime;
    procedure SetDrawing_Number(const Value: String);
    function GetDrawing_Number: String;
  public
    constructor Create; overload;
    constructor Create(const ADrawing_Number: String); overload;
    property CreationDateTime: TDateTime read GetCreationDateTime write SetCreationDateTime;
    property Drawing_Number: String read GetDrawing_Number write SetDrawing_Number;
  end;

  [ioEntity('PROCESSING_CYCLES'), ioTrueClass, diImplements(IProcessingCycle, 'PROCESSING_CYCLES')]
  TProcessing_Cycle = class(TBaseBo, IProcessingCycle)
  private
    FCompletato: Boolean;
    FSigla: String;
    FMaster_ID: Integer;
    FObjStatus: TioObjectStatus;
    procedure SetCompletato(const Value: Boolean);
    procedure SetSigla(const Value: String);
    function GetCompletato: Boolean;
    function GetSigla: String;
    procedure SetMaster_ID(const Value: Integer);
    function GetMaster_ID: Integer;
    procedure SetObjStatus(const Value: TioObjectStatus);
    function GetObjStatus: TioObjectStatus;
  public
    constructor Create;
    property Sigla: String read GetSigla write SetSigla;
    property Completato: Boolean read GetCompletato write SetCompletato;
    property Master_ID: Integer read GetMaster_ID write SetMaster_ID;
    property ObjStatus: TioObjectStatus read GetObjStatus write SetObjStatus;
  end;

  [ioEntity('PROCESSING_CYCLES_WORKS'), ioTrueClass, diImplements(IProcessingCycle, 'PROCESSING_CYCLES_WORKS')]
  TProcessing_Cycle_Works = class(TProcessing_Cycle, IProcessingCycle)
  end;

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IProductionOrderRow)]
  TProductionOrderRow = class(TBase, IProductionOrderRow)
  private
    FDraft: TBitmap;
    FMaterial_Quality: String;
    FProcessing_Cycle: IioList<IProcessingCycle>;
    FDimensions: String;
    FTreatment_Row: String;
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
  public
    constructor Create(const ADrawing_Number, aDimensions: String); overload;
    [ioHasMany('TProcessing_Cycle', 'PROCESSING_CYCLES', 'Master_ID')]
    property Processing_Cycles: IioList<IProcessingCycle> read GetProcessing_Cycle write SetProcessing_Cycle;
    property Material_Quality: String read GetMaterial_Quality write SetMaterial_Quality;
    property Draft: TBitmap read GetDraft write SetDraft;
    property Dimensions: String read GetDimensions write SetDimensions;
    property Treatment_Row: String read GetTreatment_Row write SetTreatment_Row;
  end;

  [ioEntity('ARTICLES'), ioTrueClass, diImplements(IProductionOrderHeader)]
  TProductionOrderHeader = class(TBase, IProductionOrderHeader)
  private
    FProdItems: IioList<IProdItem>;
    FOrder_Date: TDate;
    FCustomer: String;
    FOrder_Number: String;
    FTreatment: IioList<ITreatment>;
    FDelivery_Date_Request: TDate;
    FLaser_Time: TTime;
    FFormat_Time: TTime;
    FDelivery_Date: TDateTime;
    FRTE_Checked: String;
    FDate_Of_Issue: TDateTime;
    FCompiled_By: String;
    FDate_Of_Compilation: TDateTime;
    FDescription: String;
    FCode: String;
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
  public
    constructor Create;
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
    [ioHasMany('IProdItem', 'MasterID')]
    property ProdItems: IioList<IProdItem> read GetProdItems write SetProdItems;
    [ioHasMany('ITreatment', 'Master_ID')]
    property Treatment: IioList<ITreatment> read GetTreatment write SetTreatment;

  end;

  [ioEntity('PROCESSING'), ioTrueClass, diImplements(IProcessing)]
  TProcessing = class(TBaseBo, IProcessing)
  private
    FCode: String;
    FDescription: String;
    procedure SetDescription(const Value: String);
    procedure SetCode(const Value: String);
    function GetDescription: String;
    function GetCode: String;
  public
    property Code: String read GetCode write SetCode;
    property Description: String read GetDescription write SetDescription;
  end;

  [ioEntity('TREATMENT'), ioTrueClass, diImplements(ITreatment)]
  TTreatment = class(TBaseBo, ITreatment)
  private
    FToDo: Boolean;
    FNote: String;
    FTreatment: String;
    FMaster_ID: Integer;
    procedure SetToDo(const Value: Boolean);
    procedure SetNote(const Value: String);
    procedure SetTreatment(const Value: String);
    procedure SetMaster_ID(const Value: Integer);
    function GetToDo: Boolean;
    function GetMaster_ID: Integer;
    function GetNote: String;
    function GetTreatment: String;
  public
    property Treatment: String read GetTreatment write SetTreatment;
    property ToDo: Boolean read GetToDo write SetToDo;
    property Note: String read GetNote write SetNote;
    property Master_ID: Integer read GetMaster_ID write SetMaster_ID;
  end;

  [ioEntity('vOrdiniClienti'), diImplements(ICommessaGestionale)]
  TCommessaGestionale = class(TBaseBo, ICommessaGestionale)
  private
    FCommessa: String;
    FDescrizione_Tipo_Listino: String;
    FNumero_Commessa: Integer;
    FData_Consegna_Richiesta: TDateTime;
    FCodice_Prodotto: String;
    FQuantita: Single;
    FCliente: string;
    FData_Ordine_Cliente: TDateTime;
    FID_Testa: Integer;
    FData_Consegna_Prevista: TDateTime;
    FCodice_Cliente: String;
    FDescrizione_Prodotto: String;
    FData_Chiusura: TDateTime;
    FRif_Ordine_Cliente: String;
    FAnno: Integer;
    FCodice_Tipo_Listino: String;
    FUnita_Misura: String;
    FData: TDateTime;
    procedure SetAnno(const Value: Integer);
    procedure SetCliente(const Value: string);
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
    procedure SetID_Testa(const Value: Integer);
    procedure SetNumero_Commessa(const Value: Integer);
    procedure SetQuantita(const Value: Single);
    procedure SetRif_Ordine_Cliente(const Value: String);
    procedure SetUnita_Misura(const Value: String);
    function GetAnno: Integer;
    function GetCliente: string;
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
    function GetID_Testa: Integer;
    function GetNumero_Commessa: Integer;
    function GetQuantita: Single;
    function GetRif_Ordine_Cliente: String;
    function GetUnita_Misura: String;
  public
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
    property ID_Testa: Integer read GetID_Testa write SetID_Testa;
  end;

  [ioEntity('CommessaUT'), ioTrueClass, diImplements(ICommessaUT)]
  [ioJoin(ioInner, TCommessaGestionale, '[TCommessaGestionale.ID] = [TCommessaUT.Commessa_Gestionale_ID]')]
  TCommessaUT = class(TBaseBo, ICommessaUT)
  private
    FI_Delivery_Declared: String;
    FII_Delivery_Declared: String;
    FLaser_Program: String;
    FTechnical_Office_Availability: TDateTime;
    FList_In_Production: String;
    FTechnical_Office_Note: String;
    FDate_Prod_Start: String;
    FCommessa_Gestionale_ID: Integer;
    FProcessing_Cycle: IioList<IProcessingCycle>;
    // Join
    FCommessa: String;
    FDescrizione_Tipo_Listino: String;
    FNumero_Commessa: Integer;
    FData_Consegna_Richiesta: TDateTime;
    FCodice_Prodotto: String;
    FQuantita: Single;
    FCliente: string;
    FData_Ordine_Cliente: TDateTime;
    FID_Testa: Integer;
    FData_Consegna_Prevista: TDateTime;
    FCodice_Cliente: String;
    FDescrizione_Prodotto: String;
    FData_Chiusura: TDateTime;
    FRif_Ordine_Cliente: String;
    FAnno: Integer;
    FCodice_Tipo_Listino: String;
    FUnita_Misura: String;
    FData: TDateTime;
    FLast_Process_Update: TDateTime;
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
  public
    constructor Create;
    property Date_Prod_Start: String read GetDate_Prod_Start write SetDate_Prod_Start;
    property Laser_Program: String read GetLaser_Program write SetLaser_Program;
    property List_In_Production: String read GetList_In_Production write SetList_In_Production;
    property Technical_Office_Availability: TDateTime read GetTechnical_Office_Availability write SetTechnical_Office_Availability;
    property Technical_Office_Note: String read GetTechnical_Office_Note write SetTechnical_Office_Note;
    property I_Delivery_Declared: String read GetI_Delivery_Declared write SetI_Delivery_Declared;
    property II_Delivery_Declared: String read GetII_Delivery_Declared write SetII_Delivery_Declared;
    [ioIndex('Commessa_Gestionale_ID',ioAscending,True)]
    property Commessa_Gestionale_ID: Integer read GetCommessa_Gestionale_ID write SetCommessa_Gestionale_ID;
    property Last_Process_Update: TDateTime read GetLast_Process_Update write SetLast_Process_Update;
    [ioHasMany('IProcessingCycle', 'PROCESSING_CYCLES_WORKS', 'Master_ID')]
    property Processing_Cycle: IioList<IProcessingCycle> read GetProcessing_Cycle write SetProcessing_Cycle;


//    property Prod_Item : IProdItem;

    // Per veder il Join dei campi di TCommessaGestionale
    [ioField('[TCommessaGestionale].Numero_Commessa')]
    property Numero_Commessa: Integer read FNumero_Commessa write FNumero_Commessa;
    [ioField('[TCommessaGestionale].Anno')]
    property Anno: Integer read FAnno write FAnno;
    [ioField('[TCommessaGestionale].Data')]
    property Data: TDateTime read FData write FData;
    [ioField('[TCommessaGestionale].Codice_Cliente')]
    property Codice_Cliente: String read FCodice_Cliente write FCodice_Cliente;
    [ioField('[TCommessaGestionale].Cliente')]
    property Cliente: string read FCliente write FCliente;
    [ioField('[TCommessaGestionale].Rif_Ordine_Cliente')]
    property Rif_Ordine_Cliente: String read FRif_Ordine_Cliente write FRif_Ordine_Cliente;
    [ioField('[TCommessaGestionale].Data_Ordine_Cliente')]
    property Data_Ordine_Cliente: TDateTime read FData_Ordine_Cliente write FData_Ordine_Cliente;
    [ioField('[TCommessaGestionale].Codice_Prodotto')]
    property Codice_Prodotto: String read FCodice_Prodotto write FCodice_Prodotto;
    [ioField('[TCommessaGestionale].Descrizione_Prodotto')]
    property Descrizione_Prodotto: String read FDescrizione_Prodotto write FDescrizione_Prodotto;
    [ioField('[TCommessaGestionale].Data_Consegna_Richiesta')]
    property Data_Consegna_Richiesta: TDateTime read FData_Consegna_Richiesta write FData_Consegna_Richiesta;
    [ioField('[TCommessaGestionale].Data_Consegna_Prevista')]
    property Data_Consegna_Prevista: TDateTime read FData_Consegna_Prevista write FData_Consegna_Prevista;
    [ioField('[TCommessaGestionale].Unita_Misura')]
    property Unita_Misura: String read FUnita_Misura write FUnita_Misura;
    [ioField('[TCommessaGestionale].Quantita')]
    property Quantita: Single read FQuantita write FQuantita;
    [ioField('[TCommessaGestionale].Codice_Tipo_Listino')]
    property Codice_Tipo_Listino: String read FCodice_Tipo_Listino write FCodice_Tipo_Listino;
    [ioField('[TCommessaGestionale].Descrizione_Tipo_Listino')]
    property Descrizione_Tipo_Listino: String read FDescrizione_Tipo_Listino write FDescrizione_Tipo_Listino;
    [ioField('[TCommessaGestionale].Data_Chiusura')]
    property Data_Chiusura: TDateTime read FData_Chiusura write FData_Chiusura;
    [ioField('[TCommessaGestionale].Commessa')]
    property Commessa: String read FCommessa write FCommessa;
    [ioField('[TCommessaGestionale].ID_Testa')]
    property ID_Testa: Integer read FID_Testa write FID_Testa;
  end;

  [ioEntity]
  TConfermaLavorazione = class(TBaseBo)
  private
    FBarcode: String;
    FUser: String;
    FData: TDate;
    procedure SetBarcode(const Value: String);
    procedure SetData(const Value: TDate);
    procedure SetUser(const Value: String);
  public
    property User: String read FUser write SetUser;
    property Barcode: String read FBarcode write SetBarcode;
    property Data: TDate read FData write SetData;
  end;

  [ioEntity, diImplements(IRicercaCommessa)]
  TRicercaCommessa = class(TBaseBo, IRicercaCommessa)
  private
    FFrom_Date: TDate;
    FExpected_Delivery_Date_From: TDate;
    FCustomer: String;
    FOpen: Boolean;
    FCustomer_Order_Number: String;
    FOrder_Number: String;
    FExpiring_Days: Integer;
    FTo_Date: TDate;
    FExpected_Delivery_Date_To: TDate;
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
  public
    constructor Create;
    [myRicerca('[TCommessaGestionale].Cliente')]
    property Customer: String read GetCustomer write SetCustomer;
    [myRicerca('[TCommessaGestionale].Data')]
    property From_Date: TDate read GetFrom_Date write SetFrom_Date;
    [myRicerca('[TCommessaGestionale].Data')]
    property To_Date: TDate read GetTo_Date write SetTo_Date;
    [myRicerca('[TCommessaGestionale].Data_Chiusura')]
    Property Open: Boolean read GetOpen write SetOpen;
    [myRicerca('[TCommessaGestionale].Commessa')]
    property Order_Number: String read GetOrder_Number write SetOrder_Number;
    [myRicerca('[TCommessaGestionale].Rif_Ordine_Cliente')]
    property Customer_Order_Number: String read GetCustomer_Order_Number write SetCustomer_Order_Number;
    [myRicerca('[TCommessaGestionale].Data_Consegna_Richiesta')]
    property Expiring_Days: Integer read GetExpiring_Days write SetExpiring_Days;
    [myRicerca('[TCommessaUT].I_Delivery_Declared')]
    property Expected_Delivery_From_Date: TDate read GetExpected_Delivery_Date_From write SetExpected_Delivery_Date_From;
    [myRicerca('[TCommessaUT].I_Delivery_Declared')]
    property Expected_Delivery_To_Date: TDate read GetExpected_Delivery_Date_To write SetExpected_Delivery_Date_To;
  end;

implementation

uses
  iORM, iORM.LazyLoad.Generics.List, System.SysUtils;

{ TConfermaLavorazione }

procedure TConfermaLavorazione.SetBarcode(const Value: String);
begin
  FBarcode := Value;
end;

procedure TConfermaLavorazione.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TConfermaLavorazione.SetUser(const Value: String);
begin
  FUser := Value;
end;

{ TProduct }

constructor TProductionOrderHeader.Create;
begin
  inherited;
  FProdItems := io.di.Locate < IioList < IProdItem >>.Get;
  FTreatment := io.di.Locate < IioList < ITreatment >>.Get;
end;

function TProductionOrderHeader.GetCode: String;
begin
  Result := FCode;
end;

function TProductionOrderHeader.GetCompiled_By: String;
begin
  Result := FCompiled_By;
end;

function TProductionOrderHeader.GetCustomer: String;
begin
  Result := FCustomer;
end;

function TProductionOrderHeader.GetDate_Of_Compilation: TDateTime;
begin
  Result := FDate_Of_Compilation;
end;

function TProductionOrderHeader.GetDate_Of_Issue: TDateTime;
begin
  Result := FDate_Of_Issue;
end;

function TProductionOrderHeader.GetDelivery_Date: TDateTime;
begin
  Result := FDelivery_Date;
end;

function TProductionOrderHeader.GetDelivery_Date_Request: TDate;
begin
  Result := FDelivery_Date_Request;
end;

function TProductionOrderHeader.GetDescription: String;
begin
  Result := FDescription;
end;

function TProductionOrderHeader.GetFormat_Time: TTime;
begin
  Result := FFormat_Time;
end;

function TProductionOrderHeader.GetLaser_Time: TTime;
begin
  Result := FLaser_Time;
end;

function TProductionOrderHeader.GetOrder_Date: TDate;
begin
  Result := FOrder_Date;
end;

function TProductionOrderHeader.GetOrder_Number: String;
begin
  Result := FOrder_Number;
end;

function TProductionOrderHeader.GetProdItems: IioList<IProdItem>;
begin
  Result := FProdItems;
end;

function TProductionOrderHeader.GetRTE_Checked: String;
begin

end;

function TProductionOrderHeader.GetTreatment: IioList<ITreatment>;
begin
  Result := FTreatment;
end;

procedure TProductionOrderHeader.SetCode(const Value: String);
begin
  FCode := Value;
end;

procedure TProductionOrderHeader.SetCompiled_By(const Value: String);
begin
  FCompiled_By := Value;
end;

procedure TProductionOrderHeader.SetCustomer(const Value: String);
begin
  FCustomer := Value;
end;

procedure TProductionOrderHeader.SetDate_Of_Compilation(const Value: TDateTime);
begin
  FDate_Of_Compilation := Value;
end;

procedure TProductionOrderHeader.SetDate_Of_Issue(const Value: TDateTime);
begin
  FDate_Of_Issue := Value;
end;

procedure TProductionOrderHeader.SetDelivery_Date(const Value: TDateTime);
begin
  FDelivery_Date := Value;
end;

procedure TProductionOrderHeader.SetDelivery_Date_Request(const Value: TDate);
begin
  FDelivery_Date_Request := Value;
end;

procedure TProductionOrderHeader.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TProductionOrderHeader.SetFormat_Time(const Value: TTime);
begin
  FFormat_Time := Value;
end;

procedure TProductionOrderHeader.SetLaser_Time(const Value: TTime);
begin
  FLaser_Time := Value;
end;

procedure TProductionOrderHeader.SetOrder_Date(const Value: TDate);
begin
  FOrder_Date := Value;
end;

procedure TProductionOrderHeader.SetOrder_Number(const Value: String);
begin
  FOrder_Number := Value;
end;

procedure TProductionOrderHeader.SetProdItems(const Value: IioList<IProdItem>);
begin
  FProdItems := Value;
end;

procedure TProductionOrderHeader.SetRTE_Checked(const Value: String);
begin
  FRTE_Checked := Value;
end;

procedure TProductionOrderHeader.SetTreatment(const Value: IioList<ITreatment>);
begin
  FTreatment := Value;
end;

{ TMaterial }

constructor TProductionOrderRow.Create(const ADrawing_Number, aDimensions: String);
begin
  inherited Create(ADrawing_Number);
  FDimensions := aDimensions;
  FDraft := TBitmap.Create;
  FProcessing_Cycle := io.di.Locate < IioList < IProcessingCycle >>.Alias('PROCESSING_CYCLES').Get;
end;

function TProductionOrderRow.GetMaterial_Quality: String;
begin
  Result := FMaterial_Quality;
end;

function TProductionOrderRow.GetProcessing_Cycle: IioList<IProcessingCycle>;
begin
  Result := FProcessing_Cycle;
end;

function TProductionOrderRow.GetTreatment_Row: String;
begin
  Result := FTreatment_Row;
end;

function TProductionOrderRow.GetDimensions: String;
begin
  Result := FDimensions;
end;

function TProductionOrderRow.GetDraft: TBitmap;
begin
  Result := FDraft;
end;

procedure TProductionOrderRow.SetMaterial_Quality(const Value: String);
begin
  FMaterial_Quality := Value;
end;

procedure TProductionOrderRow.SetDimensions(const Value: String);
begin
  FDimensions := Value;
end;

procedure TProductionOrderRow.SetProcessing_Cycle(const Value: IioList<IProcessingCycle>);
begin
  FProcessing_Cycle := Value;
end;

procedure TProductionOrderRow.SetTreatment_Row(const Value: String);
begin
  FTreatment_Row := Value;
end;

procedure TProductionOrderRow.SetDraft(const Value: TBitmap);
begin
  FDraft := Value;
end;

{ TBase }

constructor TBase.Create;
begin
  inherited;
  FCreationDateTime := Now;
end;

constructor TBase.Create(const ADrawing_Number: String);
begin
  Create;
  FDrawing_Number := ADrawing_Number;
end;

function TBase.GetCreationDateTime: TDateTime;
begin
  Result := FCreationDateTime;
end;

function TBase.GetDrawing_Number: String;
begin
  Result := FDrawing_Number;
end;

procedure TBase.SetCreationDateTime(const Value: TDateTime);
begin
  FCreationDateTime := Value;
end;

procedure TBase.SetDrawing_Number(const Value: String);
begin
  FDrawing_Number := Value;
end;

{ TProcessing }

function TProcessing.GetDescription: String;
begin
  Result := FDescription;
end;

function TProcessing.GetCode: String;
begin
  Result := FCode;
end;

procedure TProcessing.SetDescription(const Value: String);
begin
  FDescription := Value;
end;

procedure TProcessing.SetCode(const Value: String);
begin
  FCode := Value;
end;

{ TTreatment }

function TTreatment.GetToDo: Boolean;
begin
  Result := FToDo;
end;

function TTreatment.GetMaster_ID: Integer;
begin
  Result := FMaster_ID;
end;

function TTreatment.GetNote: String;
begin
  Result := FNote;
end;

function TTreatment.GetTreatment: String;
begin
  Result := FTreatment;
end;

procedure TTreatment.SetToDo(const Value: Boolean);
begin
  FToDo := Value;
end;

procedure TTreatment.SetMaster_ID(const Value: Integer);
begin
  FMaster_ID := Value;
end;

procedure TTreatment.SetNote(const Value: String);
begin
  FNote := Value;
end;

procedure TTreatment.SetTreatment(const Value: String);
begin
  FTreatment := Value;
end;

{ TProcessing_Cycle }

constructor TProcessing_Cycle.Create;
begin
  FCompletato := false;
end;

function TProcessing_Cycle.GetCompletato: Boolean;
begin
  Result := FCompletato;
end;

function TProcessing_Cycle.GetMaster_ID: Integer;
begin
  Result := FMaster_ID;
end;

function TProcessing_Cycle.GetObjStatus: TioObjectStatus;
begin
  Result := FObjStatus;
end;

function TProcessing_Cycle.GetSigla: String;
begin
  Result := FSigla;
end;

procedure TProcessing_Cycle.SetCompletato(const Value: Boolean);
begin
  FCompletato := Value;
end;

procedure TProcessing_Cycle.SetMaster_ID(const Value: Integer);
begin
  FMaster_ID := Value;
end;

procedure TProcessing_Cycle.SetObjStatus(const Value: TioObjectStatus);
begin
  FObjStatus := Value;
end;

procedure TProcessing_Cycle.SetSigla(const Value: String);
begin
  FSigla := Value;
end;

{ TCommessaBase }

function TCommessaGestionale.GetAnno: Integer;
begin
  Result := FAnno;
end;

function TCommessaGestionale.GetCliente: string;
begin
  Result := FCliente;
end;

function TCommessaGestionale.GetCodice_Cliente: String;
begin
  Result := FCodice_Cliente;
end;

function TCommessaGestionale.GetCodice_Prodotto: String;
begin
  Result := FCodice_Prodotto;
end;

function TCommessaGestionale.GetCodice_Tipo_Listino: String;
begin
  Result := FCodice_Tipo_Listino;
end;

function TCommessaGestionale.GetCommessa: String;
begin
  Result := FCommessa;
end;

function TCommessaGestionale.GetData: TDateTime;
begin
  Result := FData;
end;

function TCommessaGestionale.GetData_Chiusura: TDateTime;
begin
  Result := FData_Chiusura;
end;

function TCommessaGestionale.GetData_Consegna_Prevista: TDateTime;
begin
  Result := FData_Consegna_Prevista
end;

function TCommessaGestionale.GetData_Consegna_Richiesta: TDateTime;
begin
  Result := FData_Consegna_Richiesta;
end;

function TCommessaGestionale.GetData_Ordine_Cliente: TDateTime;
begin
  Result := FData_Ordine_Cliente;
end;

function TCommessaGestionale.GetDescrizione_Prodotto: String;
begin
  Result := FDescrizione_Prodotto;
end;

function TCommessaGestionale.GetDescrizione_Tipo_Listino: String;
begin
  Result := FDescrizione_Tipo_Listino;
end;

function TCommessaGestionale.GetID_Testa: Integer;
begin
  Result := FID_Testa;
end;

function TCommessaGestionale.GetNumero_Commessa: Integer;
begin
  Result := FNumero_Commessa;
end;

function TCommessaGestionale.GetQuantita: Single;
begin
  Result := FQuantita;
end;

function TCommessaGestionale.GetRif_Ordine_Cliente: String;
begin
  Result := FRif_Ordine_Cliente;
end;

function TCommessaGestionale.GetUnita_Misura: String;
begin
  Result := FUnita_Misura;
end;

procedure TCommessaGestionale.SetAnno(const Value: Integer);
begin
  FAnno := Value;
end;

procedure TCommessaGestionale.SetCliente(const Value: string);
begin
  FCliente := Value;
end;

procedure TCommessaGestionale.SetCodice_Cliente(const Value: String);
begin
  FCodice_Cliente := Value;
end;

procedure TCommessaGestionale.SetCodice_Prodotto(const Value: String);
begin
  FCodice_Prodotto := Value;
end;

procedure TCommessaGestionale.SetCodice_Tipo_Listino(const Value: String);
begin
  FCodice_Tipo_Listino := Value;
end;

procedure TCommessaGestionale.SetCommessa(const Value: String);
begin
  FCommessa := Value;
end;

procedure TCommessaGestionale.SetData(const Value: TDateTime);
begin
  FData := Value;
end;

procedure TCommessaGestionale.SetData_Chiusura(const Value: TDateTime);
begin
  FData_Chiusura := Value;
end;

procedure TCommessaGestionale.SetData_Consegna_Prevista(const Value: TDateTime);
begin
  FData_Consegna_Prevista := Value;
end;

procedure TCommessaGestionale.SetData_Consegna_Richiesta(const Value: TDateTime);
begin
  FData_Consegna_Richiesta := Value;
end;

procedure TCommessaGestionale.SetData_Ordine_Cliente(const Value: TDateTime);
begin
  FData_Ordine_Cliente := Value;
end;

procedure TCommessaGestionale.SetDescrizione_Prodotto(const Value: String);
begin
  FDescrizione_Prodotto := Value;
end;

procedure TCommessaGestionale.SetDescrizione_Tipo_Listino(const Value: String);
begin
  FDescrizione_Tipo_Listino := Value;
end;

procedure TCommessaGestionale.SetID_Testa(const Value: Integer);
begin
  FID_Testa := Value;
end;

procedure TCommessaGestionale.SetNumero_Commessa(const Value: Integer);
begin
  FNumero_Commessa := Value;
end;

procedure TCommessaGestionale.SetQuantita(const Value: Single);
begin
  FQuantita := Value;
end;

procedure TCommessaGestionale.SetRif_Ordine_Cliente(const Value: String);
begin
  FRif_Ordine_Cliente := Value;
end;

procedure TCommessaGestionale.SetUnita_Misura(const Value: String);
begin
  FUnita_Misura := Value;
end;

{ TCommessa }

constructor TCommessaUT.Create;
begin
  inherited;
  FProcessing_Cycle := io.di.Locate < IioList < IProcessingCycle >>.Alias('PROCESSING_CYCLES_WORKS').Get;
end;

function TCommessaUT.GetDate_Prod_Start: String;
begin
  Result := FDate_Prod_Start;
end;

function TCommessaUT.GetCommessa_Gestionale_ID: Integer;
begin
  Result := FCommessa_Gestionale_ID;
end;

function TCommessaUT.GetII_Delivery_Declared: String;
begin
  Result := FII_Delivery_Declared;
end;

function TCommessaUT.GetI_Delivery_Declared: String;
begin
  Result := FI_Delivery_Declared;
end;

function TCommessaUT.GetLaser_Program: String;
begin
  Result := FLaser_Program;
end;

function TCommessaUT.GetLast_Process_Update: TDateTime;
begin
  Result := FLast_Process_Update;
end;

function TCommessaUT.GetProcessing_Cycle: IioList<IProcessingCycle>;
begin
  Result := FProcessing_Cycle;
end;

function TCommessaUT.GetList_In_Production: String;
begin
  Result := FList_In_Production
end;

function TCommessaUT.GetTechnical_Office_Availability: TDateTime;
begin
  Result := FTechnical_Office_Availability;
end;

function TCommessaUT.GetTechnical_Office_Note: String;
begin
  Result := FTechnical_Office_Note;
end;

procedure TCommessaUT.SetDate_Prod_Start(const Value: String);
begin
  FDate_Prod_Start := Value;
end;

procedure TCommessaUT.SetCommessa_Gestionale_ID(const Value: Integer);
begin
  FCommessa_Gestionale_ID := Value;
end;

procedure TCommessaUT.SetII_Delivery_Declared(const Value: String);
begin
  FII_Delivery_Declared := Value;
end;

procedure TCommessaUT.SetI_Delivery_Declared(const Value: String);
begin
  FI_Delivery_Declared := Value;
end;

procedure TCommessaUT.SetLaser_Program(const Value: String);
begin
  FLaser_Program := Value;
end;

procedure TCommessaUT.SetLast_Process_Update(const Value: TDateTime);
begin
  FLast_Process_Update := Value;
end;

procedure TCommessaUT.SetProcessing_Cycle(const Value: IioList<IProcessingCycle>);
begin
  FProcessing_Cycle := Value;
end;

procedure TCommessaUT.SetList_In_Production(const Value: String);
begin
  FList_In_Production := Value;
end;

procedure TCommessaUT.SetTechnical_Office_Availability(const Value: TDateTime);
begin
  FTechnical_Office_Availability := Value;
end;

procedure TCommessaUT.SetTechnical_Office_Note(const Value: String);
begin
  FTechnical_Office_Note := Value;
end;

{ TRicercaCommessa }

constructor TRicercaCommessa.Create;
begin
  FFrom_Date := 0;
  FTo_Date := 0;
  FExpected_Delivery_Date_From := 0;
  FCustomer := '';
  FOpen := false;
  FCustomer_Order_Number := '';
  FOrder_Number := '';
  FExpiring_Days := 0;
  FExpected_Delivery_Date_To := 0;
end;

function TRicercaCommessa.GetCustomer: String;
begin
  Result := FCustomer;
end;

function TRicercaCommessa.GetCustomer_Order_Number: String;
begin
  Result := FCustomer_Order_Number;
end;

function TRicercaCommessa.GetExpected_Delivery_Date_From: TDate;
begin
  Result := FExpected_Delivery_Date_From;
end;

function TRicercaCommessa.GetExpected_Delivery_Date_To: TDate;
begin
  Result := FExpected_Delivery_Date_To;
end;

function TRicercaCommessa.GetExpiring_Days: Integer;
begin
  Result := FExpiring_Days;
end;

function TRicercaCommessa.GetFrom_Date: TDate;
begin
  Result := FFrom_Date;
end;

function TRicercaCommessa.GetOpen: Boolean;
begin
  Result := FOpen;
end;

function TRicercaCommessa.GetOrder_Number: String;
begin
  Result := FOrder_Number;
end;

function TRicercaCommessa.GetTo_Date: TDate;
begin
  Result := FTo_Date;
end;

procedure TRicercaCommessa.SetCustomer(const Value: String);
begin
  FCustomer := Value;
end;

procedure TRicercaCommessa.SetCustomer_Order_Number(const Value: String);
begin
  FCustomer_Order_Number := Value;
end;

procedure TRicercaCommessa.SetExpected_Delivery_Date_From(const Value: TDate);
begin
  FExpected_Delivery_Date_From := Value;
end;

procedure TRicercaCommessa.SetExpected_Delivery_Date_To(const Value: TDate);
begin
  FExpected_Delivery_Date_To := Value;
end;

procedure TRicercaCommessa.SetExpiring_Days(const Value: Integer);
begin
  FExpiring_Days := Value;
end;

procedure TRicercaCommessa.SetFrom_Date(const Value: TDate);
begin
  FFrom_Date := Value;
end;

procedure TRicercaCommessa.SetOpen(const Value: Boolean);
begin
  FOpen := Value;
end;

procedure TRicercaCommessa.SetOrder_Number(const Value: String);
begin
  FOrder_Number := Value;
end;

procedure TRicercaCommessa.SetTo_Date(const Value: TDate);
begin
  FTo_Date := Value;
end;

{ myRicerca }

constructor myRicerca.Create(const aValue: String);
begin
  FValue := aValue;
end;

end.
