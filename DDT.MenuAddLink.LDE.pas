unit DDT.MenuAddLink.LDE;

interface

  uses DDT.MenuAddLink, dxNavBarCollns, dxNavBar;

type

  /// Implementazione specifica per i documenti LDE e per menù
  ///  "Aggiungi" basato su una TdxNavBar
  TddtMenuAddLinkLDE = class(TddtMenuAddLink)
  private
    FNavBar: TdxNavBar;
    FGroup: TdxNavBarGroup;
    FItem: TdxNavBarItem;
  protected
    procedure onClickEventHandler(Sender: TObject);
    procedure AddToMenu; override;
  end;

implementation

uses
  FormMenuAggiungi, DataModule1, SchedaClienti;

{ TddtMenuAddLinkLDE }

procedure TddtMenuAddLinkLDE.AddToMenu;
begin
  inherited;
  // Estrae la dxNavBar
  FNavBar := MenuAggiungiForm.NavBarLeft;
  // Gruppo "Altro"
  FGroup := MenuAggiungiForm.NavBarGroup_DocumentiAltro;
  // Crea la nuova Item per il documento
  FItem := FNavBar.Items.Add;
  FItem.Caption := Caption;
  FItem.SmallImageIndex := -1;
  FItem.LargeImageIndex := -1;
  FItem.OnClick := onClickEventHandler;
  // Linka la nuova item sl gruppo
  FGroup.CreateLink(FItem);
end;

procedure TddtMenuAddLinkLDE.onClickEventHandler(Sender: TObject);
begin
  inherited;
  // Emette il suono di link clicckato e chiude il menù
  MenuAggiungiForm.CommonMenuItemClick;
  // Va alla nuova conformità
  DM1.Attendere;
  try
    DM1.LDE_NewDocument(DocTypeName, ClientiForm.ID_ClienteCorrente, ClientiForm.ID_PraticaCorrente);
  finally
    DM1.ChiudiAttendere;
  end;
end;

end.
