unit VM.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, Model.Order,
  iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewModel;

type

  TVMOrder = class(TVMBaseForForm)
    MPRows: TioModelPresenterDetail;
    acAddCustomPizza: TioVMAction;
    procedure MPMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
    procedure acAddCustomPizzaExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  Model.Interfaces, System.Rtti;

{$R *.dfm}

procedure TVMOrder.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  inherited;
//  MPRows.ShowEach('', 'VCProviderOrderRows');
end;

procedure TVMOrder.MPMasterSelectionObject(const ASender: TObject; var ASelected: TObject; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPizza: IPizza;
begin
  ADone := True;
  if Supports(ASelected, IPizza, LPizza) then
  begin
    if MPMaster.CurrentAs<IOrder>.TryAddPizzaToExistingRow(LPizza) then
      MPRows.Refresh
    else
    begin
      MPRows.Append( io.Create<IOrderRow>('PizzaOrderRow', [TValue.From<IPizza>(LPizza), 1]) );
      MPRows.ShowCurrent('', 'VCProviderOrderRows');
    end;
  end;
end;

procedure TVMOrder.acAddCustomPizzaExecute(Sender: TObject);
var
  LNewOrderRow: IOrderRow;
begin
  inherited;
  LNewOrderRow := io.Create<IOrderRow>('CustomOrderRow');
  MPRows.Append(LNewOrderRow);
  MPRows.ShowCurrent('', 'VCProviderOrderRows');
end;

end.
