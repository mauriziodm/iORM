unit V.Process;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, V.Material, Data.DB, Model.Process,
  iORM.DB.Components.DataSet.Base, iORM.DB.Components.DataSet.ModelDataSet,
  iORM.MVVM.Components.ViewModelBridge, uniGUIClasses, uniEdit, uniDBEdit,
  uniLabel, uniDBText, uniButton, uniBitBtn, uniSpeedButton, uniGUIBaseClasses,
  uniPanel, iORM.Attributes;

type

  [ioUniBindAction('ButtonClose', 'acBack')]
  [ioUniBindAction('ButtonPost', 'acPost')]
  [diViewFor(TProcess)]
  TProcessView = class(TMaterialView)
    UniLabel5: TUniLabel;
    UniDBEdit5: TUniDBEdit;
    MDSArticleTime: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
