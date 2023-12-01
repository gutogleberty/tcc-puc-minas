unit Frontend.Model.Produto.Interfaces;

interface

uses
  Data.DB;

type
  iModelProduto = interface
    ['{B9F9A090-8EFD-4064-8C89-870859CFECE2}']
    function Codigo(AValue: Integer): iModelProduto; overload;
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelProduto; overload;
    function Descricao: string; overload;
    function CodFabricante(AValue: Integer): iModelProduto; overload;
    function CodFabricante: Integer; overload;
    function CodSecao(AValue: Integer): iModelProduto; overload;
    function CodSecao: Integer; overload;
    function ValorUnitario(AValue: Currency): iModelProduto; overload;
    function ValorUnitario: Currency; overload;
    function Estoque(AValue: Integer): iModelProduto; overload;
    function Estoque: Integer; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
    procedure Deletar;
  end;

implementation

end.
