unit Form.Etm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.Where.Interfaces, iORM.StdActions.Vcl, System.Actions, Vcl.ActnList, Data.DB, iORM.DB.DataSet.Base, iORM.DB.DataSet.Custom, iORM.DB.DataSet.Master,
  ETM.Repository;

type

  [diSimpleViewFor(TEtmRepository)]
  TFormEtm = class(TForm)
    PanelTop: TPanel;
    ButtonBack: TSpeedButton;
    LabelTitle: TLabel;
    PanelBottom: TPanel;
    ButtonRevert: TSpeedButton;
    ButtonPersist: TSpeedButton;
    Label1: TLabel;
    DBEditID: TDBEdit;
    Label2: TLabel;
    DBEditName: TDBEdit;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    PageControl1: TPageControl;
    TabSheetTimeSlotData: TTabSheet;
    TabSheetEneityState: TTabSheet;
    DBMemoEntityState: TDBMemo;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit9: TDBEdit;
    Label13: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    Label15: TLabel;
    DBEdit11: TDBEdit;
    Label16: TLabel;
    DBEdit12: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label17: TLabel;
    DBCheckBox5: TDBCheckBox;
    Label18: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Label19: TLabel;
    DBEdit15: TDBEdit;
    Label20: TLabel;
    DBEdit16: TDBEdit;
    DSTimeSlot: TioDataSetMaster;
    DSTimeSlotID: TIntegerField;
    SourceTimeSlot: TDataSource;
    ActionList1: TActionList;
    acPersist: TioBSPersistencePersist;
    acBack: TioBSCloseQuery;
    DSTimeSlotDateAndTime: TDateTimeField;
    DSTimeSlotEntityClassname: TStringField;
    DSTimeSlotEntityID: TIntegerField;
    DSTimeSlotEntityVersion: TIntegerField;
    DSTimeSlotEntityFromVersion: TIntegerField;
    DSTimeSlotEntityUpdated: TDateTimeField;
    DSTimeSlotUserID: TIntegerField;
    DSTimeSlotUserName: TStringField;
    DSTimeSlotActionType: TStringField;
    DSTimeSlotIntentType: TStringField;
    DSTimeSlotConflictDetected: TBooleanField;
    DSTimeSlotConflictState: TStringField;
    DSTimeSlotConflictStrategyName: TStringField;
    DSTimeSlotBlindLevel: TByteField;
    DSTimeSlotBlindLevel_AutoUpdateProps: TBooleanField;
    DSTimeSlotBlindLevel_DetectObjExists: TBooleanField;
    DSTimeSlotBlindLevel_DetectConflicts: TBooleanField;
    DSTimeSlotConflictCheckedByHuman: TBooleanField;
    DSTimeSlotConflictCheckedByHuman_ID: TIntegerField;
    DSTimeSlotConflictCheckedByHuman_Name: TStringField;
    DSTimeSlotConflictCheckedByHuman_DateTime: TDateTimeField;
    DSTimeSlotTimeSlotSynchroState: TStringField;
    acRevert: TioBSPersistenceRevert;
    DSTimeSlotEntityState: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TFormEtm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

end.
