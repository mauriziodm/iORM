unit FormGosSpesePivot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FormModelPivotDetail, 
  cxEdit, Buttons, ExtCtrls, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TGosSpesePivotForm = class(TModelPivotDetailForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GosSpesePivotForm: TGosSpesePivotForm;

implementation

{$R *.dfm}

procedure TGosSpesePivotForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  GosSpesePivotForm := nil;
end;

end.
