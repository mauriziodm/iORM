unit FormConfermaDocExpressMag;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics, cxLookAndFeels;

type
  TConfermaDocExpressMagForm = class(TForm)
    PanelYesNo: TPanel;
    ModelButton: TcxButton;
    cxButton1: TcxButton;
    Label1: TLabel;
    LabelDocumento: TLabel;
    LabelCliente: TLabel;
    LabelCantiere: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure ModelButtonClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    FButtonSelected: TObject;
    procedure SetButtonSelected(const Value: TObject);
    { Private declarations }
  public
    { Public declarations }
    property ButtonSelected: TObject read FButtonSelected write SetButtonSelected;
  end;

var
  ConfermaDocExpressMagForm: TConfermaDocExpressMagForm;

implementation

uses FormVendBancoSeleCant;

{$R *.dfm}

procedure TConfermaDocExpressMagForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ConfermaDocExpressMagForm := nil;
end;

procedure TConfermaDocExpressMagForm.FormResize(Sender: TObject);
begin
  PanelYesNo.Left := Trunc((ClientWidth - PanelYesNo.Width) / 2);
end;

procedure TConfermaDocExpressMagForm.SetButtonSelected(
  const Value: TObject);
begin
  FButtonSelected := Value;
end;

procedure TConfermaDocExpressMagForm.ModelButtonClick(Sender: TObject);
begin
  try
    VendBancoSeleCantForm.CreaDocumento(ButtonSelected);
  finally
    Close;
  end;
end;

procedure TConfermaDocExpressMagForm.cxButton1Click(Sender: TObject);
begin
  Close;
end;


end.
