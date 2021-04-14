unit FormGosOrePivotDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPivotDetail, 
  cxEdit, Buttons, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TGosOrePivotDetailForm = class(TModelPivotDetailForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GosOrePivotDetailForm: TGosOrePivotDetailForm;

implementation

{$R *.dfm}

procedure TGosOrePivotDetailForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GosOrePivotDetailForm := nil;
end;

end.
