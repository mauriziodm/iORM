unit FormDocPivotDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FormModelPivotDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Vcl.Buttons,
  Vcl.ExtCtrls, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid;

type
  TDocPivotDetailForm = class(TModelPivotDetailForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocPivotDetailForm: TDocPivotDetailForm;

implementation

{$R *.dfm}

procedure TDocPivotDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DocPivotDetailForm := nil;
end;

end.
