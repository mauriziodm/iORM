unit LevGoogle;

interface

uses
  Classes;

const
  LevGoogleDllName = 'LevGoogle.dll';

  procedure TestProva;

implementation

  procedure TestProva; external LevGoogleDllName name 'TestProva';

end.
