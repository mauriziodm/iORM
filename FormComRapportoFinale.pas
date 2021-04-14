unit FormComRapportoFinale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TComRapportoFinaleForm = class(TForm)
    Label1: TLabel;
    LabelNumInviate: TLabel;
    LabelInviate: TLabel;
    LabelNumNonInviate: TLabel;
    LabelNonInviate: TLabel;
    LabelNumErrori: TLabel;
    LabelErrori: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Shape1: TShape;
    bntOk: TBitBtn;
    procedure bntOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ComRapportoFinaleForm: TComRapportoFinaleForm;

implementation

{$R *.dfm}

procedure TComRapportoFinaleForm.bntOkClick(Sender: TObject);
begin
  Close;
end;

procedure TComRapportoFinaleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  ComRapportoFinaleForm := nil;
end;

end.
