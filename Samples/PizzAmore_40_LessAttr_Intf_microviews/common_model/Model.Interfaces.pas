unit Model.Interfaces;

interface

uses
// "ioFMX" is defined in project options to indicate that it is a firemonkey project (Project | Options | Delphi Compiler | Conditional defines).
// Note: You need to build your project (Project | Build <ProjectName> or Shift + F9) for the changes to take effect.
{$IFDEF ioFMX}
  Fmx.Graphics,
{$ELSE}
  Vcl.Graphics,
{$IFEND}
  System.Generics.Collections;

type

  IContact = interface
    ['{FBDA76DE-F8B7-40C4-8508-C65F716F33AC}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;  // ReadOnly
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
    property FullAddress: String read GetFullAddress;  // ReadOnly
    // PhoneNumber property
    procedure SetPhoneNumber(const AValue: String);
    function GetPhoneNumber: String;
    property PhoneNumber: String read GetPhoneNumber write SetPhoneNumber;
  end;

  ICustomer = interface(IContact)
    ['{28219347-5122-48BC-B735-3063FCFAE2B8}']
    // FidelityCardCode property
    procedure SetFidelityCardCode(const AValue: String);
    function GetFidelityCardCode: String;
    property FidelityCardCode: String read GetFidelityCardCode write SetFidelityCardCode;
  end;

  IVipCustomer = interface(ICustomer)
    ['{83B3F0BD-1919-4AFF-8D8E-B388FD33A18F}']
    // VipCardCode property
    procedure SetVipCardCode(const AValue: String);
    function GetVipCardCode: String;
    property VipCardCode: String read GetVipCardCode write SetVipCardCode;
  end;

  IEmployee = interface(IContact)
    ['{83B3F0BD-1919-4AFF-8D8E-B388FD33A18F}']
    // PhoneNumber property
    procedure SetBranchOffice(const AValue: String);
    function GetBranchOffice: String;
    property BranchOffice: String read GetBranchOffice write SetBranchOffice;
  end;

  IPizza = interface
    ['{3D0E488C-A965-4CFF-B50B-71F38240710C}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;  // ReadOnly
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
    property Image: TBitmap read GetImage; // ReadOnly
  end;

  IOrderRow = interface
    ['{5DC17439-9594-4CE9-A64A-585C32BA5903}']
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;  // ReadOnly
    // PizzaID property
    function GetPizzaID: Integer;
    property PizzaID: Integer read GetPizzaID;  // ReadOnly
    // Description property
    procedure SetDescription(const AValue: String);
    function GetDescription: String;
    property Description: String read GetDescription write SetDescription;
    // Price property
    procedure SetPrice(const AValue: Currency);
    function GetPrice: Currency;
    property Price: Currency read GetPrice write SetPrice;
    // Qty property
    procedure SetQty(const AValue: Integer);
    function GetQty: Integer;
    property Qty: Integer read GetQty write SetQty;
    // RowTotal property
    function GetRowTotal: Currency;
    property RowTotal: Currency read GetRowTotal;  // ReadOnly
  end;

  IOrder = interface
    ['{53E0D8FC-BCDC-43BB-814E-256F44C75305}']
    procedure AddPizza(const APizza: IPizza);
    // ID property
    function GetID: Integer;
    property ID: Integer read GetID;  // ReadOnly
    // OrderDate property
    procedure SetOrderDate(const AValue: TDate);
    function GetOrderDate: TDate;
    property OrderDate: TDate read GetOrderDate Write SetOrderDate;
    // Customer property
    procedure SetCustomer(const AValue: ICustomer);
    function GetCustomer: ICustomer;
    property Customer: ICustomer read GetCustomer write SetCustomer;
    // Rows property
    function GetRows: TList<IOrderRow>;
    property Rows: TList<IOrderRow> read GetRows; // ReadOnly
    // Note property
    procedure SetNote(const AValue: String);
    function GetNote: String;
    property Note: String read GetNote write SetNote;
    // GrandTotal property
    function GetGrandTotal: Currency;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
  end;

implementation

end.
