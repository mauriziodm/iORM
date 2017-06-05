unit V.ArticleList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  V.Base, iORM.MVVM.Components.ViewModelBridge, FMX.Controls.Presentation,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.Components, Data.Bind.ObjectScope,
  iORM.LiveBindings.ModelBindSource, Data.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  iORM.Attributes, V.Interfaces, FMX.Edit;

type

  [diImplements(IArticleListView)]
  TArticleListView = class(TBaseView, IArticleListView)
    ListView1: TListView;
    ButtonNew: TSpeedButton;
    MBSArticleList: TioModelBindSource;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    ToolBar2: TToolBar;
    GroupBoxArticleType: TGroupBox;

    [ioBindAction('acApplyFilters')]
    ButtonSearch: TSpeedButton;

    [ioBindAction('acFilterAll')]
    RadioButtonFilterAll: TRadioButton;

    [ioBindAction('acFilterMaterial')]
    RadioButtonFilterMaterlials: TRadioButton;

    [ioBindAction('acFilterProcess')]
    RadioButtonFilterProcesses: TRadioButton;

    [ioBindAction('acFilterProduct')]
    RadioButtonFilterProducts: TRadioButton;

    MBSFilters: TioModelBindSource;
    EditFilterCode: TEdit;
    EditFilterDescription: TEdit;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
