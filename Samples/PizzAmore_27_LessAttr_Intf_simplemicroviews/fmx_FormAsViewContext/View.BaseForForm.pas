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
    acPersist: TioBSPersistencePersist;
    acRevert: TioBSPersistenceRevert;
    BSMaster: TioPrototypeBindSourceMaster;
    acBack: TioBSCloseQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
