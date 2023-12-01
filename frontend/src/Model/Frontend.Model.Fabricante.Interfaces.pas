unit Frontend.Model.Fabricante.Interfaces;

interface

uses
  Data.DB;

type
  iModelFabricante = interface
  ['{24F3FDE2-FDFA-4947-8D8C-D45188A1E167}']
    function Codigo(AValue: Integer): iModelFabricante; overload;
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelFabricante; overload;
    function Descricao: string; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
    procedure Deletar;
  end;

implementation

end.
