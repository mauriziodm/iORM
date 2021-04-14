unit DDT.WhereGenerator.LDE;

interface

uses
  DDT.WhereGenerator;

type

  TddtWhereGeneratorLDE = class(TddtWhereGenerator)
  public
    function GetSQL(const ASelected: Boolean): String; override;
  end;

implementation

uses
  System.SysUtils;

{ TddtWhereGeneratorLDE }

function TddtWhereGeneratorLDE.GetSQL(const ASelected: Boolean): String;
begin
  if ASelected then
    result := Format('OR TipoDoc = ''%s''', [DBDocTypeName])
  else
    result := '';
end;

end.
