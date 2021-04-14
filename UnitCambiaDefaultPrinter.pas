unit UnitCambiaDefaultPrinter;

interface

uses Windows, WinSpool, SysUtils;

  procedure ChangeDefaultPrinter(const Name: string) ;

implementation

procedure ChangeDefaultPrinter(const Name: string) ;
var
    W2KSDP: function(pszPrinter: PChar): Boolean; stdcall;
    H: THandle;
    Size, Dummy: Cardinal;
    PI: PPrinterInfo2;
begin
    if (Win32Platform = VER_PLATFORM_WIN32_NT) and (Win32MajorVersion >= 5) then
    begin
      @W2KSDP := GetProcAddress(GetModuleHandle(winspl), 'SetDefaultPrinterA') ;
      if @W2KSDP = nil then RaiseLastOSError;
      if not W2KSDP(PChar(Name)) then RaiseLastOSError;
    end
    else
    begin
      if not OpenPrinter(PChar(Name), H, nil) then RaiseLastOSError;
      try
        GetPrinter(H, 2, nil, 0, @Size) ;
        if GetLastError <> ERROR_INSUFFICIENT_BUFFER then RaiseLastOSError;
        GetMem(PI, Size) ;
        try
          if not GetPrinter(H, 2, PI, Size, @Dummy) then RaiseLastOSError;
          PI^.Attributes := PI^.Attributes or PRINTER_ATTRIBUTE_DEFAULT;
          if not SetPrinter(H, 2, PI, PRINTER_CONTROL_SET_STATUS) then RaiseLastOSError;
        finally
          FreeMem(PI) ;
        end;
      finally
        ClosePrinter(H) ;
      end;
    end;
end; //ChangeDefaultPrinter

end.
