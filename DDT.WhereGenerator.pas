unit DDT.WhereGenerator;

interface

uses
  DDT.Interfaces;

type

  TddtWhereGenerator = class abstract (TInterfacedObject, IddtWhereGenerator)
  private
    FDBDocTypeName: String;
  protected
    property DBDocTypeName: string read FDBDocTypeName;
  public
    constructor Create(const ADBDocTypeName: String);
    function GetSQL(const ASelected: Boolean): String; virtual; abstract;
  end;

implementation

{ TddtWhereGenerator }

constructor TddtWhereGenerator.Create(const ADBDocTypeName: String);
begin
  inherited Create;
  FDBDocTypeName := ADBDocTypeName;
end;

end.
