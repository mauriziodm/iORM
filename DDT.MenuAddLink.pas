unit DDT.MenuAddLink;

interface

uses
  SysUtils, DDT.Interfaces;

type

  /// Classe base e astratta da cui devono derivare tutti i ddtMenuAddLink. Rappresenta
  ///  l'astrazione per aggiungere la voce relativa al documento nel menù che aggiunge un
  ///  nuovo documento. Le derivate poi implementeranno il codice specifico per gestire
  ///  adeguatamente lo specifico menù e la specifica creazione del documento.
  TddtMenuAddLink = class abstract (TInterfacedObject, IddtMenuAddLink)
  private
    FCaption: string;
    FDocTypeName: string;
  protected
    /// Metodo che aggiunge la voce relativa al documento nel menù "aggiungi"
    procedure AddToMenu; virtual; abstract;
    property Caption: string read FCaption;
    property DocTypeName: string read FDocTypeName;
  public
    constructor Create(const ATypeName, ACaption: string);
  end;

implementation

uses
  dxNavBarCollns;

{ TddtMenuAddLink }

constructor TddtMenuAddLink.Create(const ATypeName, ACaption: string);
begin
//  inherited Create;
  FDocTypeName := ATypeName;
  FCaption := ACaption;
  // Crea la voce del menu
  AddToMenu;
end;

end.
