unit FormAllegatiAlarm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, StdCtrls, ExtCtrls, Buttons, cxCheckBox, cxFormats,
  cxLabel, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.ComCtrls,
  dxCore, cxDateUtils;

type
  TAllegatiAlarmForm = class(TForm)
    Image1: TImage;
    Label2: TLabel;
    dbeDataOra: TcxDateEdit;
    dbeFatto: TcxCheckBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    sbAzzera: TSpeedButton;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbAzzeraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AllegatiAlarmForm: TAllegatiAlarmForm;

implementation

uses DataModule1;

{$R *.dfm}

procedure TAllegatiAlarmForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then begin
    Key := 0;
    Close;
  end;
end;

procedure TAllegatiAlarmForm.FormShow(Sender: TObject);
begin
  dbeDataOra.SetFocus;
  MessageBeep(MB_ICONEXCLAMATION);
end;


procedure TAllegatiAlarmForm.sbAzzeraClick(Sender: TObject);
begin
  if DM1.Messaggi('Levante', 'Azzerare l''allarme?', '', [mbYes,mbNo], 0, nil) <> mrYes then Exit;
  ModalResult := mrAbort;
end;

initialization
  FormatSettings.ShortDateFormat := 'dd/mm/yyyy';
  FormatSettings.LongTimeFormat := 'hh:mm';
  FormatSettings.ShortTimeFormat := 'hh:mm';
  cxFormatController.UseDelphiDateTimeFormats := True;

end.
