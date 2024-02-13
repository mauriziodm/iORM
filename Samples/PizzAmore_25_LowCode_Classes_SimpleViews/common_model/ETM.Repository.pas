unit ETM.Repository;

interface

uses
  iORM;

type

  [etmRepository('ETM_REPOSITORY')]
  TEtmRepository = class(TioEtmCustomTimeSlot)
  private
    FCity: String;
    FCustomerID: Integer;
  public
    property City: String read FCity write FCity;
    property CustomerID: Integer read FCustomerID write FCustomerID;
  end;

implementation

end.
