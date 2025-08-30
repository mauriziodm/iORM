unit ETM.Repository;

interface

uses
  iORM;

type

  [etmRepository('ETM_REPOSITORY')]
  TEtmTimeSlot = class(TioEtmCustomTimeSlot)
  end;

implementation

end.
