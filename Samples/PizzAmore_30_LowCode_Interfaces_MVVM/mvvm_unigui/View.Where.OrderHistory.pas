unit View.Where.OrderHistory;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Where.Interfaces, uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniGUIClasses, uniPanel, uniBasicGrid, uniDBGrid;

type

  [diViewFor(IWhereOrder)]
  TViewWhereOrderHistory = class(TViewBaseForList)
    BSMasterOrderID: TIntegerField;
    BSMasterOrderState: TStringField;
    BSMasterNote: TStringField;
    BSMasterFromDate: TDateField;
    BSMasterToDate: TDateField;
  private
  public
  end;

implementation

{$R *.dfm}

end.
