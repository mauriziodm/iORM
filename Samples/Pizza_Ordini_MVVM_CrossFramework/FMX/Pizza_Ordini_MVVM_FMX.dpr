program Pizza_Ordini_MVVM_FMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormStart in 'FormStart.pas' {StartForm},
  Model.Customer in '..\Commons\Model\Model.Customer.pas',
  Model.Order in '..\Commons\Model\Model.Order.pas',
  UnitCreateSampleData in '..\Commons\UnitCreateSampleData.pas',
  iORM.MVVM.ViewModelBase in '..\..\..\Source\iORM.MVVM.ViewModelBase.pas' {ioViewModel: TDataModule},
  VM.Customer.Micro in '..\Commons\ViewModel\VM.Customer.Micro.pas' {CustomerMicroVM: TDataModule},
  V.Customer.Micro in 'View\V.Customer.Micro.pas' {CustomerMicroView: TFrame},
  VM.Order in '..\Commons\ViewModel\VM.Order.pas' {OrderVM: TDataModule},
  VM.OrderList in '..\Commons\ViewModel\VM.OrderList.pas' {OrderListVM: TDataModule},
  V.Base in 'View\V.Base.pas' {BaseView: TFrame},
  V.Order in 'View\V.Order.pas' {OrderView: TFrame},
  Model.OrderItem in '..\Commons\Model\Model.OrderItem.pas',
  ModelInterfaces in '..\Commons\Model\ModelInterfaces.pas',
  V.OrderList in 'View\V.OrderList.pas' {OrderListView: TFrame};

{$R *.res}

{$STRONGLINKTYPES ON}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.CreateForm(TStartForm, StartForm);
  Application.Run;
end.
