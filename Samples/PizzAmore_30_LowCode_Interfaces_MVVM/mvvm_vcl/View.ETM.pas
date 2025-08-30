unit View.Etm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.MVVM.Interfaces, Data.DB, iORM.MVVM.ViewModelBridge,
  iORM.DB.DataSet.Base, iORM.MVVM.ModelDataSet, System.Actions, Vcl.ActnList, iORM.StdActions.Vcl, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  iORM.Where.Interfaces, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Mask, Etm.Repository;

type

  [diViewFor(TEtmTimeSlot)]
  TViewEtm = class(TViewBaseForForm)
    Label1: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    DBEditID: TDBEdit;
    DBEditName: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PageControl1: TPageControl;
    TabSheetTimeSlotData: TTabSheet;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    TabSheetEneityState: TTabSheet;
    DBMemoEntityState: TDBMemo;
    BSMasterID: TIntegerField;
    BSMasterDateAndTime: TDateTimeField;
    BSMasterEntityClassname: TStringField;
    BSMasterEntityID: TIntegerField;
    BSMasterEntityFromVersion: TIntegerField;
    BSMasterEntityToVersion: TIntegerField;
    BSMasterEntityUpdated: TDateTimeField;
    BSMasterEntityState: TStringField;
    BSMasterUserID: TIntegerField;
    BSMasterUserName: TStringField;
    BSMasterActionType: TStringField;
    BSMasterIntentType: TStringField;
    BSMasterConflictDetected: TBooleanField;
    BSMasterConflictState: TStringField;
    BSMasterConflictStrategyName: TStringField;
    BSMasterBlindLevel: TByteField;
    BSMasterBlindLevel_AutoUpdateProps: TBooleanField;
    BSMasterBlindLevel_DetectObjExists: TBooleanField;
    BSMasterBlindLevel_DetectConflicts: TBooleanField;
    BSMasterConflictCheckedByHuman: TBooleanField;
    BSMasterConflictCheckedByHuman_ID: TIntegerField;
    BSMasterConflictCheckedByHuman_Name: TStringField;
    BSMasterConflictCheckedByHuman_DateTime: TDateTimeField;
    BSMasterTimeSlotSynchroState: TStringField;
  private
  public
  end;

implementation

{$R *.dfm}

end.
