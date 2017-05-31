unit ModelInterfaces;

interface

type

  IOrderItem = interface
    ['{0C6DD845-7E8C-417F-9F51-A98AF969CF0F}']
    // ListText property
    function GetListText:String;
    property ListText:String read GetListText;
    // Total property
    function GetTotal: Currency;
    property Total:Currency read GetTotal;
  end;

implementation

end.
