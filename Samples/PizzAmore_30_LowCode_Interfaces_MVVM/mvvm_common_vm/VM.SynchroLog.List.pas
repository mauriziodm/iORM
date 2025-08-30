unit VM.SynchroLog.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Interfaces,
  iORM.MVVM.VMAction, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, iORM.SynchroStrategy.EtmBased, iORM.MVVM.ModelPresenter.Detail;

type

  [diViewModelFor(TioEtmSynchroStrategy_LogItem, 'LIST')]
  TVMSynchroLogList = class(TVMBaseForList)
    BS_ETM: TioModelPresenterDetail;
    acShowTimeSlot: TioVMActionBSShowOrSelect;
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
