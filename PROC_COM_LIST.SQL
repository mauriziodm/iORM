SET TERM ^ ;

CREATE PROCEDURE COM_LIST_PROC
RETURNS
( ID INTEGER
 ,RIF_ID INTEGER
 ,RIF_TIPO VARCHAR(20)
 ,RIF_DATO VARCHAR(60)
 ,RIF_TIMEOFFSET_DAYS INTEGER
 ,RIF_EXPIRATION_DAYS INTEGER
 ,RIF_NOAPPUNTAMENTO CHAR(1)
 ,RIF_DATAORASCADENZA DATE
 ,RIF_TIME_THRESHOLD DATE
 ,RIF_TIME_EXPIRED DATE
 ,RIF_DESCRIZIONE VARCHAR(250)
 ,MSG_TYPE_LETTER CHAR(1)
 ,MSG_TYPE_EMAIL CHAR(1)
 ,MSG_TYPE_SMS CHAR(1)
 ,MSG_OGGETTO VARCHAR(250)
 ,SOGG_CODICE INTEGER
 ,SOGG_RAGSOC VARCHAR(60)
 ,SOGG_INDIRIZZO VARCHAR(80)
 ,SOGG_NUMCIVICO VARCHAR(10)
 ,SOGG_COMUNE VARCHAR(60)
 ,SOGG_PROVINCIA VARCHAR(3)
 ,SOGG_CAP VARCHAR(5)
 ,SOGG_CELLULARE VARCHAR(30)
 ,SOGG_EMAIL VARCHAR(250)
 ,SOGG_INQUALITADI VARCHAR(20)
 ,SOGG_COM_SMS CHAR(1)
 ,SOGG_COM_EMAIL CHAR(1)
 ,SOGG_COM_LETTERA CHAR(1)
 ,PRAT_CODICE INTEGER
 ,PRAT_DATA DATE
 ,PRAT_ID INTEGER
 ,PRAT_DESCRIZIONE VARCHAR(60)
 ,PRAT_COM_SMS CHAR(1)
 ,PRAT_COM_EMAIL CHAR(1)
 ,PRAT_COM_LETTERA CHAR(1)
 ,MSG_AMEZZO VARCHAR(20) 
)

AS
BEGIN

  /* Cicla per il risultato della query che ricava l'elenco delle comunicazioni da inviare */
  /* nb: Si alimenta dalla vista di base dei messaggi (COM) */
  FOR SELECT 
    CBW.ID
   ,CBW.RIF_ID
   ,CBW.RIF_TIPO
   ,CBW.RIF_DATO
   ,CBW.RIF_TIMEOFFSET_DAYS
   ,CBW.RIF_EXPIRATION_DAYS
   ,CBW.RIF_NOAPPUNTAMENTO
   ,CBW.RIF_DATAORASCADENZA
   ,CBW.RIF_TIME_THRESHOLD
   ,CBW.RIF_TIME_EXPIRED
   ,CBW.RIF_DESCRIZIONE
   ,CBW.MSG_TYPE_LETTER
   ,CBW.MSG_TYPE_EMAIL
   ,CBW.MSG_TYPE_SMS
   ,CBW.MSG_OGGETTO
   ,CBW.SOGG_CODICE
   ,CBW.SOGG_RAGSOC
   ,CBW.SOGG_INDIRIZZO
   ,CBW.SOGG_NUMCIVICO
   ,CBW.SOGG_COMUNE
   ,CBW.SOGG_PROVINCIA
   ,CBW.SOGG_CAP
   ,CBW.SOGG_CELLULARE
   ,CBW.SOGG_EMAIL
   ,CBW.SOGG_INQUALITADI
   ,CBW.SOGG_COM_SMS
   ,CBW.SOGG_COM_EMAIL
   ,CBW.SOGG_COM_LETTERA
   ,CBW.PRAT_CODICE
   ,CBW.PRAT_DATA
   ,CBW.PRAT_ID
   ,CBW.PRAT_DESCRIZIONE
   ,CBW.PRAT_COM_SMS
   ,CBW.PRAT_COM_EMAIL
   ,CBW.PRAT_COM_LETTERA
  FROM COM_BASE_VIEW CBW
  WHERE

    /* Solo gli scaduti cioè solo se la data attuale è maggiore della soglia temporale calcolata in base alle impostazioni e al dati di riferimento */
    CURRENT_TIMESTAMP >= CBW.RIF_TIME_THRESHOLD

    /* Se è impostato un numero di giorni di validità (RIF_EXPIRATION_DAYS <> 0) considera da inviare
       la comunicazione se la data attuale e antecedente alla data di fine validità calcolata         */
    AND (RIF_EXPIRATION_DAYS = 0   OR   CURRENT_TIMESTAMP <= CBW.RIF_TIME_EXPIRED)

    /* Se è impostato il flag che indica di inviare il messaggio solo se non è già stato preso un
       appuntamento...
       In questo caso verifica se esiste un appuntamento o un intervento (potrebbe essere già stato
       eseguito) con data successiva alla data di ProxVisitaEntro meno 30 giorni e se esiste
       non considera la comunicazione come da inviare, ovviamente questa condizione è solo per comunicazioni
       relative agli impianti */
    AND (RIF_NOAPPUNTAMENTO = 'F'   OR   NOT EXISTS(SELECT I.MASTER_ID FROM IMPEGNI I WHERE I.IDPRATICA=CBW.PRAT_ID AND I.START_EVENT >= (CBW.RIF_DATAORASCADENZA-30)))

  INTO
    :ID
   ,:RIF_ID
   ,:RIF_TIPO
   ,:RIF_DATO
   ,:RIF_TIMEOFFSET_DAYS
   ,:RIF_EXPIRATION_DAYS
   ,:RIF_NOAPPUNTAMENTO
   ,:RIF_DATAORASCADENZA
   ,:RIF_TIME_THRESHOLD
   ,:RIF_TIME_EXPIRED
   ,:RIF_DESCRIZIONE
   ,:MSG_TYPE_LETTER
   ,:MSG_TYPE_EMAIL
   ,:MSG_TYPE_SMS
   ,:MSG_OGGETTO
   ,:SOGG_CODICE
   ,:SOGG_RAGSOC
   ,:SOGG_INDIRIZZO
   ,:SOGG_NUMCIVICO
   ,:SOGG_COMUNE
   ,:SOGG_PROVINCIA
   ,:SOGG_CAP
   ,:SOGG_CELLULARE
   ,:SOGG_EMAIL
   ,:SOGG_INQUALITADI
   ,:SOGG_COM_SMS
   ,:SOGG_COM_EMAIL
   ,:SOGG_COM_LETTERA
   ,:PRAT_CODICE
   ,:PRAT_DATA
   ,:PRAT_ID
   ,:PRAT_DESCRIZIONE
   ,:PRAT_COM_SMS
   ,:PRAT_COM_EMAIL
   ,:PRAT_COM_LETTERA
  DO BEGIN

    /* =================================== */
    /* Lettera */
    /* ----------------------------------- */
    IF (
          MSG_TYPE_LETTER='T'
          AND (PRAT_COM_LETTERA='T' OR (SOGG_COM_LETTERA='T' AND COALESCE(PRAT_ID,0)=0))
          AND NOT EXISTS (SELECT CM.ID FROM COM_MESSAGGI CM WHERE CM.ID_SOURCE=:ID AND CM.RIF_ID=:RIF_ID AND CM.DATA>=:RIF_TIME_THRESHOLD AND CM.MSG_TYPE='lettera')
       )
    THEN BEGIN
      MSG_AMEZZO = 'lettera';
      SUSPEND;  
    END
    /* =================================== */

    /* =================================== */
    /* EMail */
    /* ----------------------------------- */
    IF (
          MSG_TYPE_EMAIL='T'
          AND (PRAT_COM_EMAIL='T' OR (SOGG_COM_EMAIL='T' AND COALESCE(PRAT_ID,0)=0))
          AND NOT EXISTS (SELECT CM.ID FROM COM_MESSAGGI CM WHERE CM.ID_SOURCE=:ID AND CM.RIF_ID=:RIF_ID AND CM.DATA>=:RIF_TIME_THRESHOLD AND CM.MSG_TYPE='e-mail')
       )
    THEN BEGIN
      MSG_AMEZZO = 'e-mail';
      SUSPEND;  
    END
    /* =================================== */

    /* =================================== */
    /* SMS */
    /* ----------------------------------- */
    IF (
          MSG_TYPE_SMS='T'
          AND (PRAT_COM_SMS='T' OR (SOGG_COM_SMS='T' AND COALESCE(PRAT_ID,0)=0))
          AND NOT EXISTS (SELECT CM.ID FROM COM_MESSAGGI CM WHERE CM.ID_SOURCE=:ID AND CM.RIF_ID=:RIF_ID AND CM.DATA>=:RIF_TIME_THRESHOLD AND CM.MSG_TYPE='sms')
       )
    THEN BEGIN
      MSG_AMEZZO = 'sms';
      SUSPEND;  
    END
    /* =================================== */

  END  

  EXIT;

END^

SET TERM ^ ;

