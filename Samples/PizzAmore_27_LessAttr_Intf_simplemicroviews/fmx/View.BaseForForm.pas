unit View.BaseForForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, System.Actions, FMX.ActnList,
  iORM.StdActions.Fmx, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.PrototypeBindSource.Custom, iORM.LiveBindings.PrototypeBindSource.Master;

type
  TViewBaseForForm = class(TFrame)
    ActionList1: TActionList;
    Rectangle1: TRectangle;
    ButtonRevert: TSpeedButton;
    ButtonSave: TSpeedButton;
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    acBack: TAction;
    acPersist: TioBSPersistencePersist;
    acRevert: TioBSPersistenceRevert;
    BSMaster: TioPrototypeBindSourceMaster;
    procedure acBackExecute(Sender: TObject);
  private
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.fmx}

procedure TViewBaseForForm.acBackExecute(Sender: TObject);
begin
  Free;
end;

constructor TViewBaseForForm.Create(AOwner: TComponent);
begin
  inherited;
//  BSMaster.Open;
end;

end.
