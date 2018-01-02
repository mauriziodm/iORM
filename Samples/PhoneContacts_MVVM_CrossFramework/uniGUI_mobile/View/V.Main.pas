unit V.Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniGUImJSForm, unimPanel,
  uniLabel, unimLabel, Data.DB, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, iORM.MVVM.Components.ViewModelBridge,
  uniBasicGrid, uniDBGrid, unimDBListGrid, unimDBGrid, V.Interfaces,
  iORM.Attributes, uniButton, unimButton;

type

  [diImplements(IMainView)]
  [ioUniBindAction('ButtonClearData', 'acClearData')]
  [ioUniBindAction('ButtonLoadFromDB', 'acLoadData')]
  [ioUniBindAction('ButtonEdit', 'acEditPerson')]
  TViewMain = class(TUniFrame, IMainView)

    ButtonEdit: TUnimButton;

    ButtonLoadFromDB: TUnimButton;

    ButtonClearData: TUnimButton;

    TopPanel: TUnimPanel;
    VMBridge: TioViewModelBridge;
    PersonsModelDataSet: TioModelDataSet;
    PersonsModelDataSetID: TIntegerField;
    PersonsModelDataSetFirstName: TStringField;
    PersonsModelDataSetLastName: TStringField;
    PersonsModelDataSetFullName: TStringField;
    PersonsModelDataSetClassNameProp: TStringField;
    PersonsDataSource: TDataSource;
    PhonesModelDataSet: TioModelDataSet;
    PhonesModelDataSetPhoneType: TStringField;
    PhonesModelDataSetPhoneNumber: TStringField;
    PhonesDataSource: TDataSource;
    UnimDBGrid1: TUnimDBGrid;
    UnimDBGrid2: TUnimDBGrid;
    UnimLabel2: TUnimLabel;
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
