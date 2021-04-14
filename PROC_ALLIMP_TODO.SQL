SET TERM ^ ;


/*
=========================================================================== 
Restituisce la lista degli allegato F/G da creare o già creati relativi
all'impianto e all'appuntamento.
NB: Se un generatore è abbinato a più di un bruciatore abbinato restituisce
tanti aleggati quanti sono i bruciatori (con lo stesso generatore).
=========================================================================== 
*/


CREATE PROCEDURE ALLIMP_TODO (IN_IDPRATICA INTEGER, IN_IDIMPEGNO INTEGER, IN_IDIMPEGNO_LONG INTEGER)
RETURNS
( ID INTEGER
 ,COPIE INTEGER
 ,APPARECCHIO_FULL VARCHAR(250)
 ,POTENZA DOUBLE PRECISION
 ,UBICAZIONE VARCHAR(30)
 ,ALLEGATO VARCHAR(60)
 ,ESISTE CHAR(1)
 ,SELEZIONATO CHAR(1)
 ,BRUC_ID INTEGER
)

AS
  /* Dati del generatore di calore */
  DECLARE TIPOAPPARECCHIO VARCHAR(30);
  DECLARE COSTRUTTORE VARCHAR(45);
  DECLARE MODELLO VARCHAR(30);
  DECLARE MATRICOLA VARCHAR(30);
  DECLARE POTENZATERMICA DOUBLE PRECISION;
  DECLARE POTENZATERMICAFOCOLARE DOUBLE PRECISION;
  DECLARE GENCAL_SELEZIONATO CHAR(1);
  DECLARE GENCAL_APPARECCHIO_FULL VARCHAR(250);

  /* Dati dell'eventuale bruciatore abbinato */
  DECLARE BRUC_COSTRUTTORE VARCHAR(45); 
  DECLARE BRUC_MODELLO VARCHAR(30);
  DECLARE BRUC_MATRICOLA VARCHAR(30);
  DECLARE BRUC_SELEZIONATO CHAR(1);
BEGIN

  /* Cicla per tutti i generatori NON DISMESSI dell'impianto */
  FOR SELECT
    PA.ID
   ,PA.TIPOAPPARECCHIO
   ,PA.COSTRUTTORE
   ,PA.MODELLO
   ,PA.MATRICOLA
   ,COALESCE(PA.POTENZATERMICA,0)
   ,COALESCE(PA.POTENZATERMICAFOCOLARE,0)
   ,PA.UBICAZIONE
   ,COALESCE(PA.ALLEGATO,'')
  FROM PRATAPPARECCHI PA
  WHERE PA.IDPRATICA = :IN_IDPRATICA 
    AND ((COALESCE(PA.TIPOAPPARECCHIO,'') = 'Generatore di calore') OR (COALESCE(PA.TIPOAPPARECCHIO,'') = 'Generatore di calore biomassa') OR (COALESCE(PA.TIPOAPPARECCHIO,'') = 'Unità esterna') OR (COALESCE(PA.TIPOAPPARECCHIO,'') = 'Monoblocco') OR (COALESCE(PA.TIPOAPPARECCHIO,'') = 'Macchina per freddo'))
    AND COALESCE(PA.DISMESSO,'F') <> 'T'
  INTO
    :ID
   ,:TIPOAPPARECCHIO
   ,:COSTRUTTORE
   ,:MODELLO
   ,:MATRICOLA
   ,:POTENZATERMICA
   ,:POTENZATERMICAFOCOLARE
   ,:UBICAZIONE
   ,:ALLEGATO
  DO BEGIN

    /* Inizializzazione */
    BRUC_ID = NULL;

    /* Costruisce la descrizione dell'apparecchio completa */
    GENCAL_APPARECCHIO_FULL = COSTRUTTORE || ' ' || MODELLO || ' (' || MATRICOLA ||')'; 

    /* Definisce la potenza in base ai dati ricevuti */
    IF (POTENZATERMICAFOCOLARE <> 0) THEN BEGIN
      POTENZA = POTENZATERMICAFOCOLARE;
    END ELSE BEGIN
      POTENZA = POTENZATERMICA;
    END

    /* Definisce se è un allegato G oppure F se non è stato specificato nella scheda dall'apparecchio */
    ALLEGATO = CASE
                 WHEN (ALLEGATO LIKE 'RCEE1B%') THEN 'RCEE1B - gruppi termici a biomassa combustibile'
                 WHEN (ALLEGATO LIKE 'RCEE1%') THEN 'RCEE1 - gruppi termici'
                 WHEN (ALLEGATO LIKE 'RCEE2%') THEN 'RCEE2 - gruppi frigo/pompe di calore'
                 WHEN (ALLEGATO LIKE 'G%') THEN 'G - impianti termici'
                 WHEN (ALLEGATO LIKE 'F%') THEN 'F - impianti termici'
                 ELSE 'RCEE1 - gruppi termici'
               END; 

    /* Definisce se il generatore di calore è selezionato per la manutenzione nell'appuntamento */
    /* NB: Se ci sono bruciatori abbinati l'allegato viene proposto se il generatore o il bruciatore sono selezionati (anche uno solo dei due) */
    IF (EXISTS(   SELECT IAS.IDAPPARECCHIOPRAT FROM IMPEGNI_APPSEL IAS WHERE IAS.IDIMPEGNO = :IN_IDIMPEGNO AND IAS.IDAPPARECCHIOPRAT = :ID   ))
    THEN GENCAL_SELEZIONATO = 'F';     
    ELSE GENCAL_SELEZIONATO = 'T';     
    /* Imposta già il relativo campo da ritornare nel caso non si siano bruciatori abbinati */
    SELEZIONATO = GENCAL_SELEZIONATO;




    /* Se non ci sono bruciatori abbinati al generatore di calore corrente
       prosegue con la determinazione di alcuni valori e poi ritorna il record */
    IF (NOT EXISTS(   SELECT BR.ID FROM PRATAPPARECCHI BR WHERE BR.IDPRATICA=:IN_IDPRATICA AND BR.IDAPPABBINATO=:ID AND COALESCE(BR.TIPOAPPARECCHIO,'')='Bruciatore' AND COALESCE(BR.DISMESSO,'F')<>'T'   )) THEN BEGIN

      /* -------------------------------------------------------------------------------- */
      /* Definisce la descrizione completa dell'apparecchio */
      APPARECCHIO_FULL = GENCAL_APPARECCHIO_FULL;

      /* Definisce se l'allegato esiste già oppure no (considerando se ci sono anche i bruciatori abbinati) */
      IF (EXISTS(   SELECT AM.ID FROM ALLEGATI_MANUT AM WHERE AM.IDIMPEGNO=:IN_IDIMPEGNO AND AM.GENCAL_ID=:ID AND BRUC_ID IS NULL   ))
      THEN ESISTE = 'T';
      ELSE ESISTE = 'F';

      /* Calcola le copie necessarie in base alle info contenute nelle OP */
      SELECT COALESCE(MAX(OP.COPIE),0) AS COPIE FROM OPIMPEGNO OPI
      JOIN OP ON (OP.CODICE = OPI.IDOP)
      WHERE OPI.IDIMPEGNO = :IN_IDIMPEGNO_LONG 
        AND OPI.IDAPPARECCHIOPRAT = :ID
        AND OPI.DAEFFETTUARE = 'T'
      INTO :COPIE;

      /* Ritorna il record */
      SUSPEND;
      /* -------------------------------------------------------------------------------- */

    /* Se invece ci sono bruciatori abbinati al generatore di calore corrente
       prosegue con la determinazione di alcuni valori considerando anche i bruciatori
       e poi ritorna un record per ogni bruciatore abbinato */
    END ELSE BEGIN

      /* -------------------------------------------------------------------------------- */
      /* Esegue la query che recupera l'elenco dei bruciatori abbinati */
      FOR SELECT 
        BR.ID
       ,BR.COSTRUTTORE
       ,BR.MODELLO
       ,BR.MATRICOLA
      FROM PRATAPPARECCHI BR
      WHERE BR.IDPRATICA = :IN_IDPRATICA 
        AND BR.IDAPPABBINATO=:ID
        AND COALESCE(BR.TIPOAPPARECCHIO,'')='Bruciatore'
        AND COALESCE(BR.DISMESSO,'F') <> 'T'
      INTO
        :BRUC_ID
       ,:BRUC_COSTRUTTORE
       ,:BRUC_MODELLO
       ,:BRUC_MATRICOLA
      DO BEGIN

        /* Aggiunge alla descrizione completa dell'apparecchio il bruciatore corrente */
        APPARECCHIO_FULL = GENCAL_APPARECCHIO_FULL || ' + ' || BRUC_COSTRUTTORE || ' ' || BRUC_MODELLO || ' (' || BRUC_MATRICOLA || ')';

        /* Essendo un bruciatore abbinato è per forza un allegato F */
        ALLEGATO = 'RCEE1 - gruppi termici';

        /* Definisce se il bruciatore è selezionato per la manutenzione nell'appuntamento */
        /* NB: Se ci sono bruciatori abbinati l'allegato viene proposto se il generatore o il bruciatore sono selezionati (anche uno solo dei due) */
        IF (EXISTS(   SELECT IAS.IDAPPARECCHIOPRAT FROM IMPEGNI_APPSEL IAS WHERE IAS.IDIMPEGNO=:IN_IDIMPEGNO AND IAS.IDAPPARECCHIOPRAT=:BRUC_ID   ))
        THEN BRUC_SELEZIONATO = 'F';     
        ELSE BRUC_SELEZIONATO = 'T';     
        /* Imposta il relativo campo da ritornare in modo che basta che o il generatore o il bruciatore siano selezionati per ritornare True */
        IF (GENCAL_SELEZIONATO='T' OR BRUC_SELEZIONATO='T')
        THEN SELEZIONATO = 'T';
        ELSE SELEZIONATO = 'F';

        /* Definisce se l'allegato esiste già oppure no (considerando se ci sono anche i bruciatori abbinati) */
        IF (EXISTS(   SELECT AM.ID FROM ALLEGATI_MANUT AM WHERE AM.IDIMPEGNO=:IN_IDIMPEGNO AND AM.GENCAL_ID=:ID AND BRUC_ID=:BRUC_ID   ))
        THEN ESISTE = 'T';
        ELSE ESISTE = 'F';

        /* Calcola le copie necessarie in base alle info contenute nelle OP */
        SELECT COALESCE(MAX(OP.COPIE),0) AS COPIE FROM OPIMPEGNO OPI
        JOIN OP ON (OP.CODICE = OPI.IDOP)
        WHERE OPI.IDIMPEGNO = :IN_IDIMPEGNO_LONG 
          AND (OPI.IDAPPARECCHIOPRAT = :ID OR OPI.IDAPPARECCHIOPRAT = :BRUC_ID)
          AND OPI.DAEFFETTUARE = 'T'
        INTO :COPIE;

        /* Ritorna il record */
        SUSPEND;

      END
      /* -------------------------------------------------------------------------------- */

    END

  /* Ciclo relativo alla select principale (generatore di calore) */
  END

  EXIT;

END^

SET TERM ^ ;

