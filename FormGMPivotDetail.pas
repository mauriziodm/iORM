unit FormGMPivotDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormModelPivotDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Vcl.Buttons,
  Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid;

type
  TGMPivotDetailForm = class(TModelPivotDetailForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GMPivotDetailForm: TGMPivotDetailForm;

implementation

{$R *.dfm}

procedure TGMPivotDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GMPivotDetailForm := nil;
end;

end.
