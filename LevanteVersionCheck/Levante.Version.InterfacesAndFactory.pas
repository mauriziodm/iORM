unit Levante.Version.InterfacesAndFactory;

interface

type

  ILevDBVersionCheck = interface
    ['{AC4658D9-32C4-4089-A7D5-C2E22848E8C0}']
    function GetDBVer: Integer;
    function UpdateDBVer(const ANewVersion: Integer): boolean;
  end;

  TLevDBVersionFactory = class
  public
    class function NewDBVersionCheck: ILevDBVersionCheck;
  end;

implementation

uses Levante.Version.LevGen;

{ TLevDBVersionFactory }

class function TLevDBVersionFactory.NewDBVersionCheck: ILevDBVersionCheck;
begin
  result := TLevDBVersionCheck_LevGen_IBO.Create;
end;

end.
