unit Model.Interfaces;

interface

uses
  iORM,
// "ioFMX" is defined in project options to indicate that it is a firemonkey project (Project | Options | Delphi Compiler | Conditional defines).
// Note: You need to build your project (Project | Build <ProjectName> or Shift + F9) for the changes to take effect.
{$IFDEF ioFMX}
  Fmx.Graphics,
{$ELSE}
  Vcl.Graphics,
{$IFEND}
  System.Generics.Collections;

type

  [ioEnumerated('All, Waiting, Preparing, Ready, Delivered')]
  TOrderState = (osUnknown, osWaiting, osPreparing, osReady, osDelivered);

  ICustomer = interface
    ['{28219347-5122-48BC-B735-3063FCFAE2B8}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    property Name: String read GetName write SetName;
    // City property
    procedure SetCity(const AValue: String);
    function GetCity: String;
    property City: String read GetCity write SetCity;
    // Address property
    procedure SetAddress(const AValue: String);
    function GetAddress: String;
    property Address: String read GetAddress write SetAddress;
    // FullAddress property
    function GetFullAddress: String;
    property FullAddress: String read GetFullAddress;
    // PhoneNumber property
    procedure SetPhoneNumber(const AValue: String);
    function GetPhoneNumber: String;
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
  end;

  IIngredient = interface
    ['{2F307C55-6DF0-4B99-9FD1-8B67559221A9}']
    // ID property
    procedure SetID(const Value: Integer);
    function GetID: Integer;
    property ID: Integer read GetID write SetID;
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    property Name: String read GetName write SetName;
    // UnitOfMeasure property
    procedure SetUnitOfMeasure(const AValue: String);
    function GetUnitOfMeasure: String;
    property UnitOfMeasure: String read GetUnitOfMeasure write SetUnitOfMeasure;
  end;

  IPizzaIngredientRow = interface
    ['{21B19932-C57E-49EB-9E78-C1EE77C1432B}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;
    // Ingredient property
    function GetIngredient: IIngredient;
    property Ingredient: IIngredient read GetIngredient;
    // Qty property
    procedure SetQty(const AValue: Double);
    function GetQty: Double;
    property Qty: Double read GetQty write SetQty;
  end;

  IPizza = interface
    ['{3D0E488C-A965-4CFF-B50B-71F38240710C}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    property Name: String read GetName write SetName;
    // Price property
    procedure SetPrice(const AValue: Currency);
    function GetPrice: Currency;
    property Price: Currency read GetPrice write SetPrice;
    // Image property
    function GetImage: TBitmap;
    property Image: TBitmap read GetImage;
    // Ingredients
    function GetIngredients: TList<IPizzaIngredientRow>;
    property Ingredients: TList<IPizzaIngredientRow> read GetIngredients;
  end;

  IOrderRow = interface
    ['{5DC17439-9594-4CE9-A64A-585C32BA5903}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;
    // Pizza property
    function GetPizza: IPizza;
    property Pizza: IPizza read GetPizza;
    // Qty property
    procedure SetQty(const AValue: Integer);
    function GetQty: Integer;
    property Qty: Integer read GetQty write SetQty;
    // RowTotal property
    function GetRowTotal: Currency;
    property RowTotal: Currency read GetRowTotal;
  end;

  IOrder = interface
    ['{53E0D8FC-BCDC-43BB-814E-256F44C75305}']
    procedure AddPizza(const APizza: IPizza);
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;
    // OrderDate property
    procedure SetOrderDate(const AValue: TDate);
    function GetOrderDate: TDate;
    property OrderDate: TDate read GetOrderDate Write SetOrderDate;
    // OrderState property
    procedure SetOrderState(const AValue: TOrderState);
    function GetOrderState: TOrderState;
    property OrderState: TOrderState read GetOrderState write SetOrderState;
    // Customer property
    procedure SetCustomer(const AValue: ICustomer);
    function GetCustomer: ICustomer;
    property Customer: ICustomer read GetCustomer write SetCustomer;
    // Rows property
    function GetRows: TList<IOrderRow>;
    property Rows: TList<IOrderRow> read GetRows;
    // Note property
    procedure SetNote(const AValue: String);
    function GetNote: String;
    property Note: String read GetNote write SetNote;
    // GrandTotal property
    function GetGrandTotal: Currency;
    property GrandTotal: Currency read GetGrandTotal;
  end;

implementation

end.
