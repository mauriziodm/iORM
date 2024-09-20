unit View.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, Data.DB,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniEdit, uniDBEdit, Model.Customer, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type

  [diViewFor(TCustomer)]
  TViewCustomer = class(TViewBaseForForm)
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterAddress: TStringField;
    BSMasterCity: TStringField;
    BSMasterPhoneNumber: TStringField;
  private
  public
  end;

implementation

{$R *.dfm}

end.
