unit V.Employee;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Person, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniBasicGrid, uniDBGrid, uniGUIClasses,
  uniEdit, uniDBEdit, uniLabel, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, iORM.Attributes, V.Interfaces;

type

  [diImplements(IPersonView, 'TEmployee')]
  [ioUniBindAction('ButtonBack', 'acClose')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  TViewEmployee = class(TViewPerson)
    PersonModelDataSetBranchOffice: TStringField;
    UniLabel7: TUniLabel;
    UniDBEdit5: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewEmployee: TViewEmployee;

implementation

{$R *.dfm}

end.
