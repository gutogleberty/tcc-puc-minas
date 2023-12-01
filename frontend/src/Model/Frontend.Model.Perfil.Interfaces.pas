unit Frontend.Model.Perfil.Interfaces;

interface

uses
  Data.DB;

type
  iModelPerfil = interface
  ['{D83FF639-DE62-44B5-BC12-5D06AD145BE6}']
    function Codigo(AValue: Integer): iModelPerfil; overload;
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelPerfil; overload;
    function Descricao: string; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
    procedure Deletar;
  end;

implementation

end.
