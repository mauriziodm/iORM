unit Model.Order;

interface

uses
  iORM.Attributes, Model.Customer;

type

  [ioEntity('Orders')]
  TOrder = class
  private
    FDate: TDate;
    FCustomer: TCustomer;
    FID: Integer;
    function GetTitle: String;
    function GetListText: String;
  public
    destructor Destroy; override;
    property ID:Integer read FID write FID;
    property Date:TDate read FDate write FDate;
    [ioBelongsTo(TCustomer)]
    property Customer:TCustomer read FCustomer write FCustomer;
    [ioSkip]
    property Title:String read GetTitle;
    [ioSkip]
    property ListText:String read GetListText;
  end;

implementation

uses
  System.SysUtils;

{ TOrder }

destructor TOrder.Destroy;
begin
  if Assigned(FCustomer) then
    FreeAndNil(FCustomer);
  inherited;
end;

function TOrder.GetListText: String;
begin
  Result := FormatDateTime('dd/mm', FDate) + ' - ' + FCustomer.FullName;
end;

function TOrder.GetTitle: String;
begin
  Result := Format('Order (%d)', [FID]);
end;

end.
