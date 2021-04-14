unit FormTipiAltreSpese;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormTipiOreDipendenti, 
  cxEdit, DB, cxDBData, cxTextEdit,
  IBODataset, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  ExtCtrls, StdCtrls, bmpPanel, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, Buttons, cxLookAndFeels,
  cxLookAndFeelPainters, cxNavigator;

type
  TTipiAltreSpeseForm = class(TTipiOreDipendentiForm)
    procedure QryS1BeforePost(DataSet: TDataSet);
    procedure QryS2BeforePost(DataSet: TDataSet);
    procedure QryS3BeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TipiAltreSpeseForm: TTipiAltreSpeseForm;

implementation

uses main;

{$R *.dfm}

procedure TTipiAltreSpeseForm.QryS1BeforePost(DataSet: TDataSet);
begin
  QryS1TIPO.Value := 'TIPOSPESA1';
end;

procedure TTipiAltreSpeseForm.QryS2BeforePost(DataSet: TDataSet);
begin
  QryS2TIPO.Value := 'TIPOSPESA2';
end;

procedure TTipiAltreSpeseForm.QryS3BeforePost(DataSet: TDataSet);
begin
  QryS3TIPO.Value := 'TIPOSPESA3';
end;

procedure TTipiAltreSpeseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  TipiAltreSpeseForm := nil;
  // Il pulsante Impostazioni deve tornare NON PREMUTO
  //  NB: Questa riga l'ho messa perchè penso che questo tipo di form
  //       verrà usato solo per form che fanno parte delle impostazioni
  MainForm.SBImpostazioni.Down := False;
end;

end.
