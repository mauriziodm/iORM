unit View.BaseForForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniLabel, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses, uniPanel, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, iORM.MVVM.ModelDataSet;

type
  TViewBaseForForm = class(TUniFrame)
    PanelTop: TUniPanel;
    ButtonBack: TUniSpeedButton;
    LabelTitle: TUniLabel;
    PanelBottom: TUniPanel;
    ButtonDelete: TUniSpeedButton;
    ButtonAdd: TUniSpeedButton;
    BSSource: TDataSource;
    ActionList1: TActionList;
    VMBridge: TioViewModelBridge;
    BSMaster: TioModelDataSet;
    acBack: TioViewAction;
    acPersist: TioViewAction;
    acRevert: TioViewAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



end.
