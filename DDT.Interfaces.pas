unit DDT.Interfaces;

interface

uses
  System.Classes;

type

  IddtDocTypeItem = interface;

  // Interfaccia del DynamicDocType system che rappresenta tutti i documenti gestiti
  // sistema.
  IddtDynamicDocTypes = interface
    ['{60D520C1-7CA6-4AA0-9683-F301FF0123BE}']
    procedure AddDocTypeItem(const ADocTypeItem: IddtDocTypeItem);
    procedure FillWhereConditions(const AStrings: TStrings);
  end;

  /// Interfaccia del DynamicDocType System che rapresenta un tipo di documento dinamico (pdf)
  ///  che deve essere rappresentato nel menà "aggiungi" e nei filtri dei documenti.
  ///  Questa classe si occuperà, per mezzo anche di altre sottoclassi, di aggiungere il
  ///  tipo di documento che rappresenta al menà "aggiungi" e nei filtri documenti oltre
  ///  anche a contenere il codice per poi effettuare l'eventuale crezione del documento
  ///  o a generare la clausaola where  da inserire poi nella query per l'interrogazione
  ///  del DB.
  IddtDocTypeItem = interface
    ['{FF249991-D4EE-4E83-8F7E-B9104CD3A949}']
    function GetWhereSQL: String;
    // Selected
    procedure SetSelected(const Value: boolean);
    function GetSelected: boolean;
    property Selected: boolean read GetSelected write SetSelected;
  end;

  /// Rappresenta l'astrazione per aggiungere la voce relativa al documento nel menù che aggiunge un
  ///  nuovo documento. Le derivate poi implementeranno il codice specifico per gestire
  ///  adeguatamente lo specifico menù e la specifica creazione del documento.
  IddtMenuAddLink = interface
    ['{89711B93-628A-4CBE-AF26-24C4A5DEAF50}']
  end;

  /// Rapresenta l'astrazione all'oggetto nella UI relativo filtro del documento e dal quale "leggere"
  ///  se è selezionato o meno
  IddtFilterLink = interface
    ['{964B389A-6768-4D37-B9A9-5D6F1CB00DE0}']
    // Selected property
    procedure SetSelected(const Value: boolean);
    function GetSelected: boolean;
    property Selected: boolean read GetSelected write SetSelected;
  end;

  /// Astrazione della parte di una DynamicDocTypeItem che genera la condizione Where della query
  ///  relativa al filtro per documento
  IddtWhereGenerator = interface
    ['{9BB29976-C476-4478-AB56-B50C63169223}']
    function GetSQL(const ASelected: Boolean): String;
  end;


implementation

end.
