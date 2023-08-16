unit View.BaseForList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl,
  iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, Data.DB, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet,
  Vcl.Mask;

type
  TViewBaseForList = class(TFrame)
    PanelTop: TPanel;
    ButtonSelect: TSpeedButton;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonAdd: TSpeedButton;
    ButtonDelete: TSpeedButton;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acShowOrSelect: TioViewAction;
    acAdd: TioViewAction;
    acDelete: TioViewAction;
    VMBridge: TioViewModelBridge;
    BSMaster: TioModelDataSet;
    SourceMaster: TDataSource;
    PanelWhere: TPanel;
    ButtonSearch: TSpeedButton;
    ButtonClear: TSpeedButton;
    BSWhere: TioModelDataSet;
    SourceWhere: TDataSource;
    acBuildWhere: TioViewAction;
    acClearWhere: TioViewAction;
  private
  public
  end;

implementation

{$R *.dfm}

end.
