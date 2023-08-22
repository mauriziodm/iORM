unit View.ETM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, iORM,
  iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList,
  iORM.StdActions.Vcl, ETM.Repository;

type

  [diViewFor(TEtmRepository)]
  TViewETM = class(TFrame)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    ButtonRevert: TSpeedButton;
    GridCustomers: TDBGrid;
    PanelDiff: TPanel;
    Label3: TLabel;
    DiffMemo: TDBMemo;
    PanelEntityInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBTextEntityClassName: TDBText;
    DBTextEntityID: TDBText;
    Splitter1: TSplitter;
    ioViewModelBridge1: TioViewModelBridge;
    BS_ETM: TioModelDataSet;
    SourceETM: TDataSource;
    BS_ETMDateAndTime: TDateTimeField;
    BS_ETMEntityClassName: TStringField;
    BS_ETMEntityID: TIntegerField;
    BS_ETMSmartEntityVersion: TStringField;
    BS_ETMSmartUser: TStringField;
    BS_ETMSmartEventType: TStringField;
    BS_ETMDiffOneWay: TStringField;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acEtmRevertToVersion: TioViewAction;
  private
  public
  end;

implementation

{$R *.dfm}

end.
