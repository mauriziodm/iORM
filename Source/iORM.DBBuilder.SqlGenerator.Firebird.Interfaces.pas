unit iORM.DBBuilder.SqlGenerator.Firebird.Interfaces;

interface

type
  IioDBBuilderSqlGeneratorFirebird = interface
    ['{BF44733E-AA47-4885-9544-170E600EB346}']

    // Sequences
    function BuildAddSequenceSql(const ASequenceName: String; const ACreatingNewDatabase: boolean): string;
    function BuildDropSequenceSql(const ASequenceName: string): string;
    function BuildSequenceExistsSql(const ASequenceName: string): string;

    // Version compatibility
    function SupportsSetDropNotNull: Boolean;
    function GetFirebirdVersion: string;
    function GetFirebirdMajorVersion: Integer;
    function GetFirebirdMinorVersion: Integer;

    property FirebirdVersion: string read GetFirebirdVersion;
    property FirebirdMajorVersion: Integer read GetFirebirdMajorVersion;
    property FirebirdMinorVersion: Integer read GetFirebirdMinorVersion;
  end;

implementation

end.
