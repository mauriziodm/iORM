unit DDT.FilterLink.LDE;

interface

uses
  DDT.FIlterLink, cxCheckListBox;

type

  TddtFilterLinkLDE = class(TddtFilterLink)
  private
    /// CheckListBoxItem relativa al documento che rappresenta
    FItem: TcxCheckListBoxItem;
  protected
    /// Metodo che aggiunge la voce relativa al documento nei filtri documenti
    procedure AddFilter; override;
    // Get/Set Selected
    procedure SetSelected(const Value: boolean); override;
    function GetSelected: boolean; override;
  end;


implementation

uses
  SchedaClienti;

{ TddtFilterLinkLDE }

procedure TddtFilterLinkLDE.AddFilter;
begin
  inherited;
  // Crea la nuova item relativa al documento
  FItem := ClientiForm.DocAltri.Items.Add;
  FItem.Text := Caption;
end;

function TddtFilterLinkLDE.GetSelected: boolean;
begin
  inherited;
  Result := FItem.Checked;
end;

procedure TddtFilterLinkLDE.SetSelected(const Value: boolean);
begin
  inherited;
  FItem.Checked := Value;
end;

end.
