unit iORM.DBBuilder.SqlGenerator.Firebird.Interfaces;

interface

type
  IioDBBuilderSqlGeneratorFirebird = interface
    ['{BF44733E-AA47-4885-9544-170E600EB346}']

    // Sequences
    function BuildSQL_AddSequence(const ASequenceName: String): string;
    function BuildSQL_DropSequence(const ASequenceName: string): string;
    function BuildSQL_SequenceExists(const ASequenceName: string): string;
  end;

implementation

end.
