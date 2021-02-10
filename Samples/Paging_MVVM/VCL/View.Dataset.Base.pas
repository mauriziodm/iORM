unit View.Dataset.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, iORM.MVVM.Components.ViewModelBridge, Data.DB,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet, iORM.Attributes, Vcl.StdCtrls;

type

  TViewDatasetBase = class(TFrame)
    ViewPanelTop: TPanel;
    LabelTitle: TLabel;
    VMBridge: TioViewModelBridge;
    MDSArticles: TioModelDataSet;
    DSArticles: TDataSource;
    MDSArticlesID: TIntegerField;
    MDSArticlesDescription: TStringField;
    MDSArticlesPrice: TCurrencyField;
    [ioBindAction('acPrevPage')]
    ButtonPreviousPage: TSpeedButton;
    [ioBindAction('acNextPage')]
    ButtonNextPage: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TFrameDatasetBase }

constructor TViewDatasetBase.Create(AOwner: TComponent);
begin
  inherited;
  MDSArticles.Open;
end;

end.
