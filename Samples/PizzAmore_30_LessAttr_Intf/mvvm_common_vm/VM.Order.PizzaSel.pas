unit VM.Order.PizzaSel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.Order, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.ModelPresenter.Detail,
  iORM.MVVM.VMAction, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.MVVM.ViewModel;

type

  TVMOrderPizzaSel = class(TVMOrder)
    procedure ioViewModelViewPairing(const Sender: TioViewModel);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  Model.Interfaces;

{$R *.dfm}

procedure TVMOrderPizzaSel.ioViewModelViewPairing(const Sender: TioViewModel);
begin
  inherited;
  io.ShowAsSelector<IPizza>(MPMaster, VCProviderByName('VCProviderOrder'), 'embedded');
end;

end.
