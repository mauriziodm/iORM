unit VM.Order.List;

interface

uses
  System.SysUtils, System.Variants, System.Classes, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.VMAction,
  iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Model.Interfaces,
  iORM.MVVM.Interfaces;

type

  [diViewModelFor(IOrder)]
  TVMOrderList = class(TVMBaseForList)
    acWhereShowHistory: TioVMActionBSShowOrSelect;
    acWherePersist: TioVMActionBSPersistencePersist;
    procedure BSWhereAfterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType);
  private
  public
  end;

implementation

{$R *.dfm}

procedure TVMOrderList.BSWhereAfterSelectionInterface(const ASender: TObject; var ASelected: IInterface; var ASelectionType: TioSelectionType);
begin
  BSWhere.BuildWhere;
end;

end.
