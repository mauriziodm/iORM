unit iORM.StdActions.Interfaces;

interface

uses
  System.Classes;

type

  IioBSCloseQuery = interface
    ['{BFBCB5A6-2406-435A-8C31-91593BDD9D63}']
    procedure _OnCloseQueryEventHandler(Sender: TObject; var CanClose: Boolean); // Must be published
  end;

  TioBSCloseQueryCommonBehaviour = class
  public
    class function ExtractBSCloseQueryStdAction(const AView: TComponent): IioBSCloseQuery;
  end;

implementation

uses
  System.SysUtils;

{ TioBSCloseQueryCommonBehaviour }

class function TioBSCloseQueryCommonBehaviour.ExtractBSCloseQueryStdAction(const AView: TComponent): IioBSCloseQuery;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AView.ComponentCount - 1 do
    if Supports(AView.Components[I], IioBSCloseQuery, Result) then
      Exit;
end;

end.
