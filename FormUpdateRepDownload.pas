unit FormUpdateRepDownload;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, cxProgressBar, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls, IB_Components, IB_Session, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, FireDAC.Phys.IBCli;

type
  TUpdateRepDownloadForm = class(TForm)
    Shape1: TShape;
    Logo: TImage;
    LabelTitle: TcxLabel;
    LabelMsg: TcxLabel;
    ProgressBar: TcxProgressBar;
    ButtonYes: TBitBtn;
    ButtonNo: TBitBtn;
    QryDownload: TIB_Cursor;
    procedure FormShow(Sender: TObject);
    procedure ButtonNoClick(Sender: TObject);
    procedure ButtonYesClick(Sender: TObject);
    procedure QryDownloadBlobCallback(const PVAR: PXSQLVAR_V1;
      AStatus: TIB_BlobCallbackStatus; ABytes: Integer;
      var MaxSegmentSize: Integer);
  private
    fUpdateFileSize: Int64;
    procedure PutMessage(M: String);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateRepDownloadForm: TUpdateRepDownloadForm;

implementation

uses DataModule2, DataModule1;

{$R *.dfm}

procedure TUpdateRepDownloadForm.FormShow(Sender: TObject);
begin
  // Emette il suono di apertura del menù
  DM2.EmettiSuono('MenuOpen.wav');
  // IMposta il messaggio iniziale
  PutMessage('Un nuovo aggiornamento è pronto per essere installato su questa postazione.'#13#13'Eseguire l''aggiornamento ora?');
end;


procedure TUpdateRepDownloadForm.PutMessage(M:String);
begin
  LabelMsg.Caption := M;
  LabelMsg.Update;
end;



procedure TUpdateRepDownloadForm.QryDownloadBlobCallback(
  const PVAR: PXSQLVAR_V1; AStatus: TIB_BlobCallbackStatus; ABytes: Integer;
  var MaxSegmentSize: Integer);
var
  Avanzamento: Integer;
begin
  // Calcola la percentuale di avanzamento
  Avanzamento := (ABytes * 100) div fUpdateFileSize + 1;
  // Aggiorna la ProgressBar
  ProgressBar.Position := Avanzamento;
  ProgressBar.Update;
  Application.ProcessMessages;
end;

procedure TUpdateRepDownloadForm.ButtonNoClick(Sender: TObject);
begin
  DM2.EmettiSuono('MenuClick.wav');
  Close;
end;

procedure TUpdateRepDownloadForm.ButtonYesClick(Sender: TObject);
begin
  // Copia l'eseguibile dell'UpdateLauncher e poi avvia la copia
  //  in modo che il file sia aggiornabile dall'autoscompattante
  if FileExists(DM1.CartellaTmp + 'LevanteUL_toRun.exe') then
  begin
    if not DeleteFile(DM1.CartellaTmp + 'LevanteUL_toRun.exe') then
      raise Exception.Create('Non sono riuscito a eliminare il file "LevanteUL_toRun.exe"');
  end;
  DM1.CopiaFile(DM1.CurrDir + 'LevanteUL.exe', DM1.CartellaTmp + 'LevanteUL_toRun.exe');
  // Avvia l'eseguibile esterno che lancia l'aggiornamento
  DM1.WinExec(DM1.CartellaTmp + 'LevanteUL_toRun.exe');
  // Si chiude
  Application.Terminate;
end;

end.
