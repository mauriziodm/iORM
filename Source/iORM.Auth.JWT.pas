{
  ****************************************************************************
  *                                                                          *
  *           iORM - (interfaced ORM)                                        *
  *                                                                          *
  *           Copyright (C) 2015-2023 Maurizio Del Magno                     *
  *                                                                          *
  *           mauriziodm@levantesw.it                                        *
  *           mauriziodelmagno@gmail.com                                     *
  *           https://github.com/mauriziodm/iORM.git                         *
  *                                                                          *
  ****************************************************************************
  *                                                                          *
  * This file is part of iORM (Interfaced Object Relational Mapper).         *
  *                                                                          *
  * Licensed under the GNU Lesser General Public License, Version 3;         *
  *  you may not use this file except in compliance with the License.        *
  *                                                                          *
  * iORM is free software: you can redistribute it and/or modify             *
  * it under the terms of the GNU Lesser General Public License as published *
  * by the Free Software Foundation, either version 3 of the License, or     *
  * (at your option) any later version.                                      *
  *                                                                          *
  * iORM is distributed in the hope that it will be useful,                  *
  * but WITHOUT ANY WARRANTY; without even the implied warranty of           *
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            *
  * GNU Lesser General Public License for more details.                      *
  *                                                                          *
  * You should have received a copy of the GNU Lesser General Public License *
  * along with iORM.  If not, see <http://www.gnu.org/licenses/>.            *
  *                                                                          *
  ****************************************************************************
}
unit iORM.Auth.JWT;

interface

uses
  iORM.Attributes, System.NetEncoding, iORM.Auth.Interfaces;

type

  TioJWT_Header = class
  private
    Falg: String; // algorithm for signature
    Ftyp: String; // token type
  public
    constructor Create;
    property alg: String read Falg write Falg;
    property typ: String read Ftyp write Ftyp;
  end;

  TioJWT = class
  private
    // header
    [ioSkip] FHeader: TioJWT_Header;
    // payload claims
    Faid: integer; // app id (managed by iorm)
    Fapp: String; // app name (managed by iorm)
    Faud: String; // audience (potrebbe rappresentare i resource server ai quali la client app o l'utente sono autorizzati ad accedere)
    Fexp: TDateTime; // expiration
    Fiat: TDateTime; // issued at time
    Fiss: String; // issuer (rappresente colui che ha rilasciato il token, potrebbe essere l'authorization server stesso)
    Fjti: String; // jwt id (id univoco che identifica il token, es. si usa per annullare un token emesso attraverso una black list)
    Fnbf: TDateTime; // not before
    Frfa: TDateTime; // the access token nedd to be refreshed after this DateTime
    Fsub: String; // subject
    Ftyp: String; // token type
    Fuid: integer; // user id (managed by iorm)
    Fusr: String; // user name (managed by iorm)
    // others
    [ioSkip] FBase64URLEncoding: TBase64URLEncoding;
    [ioSkip] FIsVerified: Boolean;
    // methods
    procedure _DoDecodeHeader(const AHeaderBase64: String); inline;
    procedure _DoDecodePayload(const APayloadBase64: String); inline;
    function _DoEncodeHeader: String; inline;
    function _DoEncodePayload: String; inline;
  protected
    // ---------- methods to be overrided ----------
    function _DoIsExpired(const ANow: TDateTime): Boolean; virtual;
    function _DoIsNotYetValid(const ANow: TDateTime): Boolean; virtual;
    function _DoIsToBeRefreshed(const ANow: TDateTime): Boolean; virtual;
    function _DoSign(const AEncodedHeader, AEncodedPayload, ASecret: String): String; virtual;
    function _DoVerifySignature(const AEncodedHeader, AEncodedPayload, ASignature, ASecret: String): Boolean; virtual;
    // ---------- methods to be overrided ----------
  public
    constructor Create; virtual;
    constructor CreateByToken(const AToken, ASecret: String);
    destructor Destroy; override;
    // methods
    function HasAppID: Boolean;
    function HasApp: Boolean;
    function HasAudience: Boolean;
    function HasExpiration: Boolean;
    function HasIssuedAtTime: Boolean;
    function HasIssuer: Boolean;
    function HasJwtID: Boolean;
    function HasNotBefore: Boolean;
    function HasRefreshAfter: Boolean;
    function HasSubject: Boolean;
    function HasTokenType: Boolean;
    function HasUserID: Boolean;
    function HasUser: Boolean;
    function TokenAsString(const ASecret: String): String;
    // checks
    function IsExpired(const ANow: TDateTime): Boolean;
    function IsNotYetValid(const ANow: TDateTime): Boolean;
    function IsToBeRefreshed(const ANow: TDateTime): Boolean;
    // claims
    property AppID: Integer read Faid write Faid;
    property App: String read Fapp write Fapp;
    property Audience: String read Faud write Faud;
    property Expiration: TDateTime read Fexp write Fexp;
    property IssueAtTime: TDateTime read Fiat write Fiat;
    property Issuer: String read Fiss write Fiss;
    property JwtID: String read Fjti write Fjti;
    property NotBefore: TDateTime read Fnbf write Fnbf;
    property RefreshAfter: TDateTime read Frfa write Frfa;
    property Subject: String read Fsub write Fsub;
    property TokenType: String read Ftyp write Ftyp;
    property UserID: Integer read Fuid write Fuid;
    property User: String read Fusr write Fusr;
    // token
    property IsVerified: Boolean read FIsVerified;
  end;

implementation

uses
  System.Types, System.SysUtils, System.StrUtils, System.DateUtils, System.Hash, System.IOUtils, iORM.CommonTypes, DJSON, DJSON.Params;

{ TioAuthJWT }

constructor TioJWT.Create;
begin
  // header
  FHeader := TioJWT_Header.Create;
  // payload claims
  Faid := IO_INTEGER_NULL_VALUE;
  Fapp := IO_STRING_NULL_VALUE;
  Faud := IO_STRING_NULL_VALUE;
  Fexp := IO_DATETIME_NULL_VALUE;
  Fiat := IO_DATETIME_NULL_VALUE;
  Fiss := IO_STRING_NULL_VALUE;
  Fjti := IO_STRING_NULL_VALUE;
  Fnbf := IO_DATETIME_NULL_VALUE;
  Frfa := IO_DATETIME_NULL_VALUE;
  Fsub := IO_STRING_NULL_VALUE;
  Fuid := IO_INTEGER_NULL_VALUE;
  Fusr := IO_STRING_NULL_VALUE;
  Ftyp := IO_STRING_NULL_VALUE;
  // others
  FBase64URLEncoding := TBase64URLEncoding.Create;
  FIsVerified := False;
end;

constructor TioJWT.CreateByToken(const AToken, ASecret: String);
const
  TOKEN_HEADER_IDX = 0;
  TOKEN_PAYLOAD_IDX = 1;
  TOKEN_SIGNATURE_IDX = 2;
var
  LSplittedToken: TStringDynArray;
begin
  // initialization
  Create;
  // Split the token
  LSplittedToken := SplitString(AToken, '.');
  // Verify the signature
  FIsVerified := (LSplittedToken <> nil) and (Length(LSplittedToken) = 3)
    and _DoVerifySignature(LSplittedToken[TOKEN_HEADER_IDX], LSplittedToken[TOKEN_PAYLOAD_IDX], LSplittedToken[TOKEN_SIGNATURE_IDX], ASecret);
  // Decode
  _DoDecodeHeader(LSplittedToken[TOKEN_HEADER_IDX]);
  _DoDecodePayload(LSplittedToken[TOKEN_PAYLOAD_IDX]);
end;

destructor TioJWT.Destroy;
begin
  FBase64URLEncoding.Free;
  FHeader.Free;
  inherited;
end;

function TioJWT.TokenAsString(const ASecret: String): String;
begin
  Result := _DoSign(_DoEncodeHeader, _DoEncodePayload, ASecret);
end;

function TioJWT.HasApp: Boolean;
begin
  Result := Fapp <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasAppID: Boolean;
begin
  Result := Faid <> IO_INTEGER_NULL_VALUE;
end;

function TioJWT.HasAudience: Boolean;
begin
  Result := Faud <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasExpiration: Boolean;
begin
  Result := Fexp <> IO_DATETIME_NULL_VALUE;
end;

function TioJWT.HasIssuedAtTime: Boolean;
begin
  Result := Fiat <> IO_DATETIME_NULL_VALUE;
end;

function TioJWT.HasIssuer: Boolean;
begin
  Result := Fiss <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasJwtID: Boolean;
begin
  Result := Fjti <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasNotBefore: Boolean;
begin
  Result := Fnbf <> IO_DATETIME_NULL_VALUE;
end;

function TioJWT.HasRefreshAfter: Boolean;
begin
  Result := Frfa <> IO_DATETIME_NULL_VALUE;
end;

function TioJWT.HasSubject: Boolean;
begin
  Result := Fsub <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasUser: Boolean;
begin
  Result := Fusr <> IO_STRING_NULL_VALUE;
end;

function TioJWT.HasUserID: Boolean;
begin
  Result := Fuid <> IO_INTEGER_NULL_VALUE;
end;

function TioJWT.HasTokenType: Boolean;
begin
  Result := Ftyp <> IO_STRING_NULL_VALUE;
end;

function TioJWT.IsExpired(const ANow: TDateTime): Boolean;
begin
  Result := HasExpiration and _DoIsExpired(ANow);
end;

function TioJWT.IsNotYetValid(const ANow: TDateTime): Boolean;
begin
  Result := HasNotBefore and _DoIsNotYetValid(ANow);
end;

function TioJWT.IsToBeRefreshed(const ANow: TDateTime): Boolean;
begin
  Result := HasRefreshAfter and _DoIsToBeRefreshed(ANow);
end;

procedure TioJWT._DoDecodeHeader(const AHeaderBase64: String);
begin
  dj.FromJson( FBase64URLEncoding.Decode(AHeaderBase64) ).byFields.&To(FHeader);
end;

procedure TioJWT._DoDecodePayload(const APayloadBase64: String);
begin
  dj.FromJson( FBase64URLEncoding.Decode(APayloadBase64) ).byFields.DateTimeFormat(TdjDateTimeFormat.dfUnix).&To(Self);
end;

function TioJWT._DoEncodeHeader: String;
begin
  Result := dj.From(FHeader).byFields.ToJson;
  Result := FBase64URLEncoding.Encode(Result);
end;

function TioJWT._DoEncodePayload: String;
var
  LdjParams: IdjParams;
begin
  LdjParams := dj.DefaultByFields;
  LdjParams.DateTimeFormat := TdjDateTimeFormat.dfUnix;
  // aid = app id
  if not HasAppID then
    LdjParams.IgnoredProperties.Add('aid');
  // app = app
  if not HasApp then
    LdjParams.IgnoredProperties.Add('app');
  // aud = audience
  if not HasAudience then
    LdjParams.IgnoredProperties.Add('aud');
  // exp = expiration
  if not HasExpiration then
    LdjParams.IgnoredProperties.Add('exp');
  // iat = issued at time
  if not HasIssuedAtTime then
    LdjParams.IgnoredProperties.Add('iat');
  // iss = issuer
  if not HasIssuer then
    LdjParams.IgnoredProperties.Add('iss');
  // jti = jwt id
  if not HasJwtID then
    LdjParams.IgnoredProperties.Add('jti');
  // nbf = not before
  if not HasNotBefore then
    LdjParams.IgnoredProperties.Add('nbf');
  // rfa = refresh after
  if not HasRefreshAfter then
    LdjParams.IgnoredProperties.Add('rfa');
  // sub = subject
  if not HasSubject then
    LdjParams.IgnoredProperties.Add('sub');
  // typ = type
  if not HasTokenType then
    LdjParams.IgnoredProperties.Add('typ');
  // uid = user id
  if not HasUserID then
    LdjParams.IgnoredProperties.Add('uid');
  // usr = user name
  if not HasUser then
    LdjParams.IgnoredProperties.Add('usr');
  // Serialize claims (self)
  Result := dj.From(Self, LdjParams).ToJson;
  // Encode
  Result := FBase64URLEncoding.Encode(Result);
end;

function TioJWT._DoIsExpired(const ANow: TDateTime): Boolean;
begin
 Result := (ANow > Fexp);
end;

function TioJWT._DoIsNotYetValid(const ANow: TDateTime): Boolean;
begin
 Result := (ANow < Fnbf);
end;

function TioJWT._DoIsToBeRefreshed(const ANow: TDateTime): Boolean;
begin
 Result := (ANow > Frfa);
end;

function TioJWT._DoSign(const AEncodedHeader, AEncodedPayload, ASecret: String): String;
begin
  Result := AEncodedHeader + '.' + AEncodedPayload;
  Result := Result + '.' + THashSHA2.GetHMAC(Result, ASecret, SHA256);
end;

function TioJWT._DoVerifySignature(const AEncodedHeader, AEncodedPayload, ASignature, ASecret: String): Boolean;
var
  LSignature: String;
begin
  LSignature := THashSHA2.GetHMAC(AEncodedHeader + '.' + AEncodedPayload, ASecret, SHA256);
  Result := (LSignature = ASignature);
end;

{ TioAuthJWT_Header }

constructor TioJWT_Header.Create;
begin
  Falg := 'HS256';
  Ftyp := 'JWT';
end;

end.
