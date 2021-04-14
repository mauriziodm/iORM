unit DataModuleStyles;

interface

uses
  SysUtils, Classes, Graphics, Types, cxContainer, cxEdit, cxClasses;

type
  TDMStyles = class(TDataModule)
    cxEditStyleController_Filters: TcxEditStyleController;
    cxEditStyleController_Filters_Date: TcxEditStyleController;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DrawGradient(Canvas: TCanvas; const ARect: TRect; FromColor, ToColor: TColor; AStepCount: Integer; IsVertical: Boolean = False);
  end;

var
  DMStyles: TDMStyles;

implementation

uses Windows;

{$R *.dfm}

procedure TDMStyles.DrawGradient(Canvas: TCanvas; const ARect: TRect; FromColor, ToColor: TColor; AStepCount: Integer; IsVertical: Boolean = False);
var
  SR: TRect;
  H, I: Integer;
  R, G, B: Byte;
  FromR, ToR, FromG, ToG, FromB, ToB: Byte;
begin
  FromR := GetRValue(FromColor);
  FromG := GetGValue(FromColor);
  FromB := GetBValue(FromColor);
  ToR := GetRValue(ToColor);
  ToG := GetGValue(ToColor);
  ToB := GetBValue(ToColor);
  SR := ARect;
  with ARect do
    if IsVertical then
      H := Bottom - Top
    else
      H := Right - Left;

  for I := 0 to AStepCount - 1 do
  begin
    if IsVertical then
      SR.Bottom := ARect.Top + MulDiv(I + 1, H, AStepCount)
    else
      SR.Right := ARect.Left + MulDiv(I + 1, H, AStepCount);
    with Canvas do
    begin
      R := FromR + MulDiv(I, ToR - FromR, AStepCount - 1);
      G := FromG + MulDiv(I, ToG - FromG, AStepCount - 1);
      B := FromB + MulDiv(I, ToB - FromB, AStepCount - 1);
      Brush.Color := RGB(R, G, B);
      FillRect(SR);
    end;
    if IsVertical then
      SR.Top := SR.Bottom
    else
      SR.Left := SR.Right;
  end;
end;


end.
