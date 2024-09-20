unit View.BaseForList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniButton, uniBitBtn, uniSpeedButton, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, uniLabel;

type
  TViewBaseForList = class(TUniFrame)
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
  private
  public
  end;

implementation

{$R *.dfm}

end.
