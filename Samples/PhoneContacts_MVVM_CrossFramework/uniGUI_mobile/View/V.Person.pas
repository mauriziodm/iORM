unit V.Person;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, unimButton,
  uniGUIBaseClasses, uniGUImJSForm, unimPanel, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniLabel, unimLabel, uniEdit, uniDBEdit,
  unimDBEdit, M.Model, M.AnotherModel, iORM.Attributes;

type

  [diViewFor(TPerson), diViewFor(TAnotherPerson)]
  [ioUniBindAction('ButtonBack', 'acClose')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  TViewPerson = class(TUniFrame)
    VMBridge: TioViewModelBridge;
    PersonModelDataSet: TioModelDataSet;
    PersonModelDataSetID: TIntegerField;
    PersonModelDataSetFirstName: TStringField;
    PersonModelDataSetLastName: TStringField;
    PersonModelDataSetClassNameProp: TStringField;
    PhonesModelDataSet: TioModelDataSet;
    PhonesModelDataSetPhoneType: TStringField;
    PhonesModelDataSetPhoneNumber: TStringField;
    PersonDataSource: TDataSource;
    PhonesDataSource: TDataSource;
    TopPanel: TUnimPanel;
    ButtonPost: TUnimButton;
    ButtonBack: TUnimButton;
    UnimLabel1: TUnimLabel;
    UnimPanel1: TUnimPanel;
    UnimDBEdit1: TUnimDBEdit;
    UnimLabel2: TUnimLabel;
    UnimLabel3: TUnimLabel;
    UnimDBEdit2: TUnimDBEdit;
    UnimLabel4: TUnimLabel;
    UnimDBEdit3: TUnimDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}



{ TViewPerson }

constructor TViewPerson.Create(AOwner: TComponent);
begin
  inherited;
  PersonModelDataSet.Open;
  PhonesModelDataSet.Open;
end;

end.
