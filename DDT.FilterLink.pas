unit DDT.FilterLink;

interface

uses
  DDT.Interfaces;

type

  TddtFilterLink = class abstract (TInterfacedObject, IddtFilterLink)
  private
    FCaption: String;
  protected
    /// Metodo che aggiunge la voce relativa al documento nei filtri documenti
    procedure AddFilter; virtual; abstract;
    // Get/Set Selected
    procedure SetSelected(const Value: boolean); virtual; abstract;
    function GetSelected: boolean; virtual; abstract;
    // Caption per le classi derivate
    property Caption: string read FCaption;
  public
    constructor Create(const ACaption: string; const ASelected: Boolean);
    property Selected: boolean read GetSelected write SetSelected;
  end;

implementation

{ TddtFilterLink }

{ TddtFilterLink }

constructor TddtFilterLink.Create(const ACaption: string; const ASelected: Boolean);
begin
  FCaption := ACaption;
  // Crea la voce del filtro
  AddFilter;
  // Default
  Selected := ASelected;
end;

end.
