unit iORM.ETM.Factory;

interface

uses
  iORM.ETM.Engine;

type

  TIoEtmEngineRef = class of TIoEtmEngine;

  TioETMFactory = class
  public
    class function ETMEngine: TIoEtmEngineRef;
  end;

implementation

{ TioETMFactory }

class function TioETMFactory.ETMEngine: TIoEtmEngineRef;
begin
  Result := TIoEtmEngine;
end;

end.
