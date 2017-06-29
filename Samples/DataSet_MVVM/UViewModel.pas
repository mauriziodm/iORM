unit UViewModel;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.DB.Components.ConnectionDef,
  iORM.Attributes, iORM.MVVM.Interfaces;

type

  [diImplements(IioViewModel), diAsSingleton]
  TViewModel = class(TioViewModel)
    ModelMasterPresenter: TioModelPresenter;
    ModelDetailPresenter: TioModelPresenter;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
