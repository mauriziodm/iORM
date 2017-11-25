unit V.Micro.Process;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Micro.Material, Data.Bind.GenData,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, Data.Bind.Components, Data.Bind.ObjectScope, Model.BOMItems,
  iORM.LiveBindings.ModelBindSource, Data.DB, iORM.DB.Components.DataSet.Base,
  iORM.DB.Components.DataSet.ModelDataSet, iORM.MVVM.Components.ViewModelBridge,
  uniGUIClasses, uniSpinEdit, uniLabel, uniDBText, uniButton, uniGUIBaseClasses,
  uniPanel, iORM.Attributes, uniEdit, uniDBEdit;

type

  [ioUniBindAction('ButtonShow', 'acEditArticle')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  [diViewFor(TBOMItemProcess)]
  TMicroProcessView = class(TMicroMaterialView)
    UniLabel3: TUniLabel;
    UniDBText5: TUniDBText;
    MDSArticleTime: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
