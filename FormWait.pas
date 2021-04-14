unit FormWait;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, JvExControls, JvAnimatedImage;

type
  TWaitForm = class(TForm)
    ImgBottom: TImage;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    ImgStop: TImage;
    LabelSezione: TLabel;
    LabelMessaggio: TLabel;
    Shape3: TShape;
    Animazione: TJvAnimatedImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WaitForm: TWaitForm;

implementation

uses DataModule1;

{$R *.DFM}

procedure TWaitForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caHide;
end;

procedure TWaitForm.FormCreate(Sender: TObject);
begin
   // Carica le Bitmap della FormWait
//   ImgBottom.Picture.LoadFromFile(DM1.TemaDir + 'formwait_bottom.bmp');
//   ImgStop.Picture.LoadFromFile(DM1.TemaDir + 'stop.bmp');

//   Animazione.Glyph.LoadFromFile(DM1.TemaDir + 'wait_anim.bmp');
//   Animazione.NumGlyphs := 3;
end;

procedure TWaitForm.FormHide(Sender: TObject);
begin
  Animazione.Active := False;
end;

procedure TWaitForm.FormShow(Sender: TObject);
begin
  Animazione.Active := True;
end;

end.
