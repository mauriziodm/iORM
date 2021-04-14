unit FormEtichettaEnergetica;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormLevante, Vcl.Buttons, Vcl.ExtCtrls,
  bmpPanel, Vcl.OleCtrls, SHDocVw;

type
  TEtichettaEnergeticaForm = class(TLevanteForm)
    WebBrowser1: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1NavigateComplete2(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowser1NavigateError(ASender: TObject; const pDisp: IDispatch;
      const URL, Frame, StatusCode: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1DocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    procedure WebBrowser1DownloadComplete(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EtichettaEnergeticaForm: TEtichettaEnergeticaForm;

implementation

uses
  main, DataModule1;

{$R *.dfm}

procedure TEtichettaEnergeticaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  EtichettaEnergeticaForm := nil;
end;

procedure TEtichettaEnergeticaForm.FormCreate(Sender: TObject);
begin
  inherited;
   // Carica l'icona del tipo documento visualizzato
   MainForm.SalvaIconaDocTipo;
   MainForm.CaricaIconaDocTipo('Utilita');
   // Blocca l'aggiornamento dell'IconaDocTipo
   MainForm.BloccaIconaDocTipo(True, Name);

   // Carica la pagina web
   WebBrowser1.Navigate('http://46.101.159.103/packagelabel/Index/index/it_IT');
end;

procedure TEtichettaEnergeticaForm.FormResize(Sender: TObject);
begin
  inherited;
  // RIcalcola la posizione del TWebBrowser
  WebBrowser1.Align := alNone;
  WebBrowser1.Top := -2;
  WebBrowser1.Left := -2;
  WebBrowser1.Width := ClientArea.Width + 4;
  WebBrowser1.Height := ClientArea.Height + 4;
end;

procedure TEtichettaEnergeticaForm.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  inherited;
  DM1.ShowWait('Levante', 'Caricamento...');
end;

procedure TEtichettaEnergeticaForm.WebBrowser1DocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
begin
  inherited;
  DM1.CloseWait;
end;

procedure TEtichettaEnergeticaForm.WebBrowser1DownloadComplete(Sender: TObject);
begin
  inherited;
  DM1.CloseWait;
end;

procedure TEtichettaEnergeticaForm.WebBrowser1NavigateComplete2(
  ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  inherited;
  DM1.CloseWait;
end;

procedure TEtichettaEnergeticaForm.WebBrowser1NavigateError(ASender: TObject;
  const pDisp: IDispatch; const URL, Frame, StatusCode: OleVariant;
  var Cancel: WordBool);
begin
  inherited;
  DM1.CloseWait;
end;

end.
