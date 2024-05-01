unit Wait;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls, FMX.Objects;

type
  TViewWait = class(TFrame)
    Rectangle1: TRectangle;
    AniIndicator1: TAniIndicator;
  private
    class var FInstance: TViewWait;
    class var FRefCount: Integer;
  public
    class constructor Create;
    class procedure ShowWait(const AOwner: TComponent);
    class procedure HideWait;
  end;

implementation

{$R *.fmx}

{ TViewWait }

class constructor TViewWait.Create;
begin
  FInstance := nil;
  FRefCount := 0;
end;

class procedure TViewWait.HideWait;
begin
  Dec(FRefCount);
  if FRefCount = 0 then
    FInstance.Free;
end;

class procedure TViewWait.ShowWait(const AOwner: TComponent);
begin
  if FRefCount = 0 then
  begin
    FInstance := TViewWait.Create(AOwner);
    FInstance.SetParentComponent(AOwner);
    FInstance.Repaint;
  end;
  Inc(FRefCount);
end;

end.
