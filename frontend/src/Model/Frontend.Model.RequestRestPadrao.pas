unit Frontend.Model.RequestRestPadrao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.SvcMgr,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  FireDAC.Comp.Client,
  System.Hash,
  Data.DB,
  IdHashMessageDigest,
  IniFiles,
  Vcl.Forms,
  System.JSON,
  REST.Types,
  REST.Client,
  REST.Authenticator.Basic,
  Winapi.WinInet,
  System.DateUtils,
  Frontend.Model.RequestRestPadrao.Interfaces,
  System.Generics.Collections;

type
  TModelRequestRestPadrao = class (TInterfacedObject, iModelRequestRestPadraoInterfaces)
    private
      FHost: string;
      FPort: Integer;
      FResource: string;
      FMethod: TRESTRequestMethod;
      FParametros: TDictionary<string, string>;
      FJSON: TJSONObject;
    public
      constructor Create;
      destructor Destroy; override;
      class function New: iModelRequestRestPadraoInterfaces;
      function Server(const AValue: string): iModelRequestRestPadraoInterfaces;
      function Port(const AValue: Integer): iModelRequestRestPadraoInterfaces;
      function Resource(const AValue: string): iModelRequestRestPadraoInterfaces;
      function Method(const Method: TRESTRequestMethod): iModelRequestRestPadraoInterfaces;
      function AddParametros(const AKey, AValue: string): iModelRequestRestPadraoInterfaces;
      function AddJSON(const AValue: TJSONObject): iModelRequestRestPadraoInterfaces;
      function Request: Integer;
      function Request1: TJSONObject;
      function GetAPI: TRESTResponse;
  end;

const
  UserName: string = 'pucminasusername';
  Password: string = 'pucminaspassword';

implementation

constructor TModelRequestRestPadrao.Create;
begin
  FParametros := TDictionary<string, string>.Create;
end;

destructor TModelRequestRestPadrao.Destroy;
begin
  FParametros.Free;
  inherited;
end;

function TModelRequestRestPadrao.GetAPI: TRESTResponse;
var
  JSONTabelaCliente: TJSONObject;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
  RESTResponse1: TRESTResponse;
  HTTPBasicAuthenticator1: THTTPBasicAuthenticator;
  Key: string;
begin
  RESTClient1 := TRESTClient.Create(nil);
  RESTRequest1 := TRESTRequest.Create(nil);
  RESTResponse1 := TRESTResponse.Create(nil);

  RESTClient1.AcceptCharset := 'UTF-8';
  RESTClient1.ContentType := 'application/json';

  HTTPBasicAuthenticator1 := THTTPBasicAuthenticator.Create(nil);

  RESTClient1.Authenticator := HTTPBasicAuthenticator1;

  RESTRequest1.Client := RESTClient1;
  RESTRequest1.Response := RESTResponse1;

  HTTPBasicAuthenticator1.Username := UserName;
  HTTPBasicAuthenticator1.Password := PassWord;

  try
    RESTClient1.BaseURL := 'http://' + FHost + ':' + FPort.ToString;
    RESTRequest1.Resource := FResource;

    RESTRequest1.Method := FMethod;

    if FParametros.Count > 0 then
    begin
      RESTRequest1.Params.Clear;
      for Key in FParametros.Keys do
        RESTRequest1.Params.AddItem(Key,FParametros[Key],TRESTRequestParameterKind.pkQUERY);
    end;

    if RESTRequest1.Method in [rmPOST,rmPUT,rmDELETE] then
    begin
      RESTRequest1.AddParameter('bodyCDE1CB3D0EEA4D2998948CB9784EA17B',FJSON.ToString,pkGETorPOST);
      RESTRequest1.Params[0].ContentType := ctAPPLICATION_JSON;
    end;

    RESTRequest1.Execute;

    Result := RESTResponse1;

  finally
    FreeAndNil(RESTClient1);
    FreeAndNil(RESTRequest1);
    // FreeAndNil(RESTResponse1);
    FreeAndNil(HTTPBasicAuthenticator1);
  end;
end;

function TModelRequestRestPadrao.Request: Integer;
var
  RESTResponse: TRESTResponse;
begin
  RESTResponse := GetAPI;

  Result := RESTResponse.StatusCode;
end;

function TModelRequestRestPadrao.Request1: TJSONObject;
var
  RESTResponse: TRESTResponse;
begin
  RESTResponse := GetAPI;

  if RESTResponse.StatusCode = 200 then
    Result := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(RESTResponse.Content),0) as TJSONObject;
end;

class function TModelRequestRestPadrao.New: iModelRequestRestPadraoInterfaces;
begin
  Result := Self.Create;
end;

function TModelRequestRestPadrao.Server(const AValue: string): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FHost := AValue;
end;

function TModelRequestRestPadrao.AddJSON(
  const AValue: TJSONObject): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FJSON := AValue;
end;

function TModelRequestRestPadrao.AddParametros(const AKey, AValue: string): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FParametros.Add(AKey, AValue);
end;

function TModelRequestRestPadrao.Method(
  const Method: TRESTRequestMethod): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FMethod := Method;
end;

function TModelRequestRestPadrao.Port(const aValue: Integer): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FPort := AValue;
end;

function TModelRequestRestPadrao.Resource(const aValue: string): iModelRequestRestPadraoInterfaces;
begin
  Result := Self;
  FResource := aValue;
end;
end.
