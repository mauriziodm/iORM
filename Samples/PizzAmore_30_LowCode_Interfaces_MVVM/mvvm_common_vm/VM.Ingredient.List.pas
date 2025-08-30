unit VM.Ingredient.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Interfaces,
  iORM.MVVM.VMAction, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces;

type

  [diViewModelFor(IIngredient)]
  TVMIngredientList = class(TVMBaseForList)
    procedure acAppendNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TVMIngredientList.acAppendNewInstanceAsInterface(const ASender: TObject; out NewInstance: IInterface);
begin
  NewInstance := io.Create<IIngredient>;
end;

end.
