unit VM.Pizza;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Pizza, iORM.MVVM.Interfaces;

type

  [diViewModelFor(TPizza)]
  [diImplements(IioViewModel, 'PIZZA')]
  TVMPizza = class(TVMBaseForForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
