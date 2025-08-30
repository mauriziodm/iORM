unit VM.Pizza;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForForm, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Pizza, iORM.MVVM.Interfaces, iORM.MVVM.ModelPresenter.Detail;

type

  [diViewModelFor(TPizza), diImplements(IioViewModel, 'PIZZA')]
  TVMPizza = class(TVMBaseForForm)
    BSIngredients: TioModelPresenterDetail;
    acShowIngredientSelector: TioVMActionBSShowOrSelect;
    acDeleteIngredient: TioVMActionBSDelete;
    procedure BSIngredientsReceiveSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType;
      var ADone: Boolean);
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses
  Model.Pizza.IngredientRow, Model.Interfaces;

{$R *.dfm}

procedure TVMPizza.BSIngredientsReceiveSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType;
  var ADone: Boolean);
begin
  ASelected := TPizzaIngredientRow.Create( ASelected as IIngredient, 0 );
end;

end.
