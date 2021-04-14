unit FormSplash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls;

const
 TRASPARENZA_INIZIALE = 255;
 
 WS_EX_LAYERED = $80000;
 LWA_COLORKEY = 1;
 LWA_ALPHA    = 2;

type
 TSetLayeredWindowAttributes = function (
     hwnd : HWND;         // handle to the layered window
     crKey : TColor;      // specifies the color key
     bAlpha : byte;       // value for the blend function
     dwFlags : DWORD      // action
     ): BOOL; stdcall;

  TSplashForm = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SplashFormFadeOut_old;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM}

procedure TSplashForm.SplashFormFadeOut_old;
begin
   Close;
end;


procedure TSplashForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
   // Imposta il puntatore alla form a nil in modo che nella funzione
   //  VisualizzaAvvio non si tenti di distruggerla di nuovo
   //  causando un errore.
   SplashForm := nil;
end;

end.
