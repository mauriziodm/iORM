unit iORM.FastReport.FMX.Register;

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
  RegisterComponents('iORM - FastReport', [TioFastReportModelPresenterDataset]);

  GroupDescendentsWith(TioFastReportModelPresenterDataset, FMX.Controls.TControl);
end;


end.
