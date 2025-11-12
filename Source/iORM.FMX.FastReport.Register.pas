unit iORM.FMX.FastReport.Register;

interface


procedure Register;

implementation

uses
  System.Classes,
  FMX.Controls,

  iORM.MVVM.FMX.FastReportModelPresenter

  ;




procedure Register;
begin
  GroupDescendentsWith(TioFastReportModelPresenterDataset, FMX.Controls.TControl);
  RegisterComponents('iORM - FastReport', [TioFastReportModelPresenterDataset]);
end;


end.
