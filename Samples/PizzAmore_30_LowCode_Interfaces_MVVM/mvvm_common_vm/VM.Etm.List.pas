unit VM.Etm.List;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VM.BaseForList, iORM, iORM.Attributes, iORM.CommonTypes, iORM.Where.Interfaces, iORM.MVVM.Interfaces,
  iORM.MVVM.VMAction, iORM.MVVM.ModelPresenter.Custom, iORM.MVVM.ModelPresenter.Master, Etm.Repository;

type

  [diViewModelFor(TEtmTimeSlot, 'LIST')]
  TVMEtmList = class(TVMBaseForList)
    acEtmRevertToDB: TioVMActionBS_ETM_RevertToBindSource;
    acEtmRevertToObj: TioVMActionBS_ETM_RevertToObject;
    acShowRevertedObj: TioVMActionBSShowOrSelect;
  private
  public
  end;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
