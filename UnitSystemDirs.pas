unit UnitSystemDirs;

interface

  uses   Windows, ShlObj, ShellApi, SysUtils;

  function GetSpecialFolderPath(CallerHandle: THandle; CSIDL: Integer): PChar;
  function GetDesktopDirectory(CallerHandle: THandle): String;

implementation

function GetDesktopDirectory(CallerHandle: THandle): String;
begin
  Result := GetSpecialFolderPath(CallerHandle, CSIDL_DESKTOP);
end;


function GetSpecialFolderPath(CallerHandle: THandle; CSIDL: Integer): PChar;
var
  exInfo: TShellExecuteInfo;
  Buf: PChar;
begin
  // initialize all fields to 0
  FillChar(exInfo, SizeOf(exInfo), 0);
  with exInfo do
  begin
    cbSize := SizeOf(exInfo);
    fMask  := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_IDLIST;
    Wnd    := CallerHandle;
    nShow  := SW_SHOWNORMAL;
    Buf    := StrAlloc(MAX_PATH);
    SHGetSpecialFolderPath(wnd, Buf, CSIDL, True);
    Result := Buf;
  end;
end;




end.
