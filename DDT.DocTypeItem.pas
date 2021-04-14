unit DDT.DocTypeItem;

interface

uses
  DDT.Interfaces;

type

  /// Classe del DynamicDocType System che rapresenta un tipo di documento dinamico (pdf)
  ///  che deve essere rappresentato nel menà "aggiungi" e nei filtri dei documenti.
  ///  Questa classe si occuperà, per mezzo anche di altre sottoclassi, di aggiungere il
  ///  tipo di documento che rappresenta al menà "aggiungi" e nei filtri documenti oltre
  ///  anche a contenere il codice per poi effettuare l'eventuale crezione del documento
  ///  o a generare la clausaola where  da inserire poi nella query per l'interrogazione
  ///  del DB.
  TddtDocTypeItem = class(TInterfacedObject, IddtDocTypeItem)
  private
    FFilterLink: IddtFilterLink;
    FMenuAddLink: IddtMenuAddLink;
    FWhereGenerator: IddtWhereGenerator;
    procedure SetSelected(const Value: boolean);
    function GetSelected: boolean;
  public
    constructor Create(const AMenuAddLink: IddtMenuAddLink; const AFilterLink: IddtFilterLink; const AWhereGenerator: IddtWhereGenerator);
    function GetWhereSQL: String;
    property Selected: boolean read GetSelected write SetSelected;
  end;

implementation

{ TddtDocType }

constructor TddtDocTypeItem.Create(const AMenuAddLink: IddtMenuAddLink; const AFilterLink: IddtFilterLink; const AWhereGenerator: IddtWhereGenerator);
begin
  inherited Create;
  FMenuAddLink := AMenuAddLink;
  FFilterLink := AFilterLink;
  FWhereGenerator := AWhereGenerator;
end;

function TddtDocTypeItem.GetSelected: boolean;
begin
  Result := FFilterLink.Selected;
end;

function TddtDocTypeItem.GetWhereSQL: String;
begin
  Result := FWhereGenerator.GetSQL(FFilterLink.Selected);
end;

procedure TddtDocTypeItem.SetSelected(const Value: boolean);
begin
  FFilterLink.Selected := Value;
end;

end.
