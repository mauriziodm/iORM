unit iORM.Context.RelationAutoDetect;

interface

type

  TioRelationAutoDetect = class
  public
    class procedure AutomaticRelationDetection;
  end;

implementation

uses
  iORM.Context.Container, iORM.Context.Map.Interfaces, iORM.Context.Properties.Interfaces;

{ TioRelationAutoDetect }

class procedure TioRelationAutoDetect.AutomaticRelationDetection;
var
  LMapSlot: TioMapSlot;
  LMap: IioMap;
  LProp: IioContextProperty;
begin
  for LMapSlot in TioMapContainer.GetContainer.Values do
  begin
    LMap := LMapSlot.GetMap;
    for LProp in LMap.GetProperties do
    begin

    end;
  end;
end;

end.
