unit Frontend.Model.Usuario.Interfaces;

interface

uses
  Data.DB;

type
  iModelUsuario = interface
  ['{72C1B3CE-E26A-4284-9107-68E9629545C9}']
    function Codigo: Integer; overload;
    function Nome(AValue: string): iModelUsuario; overload;
    function Nome: string; overload;
    function Senha(AValue: string): iModelUsuario; overload;
    function Senha: string; overload;
    function CodPerfil(AValue: Integer): iModelUsuario; overload;
    function CodPerfil: Integer; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
  end;

implementation

end.
