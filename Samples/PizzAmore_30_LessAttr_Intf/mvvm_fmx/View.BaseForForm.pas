unit View.BaseForForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Objects, iORM, iORM.Attributes, iORM.CommonTypes,
  iORM.MVVM.Interfaces, iORM.MVVM.ViewModelBridge, System.Actions, FMX.ActnList, iORM.StdActions.Fmx, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.MVVM.ModelBindSource;

type

  TViewBaseForForm = class(TFrame)
    RectangleTitle: TRectangle;
    LabelTitle: TLabel;
    ButtonBack: TSpeedButton;
    Rectangle1: TRectangle;
    ButtonRevert: TSpeedButton;
    ButtonSave: TSpeedButton;
    ActionList1: TActionList;
    acBack: TioViewAction;
    acPersist: TioViewAction;
    acRevert: TioViewAction;
    VMBridge: TioViewModelBridge;
    MBSMaster: TioModelBindSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
