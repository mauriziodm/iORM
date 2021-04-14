SET TERM ^ ;

CREATE PROCEDURE IMP_AGGIORNA_TECNICO_ALL (IN_IDIMPEGNO INTEGER, IN_CODICETECNICO INTEGER)
AS

  DECLARE loc_Tecnico_ID INTEGER;
  DECLARE loc_Tecnico_Nome VARCHAR(60);
  DECLARE loc_Tecnico_RagSoc VARCHAR(60);
  DECLARE loc_Tecnico_Indirizzo VARCHAR(40);
  DECLARE loc_Tecnico_Citta VARCHAR(25);
  DECLARE loc_Tecnico_Provincia VARCHAR(3);
  DECLARE loc_Tecnico_Telefono VARCHAR(30);
  DECLARE loc_Tecnico_EstremiDocQualifica VARCHAR(60);

BEGIN

  /* Verifica parametri */
  IF (IN_IDIMPEGNO IS NULL OR IN_IDIMPEGNO = 0) THEN EXIT;

  /* Query che ricava i dati del tecnico */
  SELECT T.RESOURCEID, T.NOME, T.RAGIONESOCIALE, T.INDIRIZZO, T.CITTA, T.PROVINCIA, T.TELEFONO, T.ESTREMIDOCQUALIFICA
  FROM TECNICI T
  WHERE T.RESOURCEID = :IN_CODICETECNICO
  INTO :loc_Tecnico_ID, :loc_Tecnico_Nome, :loc_Tecnico_RagSoc, :loc_Tecnico_Indirizzo, :loc_Tecnico_Citta, :loc_Tecnico_Provincia, :loc_Tecnico_Telefono, :loc_Tecnico_EstremiDocQualifica;

  /* Aggiorna il tecnico degli allegati relativi all'impegno */
  UPDATE ALLEGATI_MANUT AM SET
    AM.TECNICO_RESOURCEID = :loc_Tecnico_ID,
    AM.TECNICO_NOMECOGNOME = :loc_Tecnico_Nome,
    AM.TECNICO_RAGSOC = :loc_Tecnico_RagSoc,
    AM.TECNICO_INDIRIZZO = :loc_Tecnico_Indirizzo || ' - ' || :loc_Tecnico_Citta || ' (' || :loc_Tecnico_Provincia || ')',
    AM.TECNICO_TELEFONO = :loc_Tecnico_Telefono,
    AM.TECNICO_ESTREMIDOCQUALIFICA = :loc_Tecnico_EstremiDocQualifica
  WHERE AM.IDIMPEGNO = :IN_IDIMPEGNO
    AND AM.TECNICO_DAIMPEGNO <> 'F';

  /* Fine */
  EXIT;

END^

SET TERM ; ^
