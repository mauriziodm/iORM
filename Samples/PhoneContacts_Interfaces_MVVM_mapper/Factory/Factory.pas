unit Factory;

interface

uses
  iORM.MVVM.Interfaces, System.Classes, FMX.Controls;

type

  TGlobalFactory = class
  public
    class procedure GetPersonVVM(const AMasterViewModel: IioViewModel);
  end;

implementation

uses
  V.Main, iORM, V.Interfaces, System.Rtti, VM.Interfaces;

{ TGlobalFactory }

class procedure TGlobalFactory.GetPersonVVM(
  const AMasterViewModel: IioViewModel);
var
  LViewModel: IPersonViewModel;
  LView: TControl;
  LCurrentClassName: String;
begin
  // Get the view model
  LViewModel := io.di.LocateVM_byMasterVM<IPersonViewModel>('', AMasterViewModel).Get;
  AMasterViewModel.Commands.CopyCommands(LViewModel.Commands);
  // Get the class name of the current person
  LCurrentClassName := AMasterViewModel.ViewData.BindSourceAdapter.Current.ClassName;
  // Get the view passing the view model
  LView := (io.di.Locate<IPersonView>(LCurrentClassName).VM(LViewModel).Get as TControl);
  LView.Parent := ViewMain.TabItemPerson;
  ViewMain.acNext.Execute;
end;

end.
