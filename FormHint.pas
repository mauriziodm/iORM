unit FormHint;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Math;

type
  THintForm = class(TForm)
    HintMemo: TMemo;
    Background: TImage;
    PLeft: TImage;
    PRight: TImage;
    PTop: TImage;
    PBottom: TImage;
    Riempimento: TLabel;
    procedure ShowTransparent(X,Y:Integer);
    procedure CaricaTema;
    procedure CalcolaDimensioniOrizzontali;
    procedure CalcolaDimensioniVerticali;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HintForm: THintForm;

implementation

uses DataModule1;

{$R *.DFM}

procedure THintForm.CaricaTema;
begin
   // Carica le Bitmap del tema
   PTop.Picture.LoadFromFile(DM1.TemaDir + 'hint_top.bmp');
   PBottom.Picture.LoadFromFile(DM1.TemaDir + 'hint_bottom.bmp');
   PLeft.Picture.LoadFromFile(DM1.TemaDir + 'hint_left.bmp');
   PRight.Picture.LoadFromFile(DM1.TemaDir + 'hint_right.bmp');

   Ptop.Autosize := False;
   PBottom.Autosize := False;
   PLeft.Autosize := False;
   PRight.Autosize := False;
end;

procedure THintForm.CalcolaDimensioniOrizzontali;
begin
   // Calcola la dimensione della form
   Width := Max(PTop.Width, HintMemo.Width + PLeft.Width + PRight.Width);
   // Posiziona le bitmaps in orizzontale e, per quanto riguarda il pannello superiore e i due laterali
   //  li posiziona anche in altezza.
   PTop.Left := 0;
   PTop.Top := 0;

   PLeft.Left := 0;
   PLeft.Top := PTop.Height;

   PRight.Top := PTop.Height;
   PRight.Left := Width - PRight.Width;

   PBottom.Left := 0;

   HintMemo.Top := PTop.Height;
   HintMemo.Left := Round(((Width - PLeft.Width - PRight.Width) - HintMemo.Width) / 2 + PLeft.Width);

   Riempimento.Top := PTop.Height;
   Riempimento.Left := PLeft.Width;
   Riempimento.Width := Width - PLeft.Width - PRight.Width;
   // Preleva il colore di sfondo del meme dell'hint dal pixel più in basso a dx della bitmap del bordo sx
   //  NB: Imposta il colore di sfondo anche della label di riempiemento
   HintMemo.Color := PLeft.Canvas.Pixels[PLeft.Picture.Width-1, PLeft.Picture.Height-1];
   Riempimento.Color := HintMemo.Color;
   Riempimento.Caption := '';
end;

procedure THintForm.CalcolaDimensioniVerticali;
begin
   // Calcola la dimensione verticale della parte occupata dal messaggio
   HintMemo.Height := HintMemo.Lines.Count * 14 + 0;
   Riempimento.Height := HintMemo.Height;
   // Calcola la dimensione verticale dei bordi laterali
   PLeft.Height := HintMemo.Height;
   PRight.Height := HintMemo.Height;
   // Calcola la posizione verticale del bordo inferiore
   PBottom.Top := HintMemo.Top + HintMemo.Height;
   // Calcola l'altezza della form
   Height := PBottom.Top + PBottom.Height;
end;

procedure THintForm.ShowTransparent(X,Y:Integer);
var
  hWinDesk : integer;
  hDCDesk : integer;
  bOK : boolean;
  iTemp: Integer;
begin
  // Posiziona la form
  Left := X;
  Top  := Y;
  {get handles to desktop}
  hWinDesk := GetDesktopWindow;
  hDCDesk := GetWindowDC(hWinDesk);
  {bit blt the desktop region into bitmap and assign to image control}
  bOK := BitBlt(Background.canvas.handle, 0, 0, Width, Height, hDCDesk, X, Y, SRCCOPY);
  {release desktop dc}
  iTemp := ReleaseDC(hWinDesk, hDCDesk);
  // Visualizza la form
  Show;
end;

end.
