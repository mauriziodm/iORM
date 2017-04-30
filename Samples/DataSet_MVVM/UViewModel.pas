unit UViewModel;

interface

uses
  System.SysUtils, System.Classes, iORM.MVVM.ViewModelBase,
  iORM.MVVM.Components.ModelPresenter, iORM.DB.Components.ConnectionDef,
  iORM.Attributes, iORM.MVVM.Interfaces;

type
  // NB: Se il ViewModel deve essere Singleton allora bisogna
  //      dichiarare esplicitamente che implementa l'interfaccia IInterface
  //      altrimenti il Reference counting non funziona correttamente perhchè
  //      eserue il _AddRef del TComponent invece di quello del TioViewModel.
  //      (bug di Delphi?)
  [diImplements(IioViewModel), diAsSingleton]
  TViewModel = class(TioViewModel)
    SQLiteConn: TioSQLiteConnectionDef;
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
