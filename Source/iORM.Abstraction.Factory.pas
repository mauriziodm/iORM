unit iORM.Abstraction.Factory;

interface

uses
  iORM.Abstraction.Interfaces;

type

  TioAbstractionFactory = class
  public
    class function NewSessionData: IioSessionData; static;
  end;

implementation

{ TioAbstractionFactory }

class function TioAbstractionFactory.NewSessionData: IioSessionData;
begin
  Result := TioSessionData.Create;
end;

end.
