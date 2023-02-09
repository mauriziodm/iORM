unit VM.Order;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ModelPresenter.Detail, Model.Order,
  iORM.MVVM.ViewModelBridge, iORM.MVVM.ViewModel;

type

  TVMOrder = class(TVMBaseForForm)
    BSRows: TioModelPresenterDetail;
    acAddCustomPizza: TioVMAction;
    acAddPizza: TioVMAction;
    procedure acAddCustomPizzaExecute(Sender: TObject);
    procedure acAddPizzaExecute(Sender: TObject);
    procedure MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
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

procedure TVMOrder.acAddPizzaExecute(Sender: TObject);
begin
  inherited;
  io.ShowAsSelector<IPizza>(BSMaster, acBack);
end;

procedure TVMOrder.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  inherited;
  BSRows.ShowEach(acBack, VCProviderByName('VCProviderOrderRows'));
end;

procedure TVMOrder.MPMasterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType; var ADone: Boolean);
var
  LPizza: IPizza;
begin
  ADone := True;
  if Supports(ASelected, IPizza, LPizza) then
  begin
    if BSMaster.CurrentAs<IOrder>.TryAddPizzaToExistingRow(LPizza) then
      BSRows.Refresh
    else
    begin
      BSRows.Append( io.Create<IOrderRow>('PizzaOrderRow', [TValue.From<IPizza>(LPizza), 1]) );
      BSRows.ShowCurrent(acBack, VCProviderByName('VCProviderOrderRows'));
    end;
  end;
end;

procedure TVMOrder.acAddCustomPizzaExecute(Sender: TObject);
var
  LNewOrderRow: IOrderRow;
begin
  inherited;
  LNewOrderRow := io.Create<IOrderRow>('CustomOrderRow');
  BSRows.Append(LNewOrderRow);
  BSRows.ShowCurrent(acBack, VCProviderByName('VCProviderOrderRows'));
end;

end.
