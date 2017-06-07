unit V.ArticleList;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, Data.Bind.GenData,
  iORM.MVVM.Components.ViewModelBridge, Data.Bind.Components,
  Data.Bind.ObjectScope, iORM.LiveBindings.ModelBindSource, FMX.ListView,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, V.Interfaces, iORM.Attributes, FMX.MultiView;

type

  [diImplements(IArticleListView)]
  TArticleListView = class(TFrame, IArticleListView)

    [ioBindAction('acClose')]
    ButtonClose: TSpeedButton;

    ButtonNew: TSpeedButton;

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

    [ioBindAction('acNewMaterial')]
    ButtonNewMaterial: TSpeedButton;

    ButtonNewProduct: TSpeedButton;

    ButtonNewProcess: TSpeedButton;
    RectangleTop: TRectangle;
    LabelTitle: TLabel;
    RectangleFilters: TRectangle;
    EditFilterCode: TEdit;
    EditFilterDescription: TEdit;
    ListView1: TListView;
    MBSFilters: TioModelBindSource;
    MBSArticleList: TioModelBindSource;
    VMBridge: TioViewModelBridge;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    MultiView1: TMultiView;
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

procedure TArticleListView.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  VMBridge.Command['acEditArticle'].Execute;
end;

end.
