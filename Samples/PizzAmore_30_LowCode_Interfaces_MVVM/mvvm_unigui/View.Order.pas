unit View.Order;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, Data.DB,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, iORM.MVVM.ViewContextProvider, uniEdit, uniDBEdit, uniDateTimePicker, uniDBDateTimePicker,
  uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox, uniDBComboBox, Model.Order, Model.Interfaces;

type

  [diViewFor(TOrder)]
  TViewOrder = class(TViewBaseForForm)
    VCProviderOrder: TioViewContextProvider;
    BSCustomer: TioModelDataSet;
    BSCustomerID: TIntegerField;
    BSCustomerName: TStringField;
    BSCustomerFullAddress: TStringField;
    BSCustomerPhoneNumber: TStringField;
    SourceCustomer: TDataSource;
    BSRows: TioModelDataSet;
    BSRowsDescription: TStringField;
    BSRowsPrice: TCurrencyField;
    BSRowsQty: TIntegerField;
    BSRowsRowTotal: TCurrencyField;
    SourceRows: TDataSource;
    BSMasterID: TIntegerField;
    BSMasterOrderDate: TDateField;
    BSMasterOrderState: TStringField;
    BSMasterNote: TStringField;
    BSMasterGrandTotal: TCurrencyField;
    acDeleteRow: TioViewAction;
    acShowCustomerSelector: TioViewAction;
    procedure VCProviderOrderRequest(const Sender: TObject; out ResultViewContext: TComponent);
    procedure VCProviderOrderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
    procedure UniFrameCreate(Sender: TObject);
  private
  public
  end;

implementation

uses
  uniGUIFrame;

{$R *.dfm}

procedure TViewOrder.UniFrameCreate(Sender: TObject);
begin
  inherited;
//  io.Enums.FillStrings<TOrderState>(DBComboBoxOrderState.Items);
end;

procedure TViewOrder.VCProviderOrderAfterRequest(const Sender: TObject; const AView, AViewContext: TComponent);
begin
  (AView as TUniFrame).Align := alClient;
end;

procedure TViewOrder.VCProviderOrderRequest(const Sender: TObject; out ResultViewContext: TComponent);
begin
//  ResultViewContext := PanelPizzas;
end;

end.
