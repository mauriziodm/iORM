unit Bancolini_B31WIN32;

interface

  function B30XferRx(CommandStr:PAnsiChar): Integer; stdcall;
  function B30XferTx(CommandStr:PAnsiChar): Integer; stdcall;

implementation

  function B30XferRx; external 'B31win32.dll' name 'B30XferRx';
  function B30XferTx; external 'B31win32.dll' name 'B30XferRx';

end.
