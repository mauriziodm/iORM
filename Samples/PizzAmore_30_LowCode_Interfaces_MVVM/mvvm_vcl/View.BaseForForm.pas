unit View.BaseForForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces,
  Data.DB, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl;

type
  TViewBaseForForm = class(TFrame)
    PanelMain: TPanel;
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acPersist: TioViewAction;
    acRevert: TioViewAction;
    BSMaster: TioModelDataSet;
    VMBridge: TioViewModelBridge;
    SourceMaster: TDataSource;
  private
  public
  end;

implementation

{$R *.dfm}

end.
