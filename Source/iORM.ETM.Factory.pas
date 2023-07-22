unit iORM.ETM.Factory;

interface

uses
  iORM.ETM.Engine, iORM.Context.Interfaces, iORM.ETM.Interfaces;

type

  TIoEtmEngineRef = class of TIoEtmEngine;

  TioETMFactory = class
  public
    class function ETMEngine: TIoEtmEngineRef;
    class function NewInsertTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
    class function NewUpdateTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
    class function NewDeleteTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
  end;

implementation

uses
  iORM.ETM.TimeSlot;

{ TioETMFactory }

class function TioETMFactory.ETMEngine: TIoEtmEngineRef;
begin
  Result := TIoEtmEngine;
end;

class function TioETMFactory.NewDeleteTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
begin
  Result := TioEtmTimeSlot.Create(AContext, tsDelete, ctNoConflict);
end;

class function TioETMFactory.NewInsertTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
begin
  Result := TioEtmTimeSlot.Create(AContext, tsInsert, ctNoConflict);
end;

class function TioETMFactory.NewUpdateTimeSlot(const AContext: IioContext): IioEtmTimeSlot;
begin
  Result := TioEtmTimeSlot.Create(AContext, tsUpdate, ctNoConflict);
end;

end.
