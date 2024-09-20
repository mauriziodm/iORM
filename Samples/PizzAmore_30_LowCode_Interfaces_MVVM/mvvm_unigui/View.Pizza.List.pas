unit View.Pizza.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniGUIClasses, uniPanel, uniBasicGrid, uniDBGrid, Model.Interfaces, uniEdit, uniDBEdit, uniImage, uniDBImage, Vcl.Controls, Vcl.Forms;

type

  [diViewFor(IPizza), diViewFor(IPizza, 'embedded')]
  TViewPizzas = class(TViewBaseForList)
    BSMasterID: TIntegerField;
    BSMasterName: TStringField;
    BSMasterPrice: TCurrencyField;
    BSMasterImage: TGraphicField;
    BSWhereID: TIntegerField;
    BSWhereName: TStringField;
    BSWhereFromPrice: TCurrencyField;
    BSWhereToPrice: TCurrencyField;
  private
  public
  end;

implementation

{$R *.dfm}

end.
