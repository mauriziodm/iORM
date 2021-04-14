unit FormConfirm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, Vcl.ExtCtrls, Vcl.StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMemo,
  cxRichEdit;

type
  TConfirmForm = class(TForm)
    PanelBottom: TPanel;
    ButtonConfirm: TcxButton;
    ButtonCancel: TcxButton;
    eTitle: TLabel;
    Shape1: TShape;
    eTypeShape: TShape;
    eType: TcxTextEdit;
    eMessage: TcxRichEdit;
    TimerConfirm: TTimer;
    TimerCancel: TTimer;
    procedure eTypePropertiesChange(Sender: TObject);
    procedure eTypeKeyPress(Sender: TObject; var Key: Char);
    procedure TimerConfirmTimer(Sender: TObject);
    procedure TimerCancelTimer(Sender: TObject);
  private
    { Private declarations }
    FToType: String;
    procedure HighlightTestToBeTyped(const ATextToHighlight: String);
    function TypedTextIsRight: Boolean;
  public
    { Public declarations }
    constructor Create(const AToTypeText: String); overload;
    class function ConfirmationRequest(const ATitle, AMessage, AButtonText: String; AToType: String; const AFormWidth: Integer = 500;
      const AFormHeight: Integer = 300; const APrivate: Boolean = False): Boolean; overload;
    class function ConfirmationRequest(const ATitle, AMessage: String; AToType: String; const AFormWidth: Integer = 500; const AFormHeight: Integer = 300)
      : Boolean; overload;
    class function ConfirmationRequest(const AMessage: String; AToType: String; const AFormWidth: Integer = 500; const AFormHeight: Integer = 300)
      : Boolean; overload;
    class function ConfirmationRequest: Boolean; overload;
    class function AuthorizationRequest(const ATitle, AMessage: String; AToType: String): Boolean; overload;
    class function AuthorizationRequest: Boolean; overload;
  end;

implementation

uses
  Vcl.ComCtrls;

{$R *.dfm}
{ TConfirmForm }

class function TConfirmForm.ConfirmationRequest(const ATitle, AMessage, AButtonText: String; AToType: String; const AFormWidth: Integer;
  const AFormHeight: Integer; const APrivate: Boolean): Boolean;
var
  LConfirmForm: TConfirmForm;
  LTyped: String;
begin
  LConfirmForm := TConfirmForm.Create(AToType);
  try
    // Prepare & show
    LConfirmForm.Width := AFormWidth;
    LConfirmForm.Height := AFormHeight;
    LConfirmForm.eTitle.Caption := ATitle;
    LConfirmForm.eMessage.Lines.Text := AMessage;
    LConfirmForm.HighlightTestToBeTyped(AToType);
    LConfirmForm.ButtonConfirm.Caption := AButtonText;
    LConfirmForm.ButtonConfirm.Enabled := False;
    if APrivate then
      LConfirmForm.eType.Properties.EchoMode := eemPassword;
    Result := LConfirmForm.ShowModal = mrOk;
  finally
    LConfirmForm.Free;
  end;
end;

class function TConfirmForm.ConfirmationRequest(const AMessage: String; AToType: String; const AFormWidth, AFormHeight: Integer): Boolean;
begin
  Result := ConfirmationRequest('Conferma', AMessage, 'Conferma', AToType, AFormWidth, AFormHeight);
end;

class function TConfirmForm.AuthorizationRequest(const ATitle, AMessage: String; AToType: String): Boolean;
begin
  Result := ConfirmationRequest(ATitle, AMessage, 'Autorizza', AToType, 500, 300, True);
end;

class function TConfirmForm.AuthorizationRequest: Boolean;
begin
  Result := AuthorizationRequest('Operazione non autorizzata', 'Operazione non autorizzata'#13'In caso di necessità contattare il servizio di assistenza.', 'th3cla');
end;

class function TConfirmForm.ConfirmationRequest: Boolean;
begin
  Result := ConfirmationRequest('Conferma', 'Digita "confermo" per confermare...', 'Conferma', 'confermo');
end;

constructor TConfirmForm.Create(const AToTypeText: String);
begin
  inherited Create(nil);
  FToType := Uppercase(StringReplace(AToTypeText, ' ', '', [rfReplaceAll]));
end;

procedure TConfirmForm.HighlightTestToBeTyped(const ATextToHighlight: String);
var
  LStartPos: Integer;
begin
  LStartPos := eMessage.FindTexT(ATextToHighlight, 0, Length(eMessage.Text), [stWholeWord]);
  if LStartPos >= 0 then
  begin
    eMessage.SelStart := LStartPos;
    eMessage.SelLength := Length(ATextToHighlight);
    eMessage.SelAttributes.Style := [fsBold];
    eMessage.SelLength := 0;
  end;
end;

procedure TConfirmForm.TimerCancelTimer(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TConfirmForm.TimerConfirmTimer(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function TConfirmForm.TypedTextIsRight: Boolean;
var
  LTypedText: String;
begin
  LTypedText := Uppercase(StringReplace(eType.Text, ' ', '', [rfReplaceAll]));
  Result := LTypedText = FToType;
end;

class function TConfirmForm.ConfirmationRequest(const ATitle, AMessage: String; AToType: String; const AFormWidth, AFormHeight: Integer): Boolean;
begin
  Result := ConfirmationRequest(ATitle, AMessage, 'Conferma', AToType, AFormWidth, AFormHeight);
end;

procedure TConfirmForm.eTypeKeyPress(Sender: TObject; var Key: Char);
begin
  TimerConfirm.Enabled := ((ord(Key) = VK_RETURN) and ButtonConfirm.Enabled);
  TimerCancel.Enabled := (ord(Key) = VK_ESCAPE);
end;

procedure TConfirmForm.eTypePropertiesChange(Sender: TObject);
begin
  ButtonConfirm.Enabled := TypedTextIsRight;
end;

end.
