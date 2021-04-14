unit SmartKey;

interface

const
     {------------------------------------------------
      Smartkey mode codes
      ------------------------------------------------}
     SCRAMBLING_MODE     =      'S';
     READING_MODE        =      'R';
     WRITING_MODE        =      'W';
     FIXING_MODE         =      'F';
     LOCATING_MODE       =      'L';
     COMPARING_MODE      =      'C';
     PROGRAMMING_MODE	 =      'P';
     MODEL_READING_MODE  =      'M';
     ENCRYPTING_MODE     =      'E';

     {------------------------------------------------
      Return codes
      ------------------------------------------------}
     ST_OK               =     0;   {No errors}
     ST_NONE_KEY         =     -1;  {No Smartkey present}
     ST_SYNT_ERR         =     -2;  {Syntax error}
     ST_LABEL_FAILED     =     -3;  {Uncorrect label}
     ST_PW_DATA_FAILED   =     -4;  {Uncorrect password or data}
     ST_HW_FAILURE       =     -20; {Smartkey damaged}

     {------------------------------------------------
      Smartkey models
      ------------------------------------------------}
     SKEY_NONE           =     '0';  {No Smartkey}
     SKEY_FX             =     '1';  {Smartkey mod. FX}
     SKEY_PR             =     '2';  {Smartkey mod. PR}
     SKEY_EP             =     '3';  {Smartkey mod. EP}
     SKEY_NET_5          =     '4';  {Smartkey mod. NET 5 users}
     SKEY_NET_10         =     '5';  {Smartkey mod. NET 10 users}
     SKEY_NET_25         =     '6';  {Smartkey mod. NET 25 users}
     SKEY_NET_50         =     '7';  {Smartkey mod. NET 50 users}
     SKEY_NET_NL         =     '8';  {Smartkey mod. NET no limit}
     SKEY_SR             =     '9';  {Smartkey mod. SR}
     SKEY_NET            =     'A';  {Smartkey mod. NET}

     {------------------------------------------------
      Field length
      ------------------------------------------------}
     MAX_LENGTH_LABEL    =     16;
     MAX_LENGTH_PW       =     16;
     MAX_LENGTH_DATA     =     64;
     MAX_LENGTH_EXT_DATA =     352;
     SCRAMBLE_LENGTH     =     8;

     function LocateSKey(var port:Smallint; const skLabel:String):Smallint;
     function ModelSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
     function ReadSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
     function WriteSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
     function ScrambleSKey(port:Smallint; const skLabel, skPassword:String; indata, outdata : PAnsiChar):Smallint;
     function StatusToString(status:Smallint):String;

implementation

uses SysUtils;

type
     {------------------------------------------------
      Communication structure definition
      ------------------------------------------------}
    SKEY_DATA = record
              lpt          : Smallint;
              command      : Smallint;
              smlabel      : array[0 .. MAX_LENGTH_LABEL-1] of AnsiChar;
              smpassword   : array[0 .. MAX_LENGTH_PW-1]    of AnsiChar;
              smdata       : array[0 .. MAX_LENGTH_DATA-1]  of AnsiChar;
              fail_counter : Smallint;
              smstatus     : Smallint;
              sm_ext_data  : array[0 .. MAX_LENGTH_EXT_DATA-1]  of AnsiChar;
    end; {SKEY_DATA}

var
   buffer : SKEY_DATA;

{------------------------------------------------
        Interface function prototype
------------------------------------------------}
procedure MSCLINK(var keydata:SKEY_DATA);stdcall; external 'SKEYDRV.DLL';

procedure ClearBuffer;
begin
     FillChar(buffer,SizeOf(buffer),#0);
end;

function LocateSKey(var port:Smallint; const skLabel:String):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(LOCATING_MODE);
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     msclink(buffer);
     port:=buffer.lpt;
     result:=buffer.smstatus;
end; {Locate}

function ReadSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(READING_MODE);
     buffer.lpt:=port;
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     StrPLCopy(buffer.smpassword,skPassword,MAX_LENGTH_PW);
     msclink(buffer);
     result:=buffer.smstatus;
     if result=0 then
	StrLCopy(data,buffer.smdata,MAX_LENGTH_DATA);
end; {Read}

function ModelSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(MODEL_READING_MODE);
     buffer.lpt:=port;
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     StrPLCopy(buffer.smpassword,skPassword,MAX_LENGTH_PW);
     msclink(buffer);
     result:=buffer.smstatus;
     if result=0 then
	StrLCopy(data,buffer.smdata,MAX_LENGTH_DATA);
end; {Model}

function WriteSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(WRITING_MODE);
     buffer.lpt:=port;
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     StrPLCopy(buffer.smpassword,skPassword,MAX_LENGTH_PW);
     StrLCopy(buffer.smdata,data,MAX_LENGTH_DATA);
     msclink(buffer);
     result:=buffer.smstatus;
end; {Write}

function ScrambleSKey(port:Smallint; const skLabel, skPassword:String; indata, outdata:PAnsiChar):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(SCRAMBLING_MODE);
     buffer.lpt:=port;
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     StrPLCopy(buffer.smpassword,skPassword,MAX_LENGTH_PW);
     StrLCopy(buffer.smdata,indata,SCRAMBLE_LENGTH);
     msclink(buffer);
     result:=buffer.smstatus;
     if result=0 then
        StrLCopy(outdata,buffer.smdata,SCRAMBLE_LENGTH);
end; {Scramble}

function CompareSKey(port:Smallint; const skLabel, skPassword:String; data:PAnsiChar):Smallint;
begin
     ClearBuffer;
     buffer.command:=Ord(COMPARING_MODE);
     buffer.lpt:=port;
     StrPLCopy(buffer.smlabel,skLabel,MAX_LENGTH_LABEL);
     StrPLCopy(buffer.smpassword,skPassword,MAX_LENGTH_PW);
     StrLCopy(buffer.smdata,data,MAX_LENGTH_DATA);
     msclink(buffer);
     result:=buffer.smstatus;
end; {Compare}

function StatusToString(status:Smallint):String;
begin
     result:=IntToStr(status)+' <no status info available>';
     case status of
          ST_OK :             result:='Ok';
	  ST_NONE_KEY :       result:='No Smartkey found';
	  ST_SYNT_ERR :       result:='Syntax error during driver call';
	  ST_LABEL_FAILED :   result:='Wrong Label';
	  ST_PW_DATA_FAILED : result:='Wrong password or data mismatch';
	  ST_HW_FAILURE :     result:='Write operation error';
     end;
end;

end.