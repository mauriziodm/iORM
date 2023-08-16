unit View.Pizza;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, Model.Pizza;

type

  [diViewFor(TPizza)]
  TViewPizza = class(TViewBaseForForm)
    MDSMasterID: TIntegerField;
    MDSMasterName: TStringField;
    MDSMasterPrice: TCurrencyField;
    MDSMasterImage: TGraphicField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEditID: TDBEdit;
    DBEditName: TDBEdit;
    DBEditPrice: TDBEdit;
    DBImage: TDBImage;
  private
  public
  end;

implementation

{$R *.dfm}

end.
