unit V.Customer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, iORM.Attributes, V.Person, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniBasicGrid, uniDBGrid, uniGUIClasses,
  uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, M.Model;

type

  [diViewFor(TCustomer)]
  [ioUniBindAction('ButtonBack', 'acClose')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  TViewCustomer = class(TViewPerson)
    UniLabel7: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    PersonModelDataSetFidelityCardCode: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
