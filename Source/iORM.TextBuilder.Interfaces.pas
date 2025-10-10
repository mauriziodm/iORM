unit iORM.TextBuilder.Interfaces;

interface


type
  IioTextBuilder = interface
    ['{555AD4CB-0872-4231-9422-11CC1AF00C66}']

    function GetText: string;

    // Add the text witout indentation and carriage return
    function Add(const AText: string; const Indent: boolean = false): IioTextBuilder;
    // Add the text with indentation and carriage return
    function AddLine(const AText: string): IioTextBuilder;
    function AddEmptyLine: IioTextBuilder;
    function DecIndent(const ADecrement: integer = 1): IioTextBuilder;
    function IncIndent(const AIncrement: integer = 1): IioTextBuilder;
    function Indent: IioTextBuilder;

    property Text: string read GetText;
  end;

implementation

end.
