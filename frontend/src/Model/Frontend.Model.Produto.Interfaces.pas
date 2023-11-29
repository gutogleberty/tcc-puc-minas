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
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
  end;

implementation

end.
