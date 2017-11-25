unit V.Micro.Material;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Model.BOMItems,
  uniGUIClasses, uniGUIFrame, uniGUIBaseClasses, uniPanel, uniButton, uniLabel,
  uniDBText, uniEdit, uniDBEdit, Data.DB, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, iORM.MVVM.Components.ViewModelBridge,
  iORM.Attributes, uniSpinEdit, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, Data.Bind.GenData, Data.Bind.EngExt,
  Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs, Vcl.Bind.Editors;

type

  [ioUniBindAction('ButtonShow', 'acEditArticle')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  [diViewFor(TBOMItemMaterial)]
  TMicroMaterialView = class(TUniFrame)
    ClientArea: TUniPanel;
    ButtonShow: TUniButton;
    ButtonPost: TUniButton;
    UniDBText1: TUniDBText;
    UniDBText2: TUniDBText;
    UniDBText3: TUniDBText;
    UniLabel1: TUniLabel;
    UniDBText4: TUniDBText;
    UniLabel2: TUniLabel;
    MicroVMBridge: TioViewModelBridge;
    MDSArticle: TioModelDataSet;
    MDSArticleCode: TStringField;
    MDSArticleDescription: TStringField;
    MDSArticleUM: TStringField;
    MDSArticleCost: TCurrencyField;
    DSArticle: TDataSource;
    BindingsList1: TBindingsList;
    EditQty: TUniDBNumberEdit;
    MDSItem: TioModelDataSet;
    MDSItemQty: TFloatField;
    DSItem: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent); override;
  end;

implementation

{$R *.dfm}



{ TMicroMaterialView }

constructor TMicroMaterialView.Create(AOwner: TComponent);
begin
  inherited;
  MDSItem.Open;
  MDSArticle.Open;
end;

end.
