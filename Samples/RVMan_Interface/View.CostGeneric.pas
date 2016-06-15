unit View.CostGeneric;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Data.Bind.GenData, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, FMX.DateTimeCtrls,
  FMX.ListBox, FMX.Edit, FMX.Layouts, FMX.Memo, System.Actions, FMX.ActnList,
  FMX.Controls.Presentation;

type
  TViewMode = (VMNormal, VMEdit);

  TViewCostGeneric = class(TFrame)
    BSCost: TioPrototypeBindSource;
    ToolBar6: TToolBar;
    Label3: TLabel;
    SBBack: TSpeedButton;
    SBEdit: TSpeedButton;
    SBPost: TSpeedButton;
    SBCancel: TSpeedButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    eDescrizione: TEdit;
    ListBoxItemDataPartenza: TListBoxItem;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    ListBoxItem3: TListBoxItem;
    eImporto: TEdit;
    LinkControlToField3: TLinkControlToField;
    ActionList1: TActionList;
    acBack: TAction;
    acCancel: TAction;
    acPost: TAction;
    acEdit: TAction;
    eData: TEdit;
    LinkControlToField2: TLinkControlToField;
    procedure acBackExecute(Sender: TObject);
    procedure acCancelExecute(Sender: TObject);
    procedure acPostExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
  private
    { Private declarations }
    FViewMode: TViewMode;
    FPippo: Boolean;
  protected
    procedure SetViewMode(AViewMode:TViewMode);
  public
    { Public declarations }
    constructor Create(AOwner:TComponent; AViewMode:TViewMode=VMNormal); overload;
  published
    property Pippo:Boolean read FPippo write FPippo;
  end;

implementation

{$R *.fmx}

uses Main;

procedure TViewCostGeneric.acBackExecute(Sender: TObject);
begin
  MainForm.ChangeTabActionToCostList.ExecuteTarget(MainForm.TabItemCostList);
  Self.Owner.RemoveComponent(Self);
  Self.Free;
end;

procedure TViewCostGeneric.acCancelExecute(Sender: TObject);
begin
  BSCost.Cancel;
  Self.SetViewMode(VMNormal);
end;

procedure TViewCostGeneric.acEditExecute(Sender: TObject);
begin
  BSCost.Edit;
  Self.SetViewMode(VMEdit);
end;

procedure TViewCostGeneric.acPostExecute(Sender: TObject);
begin
  BSCost.Post;
  Self.SetViewMode(VMNormal);
end;

constructor TViewCostGeneric.Create(AOwner:TComponent; AViewMode:TViewMode);
begin
  inherited Create(AOwner);
  Self.SetViewMode(AViewMode);
end;

procedure TViewCostGeneric.SetViewMode(AViewMode: TViewMode);
begin
  FViewMode := AViewMode;
  case AViewMode of
    VMNormal: begin
      acBack.Visible := True;
      acEdit.Visible := True;
      acPost.Visible := False;
      acCancel.Visible := False;
    end;
    VMEdit: Begin
      acBack.Visible := False;
      acEdit.Visible := False;
      acPost.Visible := True;
      acCancel.Visible := True;
    End;
  end;
end;

end.
