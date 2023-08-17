unit ETM.Repository;

interface

uses
  iORM;

type

  [etmRepository('ETM_REPOSITORY')]
  TEtmRepository = class(TioEtmCustomTimeSlot)
  end;

implementation

end.
