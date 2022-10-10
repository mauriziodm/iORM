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

  IBaseBO = interface
    ['{BCA1B62F-1AE4-4C6A-AEE4-C0FFE2A8198A}']
    // ID property (Read Only)
    function GetID: Integer;
    property ID: Integer read GetID;
  end;

  IGenericCustomer = interface(IBaseBO)
    ['{7CF86B95-2E8C-4525-A2EA-752F777C3977}']
    // Name property (Read Only)
    function GetFullName: String;
    property FullName: String read GetFullName;
    // FullAddress property (Read Only)
    function GetFullAddress: String;
    property FullAddress: String read GetFullAddress;
    // PhoneNumber property (Read Only)
    function GetPhoneNumber: String;
    property PhoneNumber: String read GetPhoneNumber;
  end;

  IPizza = interface(IBaseBO)
    ['{3D0E488C-A965-4CFF-B50B-71F38240710C}']
    // Name property
    procedure SetName(const AValue: String);
    function GetName: String;
    property Name: String read GetName write SetName;
    // Price property
    procedure SetPrice(const AValue: Currency);
    function GetPrice: Currency;
    property Price: Currency read GetPrice write SetPrice;
    // Image property (Read Only)
    function GetImage: TBitmap;
    property Image: TBitmap read GetImage;
  end;

  IOrderRow = interface(IBaseBO)
    ['{5DC17439-9594-4CE9-A64A-585C32BA5903}']
    // Qty
    procedure SetQty(const AValue: Integer);
    function GetQty: Integer;
    property Qty: Integer read getQty write SetQty;
    // RowTotal property (Read Only)
    function GetRowTotal: Currency;
    property RowTotal: Currency read GetRowTotal;
  end;

  IPizzaOrderRow = interface(IOrderRow)
    ['{7ED56F3E-C41A-4FF8-9008-C4B4F2235C4E}']
    procedure AddOne;
    // Pizza
    function GetPizza: IPizza;
    property Pizza: IPizza read GetPizza;
  end;

  IOrder = interface(IBaseBO)
    ['{53E0D8FC-BCDC-43BB-814E-256F44C75305}']
    function AddPizza(const APizza: IPizza): IOrderRow;
    // OrderDate property
    procedure SetOrderDate(const AValue: TDate);
    function GetOrderDate: TDate;
    property OrderDate: TDate read GetOrderDate Write SetOrderDate;
    // Customer property
    procedure SetCustomer(const AValue: IGenericCustomer);
    function GetCustomer: IGenericCustomer;
    property Customer: IGenericCustomer read GetCustomer write SetCustomer;
    // Rows property
    function GetRows: TList<IOrderRow>;
    property Rows: TList<IOrderRow> read GetRows;
    // Note property
    procedure SetNote(const AValue: String);
    function GetNote: String;
    property Note: String read GetNote write SetNote;
    // GrandTotal property (Read Only)
    function GetGrandTotal: Currency;
    property GrandTotal: Currency read GetGrandTotal; // ReadOnly
  end;

implementation

end.
