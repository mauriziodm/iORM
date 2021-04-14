unit UnitCompression;

interface

uses
  System.ZLib;

type

  TLevCompression = class
  public
    class procedure Compress(const AFullPathCompressedFileName, AFullPathFileNameToBeCompressed: String);
  end;

implementation

{ TLevCompression }

class procedure TLevCompression.Compress(const AFullPathCompressedFileName,
  AFullPathFileNameToBeCompressed: String);
begin
//  // Creazione dell'archivio compresso
//  ZLB1.CreateArchive(StmPref_FullPathCompressedFileName);
//  // Aggiunge il file da comprimere con le preferenze di stampa
//  ZLB1.AddFile(StmPref_FullPathIniFileName);
//  // Chiude l'archivio
//  ZLB1.CloseArchive;
//  // Salva il file compresso nel campo blob apposito
//  QryDocumentoSTMPREF.LoadFromFile(StmPref_FullPathCompressedFileName);
end;

end.
