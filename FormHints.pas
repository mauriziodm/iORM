unit FormHints;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  THintsForm = class(TForm)
    HintMemo: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    EditOwner: TEdit;
    EditName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    LabelMessage: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    HintFileName:String;
  public
    { Public declarations }
    // Variabili che servono per comporre il nome del file di testo dell'hint (Owner + Name del componente)
    LocalComponentOwner, LocalComponentName: String;
  end;

var
  HintsForm: THintsForm;

implementation

uses DataModule1;

{$R *.DFM}

procedure THintsForm.FormShow(Sender: TObject);
begin
   // Carica idati
   EditOwner.Text := LocalComponentOwner;
   EditName.Text  := LocalComponentName;
   // Imposta il nome completo del file
   HintFileName := DM1.HintsDir + LocalComponentOwner + '_' + LocalComponentName + '.hnt';
   // Carica il testo dell'hint solo se il relativo file esiste
   HintMemo.Lines.Clear;
   if FileExists(HintFileName) then begin
      HintMemo.Lines.LoadFromFile(HintFileName);
   end;
   HintMemo.SetFocus;
end;

procedure THintsForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure THintsForm.BitBtn2Click(Sender: TObject);
begin
   // Salva il nuovo testo
   HintMemo.Lines.SaveToFile(HintFileName);
   Close;
end;

procedure THintsForm.BitBtn1Click(Sender: TObject);
begin
   Close;
end;

end.
