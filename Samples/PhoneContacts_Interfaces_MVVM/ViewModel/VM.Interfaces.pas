unit VM.Interfaces;

interface

uses
  iORM.MVVM.Interfaces;

type

  IPersonsViewModel = interface(IIoViewModel)
    ['{DCA7F684-A2DF-4147-A3DC-B928462BB03B}']
    // JSON property
    procedure SetJSON(const Value: String);
    function GetJSON: String;
    property JSON:String read GetJSON write SetJSON;
    // JSONPresent property
    function GetJSONPresent: Boolean;
    property JSONPresent:Boolean read GetJSONPresent;
  end;

implementation

end.
