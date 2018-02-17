unit V.Person;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniButton, uniBitBtn, uniSpeedButton,
  uniGUIBaseClasses, uniPanel, uniLabel, uniEdit, uniDBEdit, uniBasicGrid,
  uniDBGrid, iORM.MVVM.Components.ViewModelBridge, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  M.Model, M.AnotherModel, iORM.Attributes;

type

  [diViewFor(TPerson), diViewFor(TAnotherPerson)]
  [ioUniBindAction('ButtonBack', 'acClose')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  TViewPerson = class(TUniFrame)
    UniPanel1: TUniPanel;
    ButtonPost: TUniSpeedButton;
    ButtonBack: TUniSpeedButton;
    UniPanel2: TUniPanel;
    UniLabel1: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniLabel2: TUniLabel;
    UniDBEdit2: TUniDBEdit;
    UniLabel3: TUniLabel;
    UniDBEdit3: TUniDBEdit;
    UniPanel3: TUniPanel;
    UniLabel4: TUniLabel;
    UniDBEdit4: TUniDBEdit;
    UniPanel4: TUniPanel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniDBGrid1: TUniDBGrid;
    VMBridge: TioViewModelBridge;
    PersonModelDataSet: TioModelDataSet;
    PhonesModelDataSet: TioModelDataSet;
    PersonModelDataSetID: TIntegerField;
    PersonModelDataSetFirstName: TStringField;
    PersonModelDataSetLastName: TStringField;
    PersonModelDataSetClassNameProp: TStringField;
    PhonesModelDataSetPhoneType: TStringField;
    PhonesModelDataSetPhoneNumber: TStringField;
    PersonDataSource: TDataSource;
    PhonesDataSource: TDataSource;
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
