unit View.BaseForList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel;

type
  TViewBaseForList = class(TUniFrame)
    PanelTop: TUniPanel;
    PanelBottom: TUniPanel;
    PanelWhere: TUniPanel;
    ButtonBack: TUniSpeedButton;
    ButtonSelect: TUniSpeedButton;
    ButtonDelete: TUniSpeedButton;
    ButtonAdd: TUniSpeedButton;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acDelete: TioViewAction;
    acAdd: TioViewAction;
    acShowOrSelect: TioViewAction;
    acBuildWhere: TioViewAction;
    acClearWhere: TioViewAction;
    BSMaster: TioModelDataSet;
    VMBridge: TioViewModelBridge;
    SourceMaster: TDataSource;
    BSWhere: TioModelDataSet;
    SourceWhere: TDataSource;
    LabelTitle: TUniLabel;
    PanelWhereButtons: TUniPanel;
    ButtonSearch: TUniSpeedButton;
    ButtonClear: TUniSpeedButton;
  private
  public
  end;

implementation

{$R *.dfm}

end.
