unit View.Etm.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Grids, Vcl.DBGrids, Etm.Repository;

type

  [diViewFor(TEtmTimeSlot, 'LIST')]
  TViewEtmList = class(TViewBaseForList)
    PanelDiff: TPanel;
    Label3: TLabel;
    DiffMemo: TDBMemo;
    Splitter1: TSplitter;
    GridCustomers: TDBGrid;
    PanelEntityInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    DBTextEntityClassName: TDBText;
    DBTextEntityID: TDBText;
    ButtonRevertToObj: TSpeedButton;
    BSMasterID: TIntegerField;
    BSMasterDateAndTime: TDateTimeField;
    BSMasterEntityClassName: TStringField;
    BSMasterEntityID: TIntegerField;
    BSMasterSmartEntityVersion: TStringField;
    BSMasterSmartUser: TStringField;
    BSMasterSmartActionType: TStringField;
    BSMasterSmartConflictInfo: TStringField;
    BSMasterSmartConflictCheckedByHuman: TStringField;
    BSMasterDiffOneWay: TStringField;
    acEtmRevertToDB: TioViewAction;
    acEtmRevertToObj: TioViewAction;
    ButtonRevertToDB: TSpeedButton;
  private
  public
  end;

implementation

{$R *.dfm}

end.
