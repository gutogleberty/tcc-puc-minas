unit Frontend.Model.RequestRestPadrao.Interfaces;

interface

uses
  System.JSON,
  REST.Client,
  REST.Types,
  System.Generics.Collections;

type
  iModelRequestRestPadraoInterfaces = interface
    ['{827B54CE-9F54-49A8-BAFB-98D721EB47C4}']
    function Server(const AValue: string): iModelRequestRestPadraoInterfaces;
    function Port(const AValue: Integer): iModelRequestRestPadraoInterfaces;
    function Resource(const AValue: string): iModelRequestRestPadraoInterfaces;
    function Method(const Method: TRESTRequestMethod): iModelRequestRestPadraoInterfaces;
    function AddParametros(const AKey, AValue: string): iModelRequestRestPadraoInterfaces;
    function AddJSON(const AValue: TJSONObject): iModelRequestRestPadraoInterfaces;
    function Request: Integer;
    function Request1: TJSONObject;
  end;

implementation

end.
