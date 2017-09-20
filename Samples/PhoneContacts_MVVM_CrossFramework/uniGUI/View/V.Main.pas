unit V.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniLabel,
  V.Interfaces, uniGUIRegClasses, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniBasicGrid, uniDBGrid, uniButton,
  uniBitBtn, uniSpeedButton, iORM.Attributes, System.Actions, Vcl.ActnList,
  uniCheckBox;

type
  [diImplements(IMainView)]
  [ioUniBindAction('ButtonClearData', 'acClearData')]
  [ioUniBindAction('ButtonLoadFromDB', 'acLoadData')]
  [ioUniBindAction('ButtonEdit', 'acEditPerson')]
  TViewMain = class(TUniFrame, IMainView)

    ButtonClearData: TUniSpeedButton;

    ButtonLoadFromDB: TUniSpeedButton;

    ButtonEdit: TUniSpeedButton;

    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    VMBridge: TioViewModelBridge;
    PersonsModelDataSet: TioModelDataSet;
    PersonsModelDataSetID: TIntegerField;
    PersonsModelDataSetFirstName: TStringField;
    PersonsModelDataSetLastName: TStringField;
    PersonsModelDataSetFullName: TStringField;
    PersonsModelDataSetClassNameProp: TStringField;
    PersonsDataSource: TDataSource;
    UniDBGrid1: TUniDBGrid;
    UniLabel2: TUniLabel;
    PhonesModelDataSet: TioModelDataSet;
    PhonesDataSource: TDataSource;
    PhonesModelDataSetPhoneType: TStringField;
    PhonesModelDataSetPhoneNumber: TStringField;
    UniDBGrid2: TUniDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}

{ TViewMain }

constructor TViewMain.Create(AOwner: TComponent);
begin
  inherited;
  PersonsModelDataSet.Open;
  PhonesModelDataSet.Open;
end;

end.
