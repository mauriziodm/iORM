unit V.Micro.Material;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, iORM.MVVM.Components.ViewModelBridge,
  Data.Bind.Components, Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource,
  Data.Bind.GenData, iORM.Attributes, V.Interfaces, FMX.Edit, FMX.EditBox,
  FMX.SpinBox, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt;

type

  [diImplements(IMicroArticleView, 'TBOMItemMaterial')]
  TMicroMaterialView = class(TFrame, IMicroArticleView)

    [ioBindAction('acEditArticle')]
    ButtonShow: TSpeedButton;

    LabelCode: TLabel;
    LabelDescription: TLabel;
    MicroVMBridge: TioViewModelBridge;
    MBSBOMItem: TioModelBindSource;
    MBSBOMArticle: TioModelBindSource;
    LabelCost: TLabel;
    Label2: TLabel;
    SpinBoxQty: TSpinBox;
    Label1: TLabel;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    LinkPropertyToFieldText4: TLinkPropertyToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
