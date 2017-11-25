unit V.Material;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIFrame, iORM.Attributes, Data.DB, Model.Material,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniGUIBaseClasses, uniPanel, uniButton,
  uniBitBtn, uniSpeedButton, uniLabel, uniDBText, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, uniEdit, uniDBEdit;

type

  [ioUniBindAction('ButtonClose', 'acBack')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  [diViewFor(TMaterial)]
  TMaterialView = class(TUniFrame)
    ButtonClose: TUniSpeedButton;
    ButtonPost: TUniSpeedButton;
    VMBridge: TioViewModelBridge;
    MDSArticle: TioModelDataSet;
    MDSArticleCode: TStringField;
    MDSArticleDescription: TStringField;
    MDSArticleUM: TStringField;
    MDSArticleCost: TCurrencyField;
    MDSArticleArticleType: TStringField;
    DSArticle: TDataSource;
    UniPanel1: TUniPanel;
    UniDBText1: TUniDBText;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniDBEdit1: TUniDBEdit;
    UniDBEdit2: TUniDBEdit;
    UniDBEdit3: TUniDBEdit;
    UniDBEdit4: TUniDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}



{ TMaterialView }

constructor TMaterialView.Create(AOwner: TComponent);
begin
  inherited;
  MDSArticle.Open;
end;

end.
