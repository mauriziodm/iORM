unit FormConfirmNumReg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, cxControls, cxContainer, cxEdit, Vcl.StdCtrls, cxMemo, cxRichEdit, cxTextEdit, Vcl.ExtCtrls,
  cxButtons;

type
  TConfirmNumRegFE = class(TForm)
    PanelBottom: TPanel;
    ButtonConfirm: TcxButton;
    ButtonCancel: TcxButton;
    Shape1: TShape;
    eMessage: TcxRichEdit;
    eTitle: TLabel;
    eTypeShape: TShape;
    Shape2: TShape;
    Label1: TLabel;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    eNumero: TcxTextEdit;
    eNumeroXML: TcxTextEdit;
    eRegistro: TcxTextEdit;
    procedure eNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure eNumeroPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    function TypedTextIsRight: Boolean;
  public
    { Public declarations }
    constructor Create(const ANumeroXML, ANumero, ARegistro: String); overload;
    class function ConfirmationRequest(const ANumeroXML: String; var ANumero: Integer; var ARegistro: String): Boolean;
  end;

var
  ConfirmNumRegFE: TConfirmNumRegFE;

implementation

{$R *.dfm}

class function TConfirmNumRegFE.ConfirmationRequest(const ANumeroXML: String; var ANumero: Integer; var ARegistro: String): Boolean;
var
  LConfirmForm: TConfirmNumRegFE;
  LTyped: String;
begin
  LConfirmForm := TConfirmNumRegFE.Create(ANumeroXML, IntToStr(ANumero), ARegistro);
  try
    Result := LConfirmForm.ShowModal = mrOk;
    if Result then
    begin
      ANumero := StrToInt(Trim(LConfirmForm.eNumero.Text));
      ARegistro := Trim(LConfirmForm.eRegistro.Text);
    end;
  finally
    LConfirmForm.Free;
  end;
end;

constructor TConfirmNumRegFE.Create(const ANumeroXML, ANumero, ARegistro: String);
begin
  inherited Create(nil);
  Width := 500;
  Height := 480;
  eNumeroXML.Text := Trim(ANumeroXML);
  eNumero.Text := Trim(ANumero);
  eRegistro.Text := Trim(ARegistro);
end;

procedure TConfirmNumRegFE.eNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  // Solo cifre numeriche (8 = BackSpace)
  if (  (Ord(Key) < 48) or (Ord(Key) > 57)  )
  and (Ord(Key) <> 8) then
    Key := #0;
end;

procedure TConfirmNumRegFE.eNumeroPropertiesChange(Sender: TObject);
begin
  ButtonConfirm.Enabled := TypedTextIsRight;
end;

function TConfirmNumRegFE.TypedTextIsRight: Boolean;
begin
  Result := Trim(eNumero.Text) <> '';
end;

end.
