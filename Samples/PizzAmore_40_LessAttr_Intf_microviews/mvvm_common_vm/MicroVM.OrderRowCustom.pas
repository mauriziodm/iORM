unit MicroVM.OrderRowCustom;

interface

uses
  System.SysUtils,
  System.Classes,
  iORM,
  iORM.Attributes,
  iORM.CommonTypes,
  iORM.Where.Interfaces,
  iORM.MVVM.Interfaces,
  iORM.MVVM.ViewModel,
  Model.OrderRow, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Detail, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.VMAction;

type

  [diViewModelFor(TCustomOrderRow)]
  TMicroVMOrderRowCustom = class(TioViewModel)
    MPOrderRow: TioModelPresenterDetail;
    acDelete: TioVMAction;
    procedure acDeleteExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TMicroVMOrderRowCustom.acDeleteExecute(Sender: TObject);
begin
  MPOrderRow.Delete;
  CloseViews;
end;

end.
