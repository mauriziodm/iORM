unit FormLeftSide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, bmpPanel, cxContainer, cxEdit, cxClasses;

const
  // Colori da utilizzare nei campi delle form (Quando sono in modifica, quando non lo sono, quando ricevono il focus ecc)
  COLOR_FOCUS                   = $009DFFFF;

type
  TLeftSideForm = class(TForm)
    Sfondo: TPanel;
    LabelStyleController: TcxEditStyleController;
    EditStyleController: TcxEditStyleController;
    SfondoImg: TImage;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Ridimensiona;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LeftSideForm: TLeftSideForm;

implementation

uses main;

{$R *.dfm}

procedure TLeftSideForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TLeftSideForm.FormCreate(Sender: TObject);
begin
   Self.Parent := MainForm;
end;

procedure TLeftSideForm.Ridimensiona;
begin
  // Dimensionamento e posizionamento
  Self.Top := MainForm.MainLeftPanel.Top + MainForm.ImgDocTipo.Height + 4;
  Self.Left := MainForm.MainLeftPanel.Left;
  Self.Width := MainForm.MainLeftPanel.Width;
  Self.Height := MainForm.MainLeftPanel.Height - MainForm.ImgDocTipo.Height - 4;

  Sfondo.Left := 0;
  Sfondo.Top := -MainForm.ImgDocTipo.Height;
  Sfondo.Width := Self.Width;
  Sfondo.Height := Self.Height - Sfondo.Top;
end;

procedure TLeftSideForm.FormShow(Sender: TObject);
begin
  Ridimensiona;
  // Carica le bitmap di sfondo
  SfondoImg.Picture.Bitmap := MainForm.ImageLeftPanelParteSfumata.Picture.Bitmap;
end;

end.
