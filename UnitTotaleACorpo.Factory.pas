unit UnitTotaleACorpo.Factory;

interface

uses
  UnitTotaleACorpo.Interfaces, SchedaPreventiviOrdini;

type

  TTotaleCorpoFactory = class
  public
    class function NewTotaleCorpo(const ADoc:TPreventiviOrdiniForm): ITotaleCorpo;
  end;

implementation

uses
  UnitTotaleACorpo;

{ TTotaleACorpoFactory }

class function TTotaleCorpoFactory.NewTotaleCorpo(const ADoc: TPreventiviOrdiniForm): ITotaleCorpo;
begin
  Result := TTotaleCorpo.Create(ADoc);
end;

end.
