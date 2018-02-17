unit V.VipCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Customer, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniBasicGrid, uniDBGrid, uniGUIClasses,
  uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, M.Model, iORM.Attributes;

type

  [diViewFor(TVipCustomer)]
  [ioUniBindAction('ButtonBack', 'acClose')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  TViewVipCustomer = class(TViewCustomer)
    UniLabel8: TUniLabel;
    UniDBEdit6: TUniDBEdit;
    PersonModelDataSetVipCardCode: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewVipCustomer: TViewVipCustomer;

implementation

{$R *.dfm}

end.
