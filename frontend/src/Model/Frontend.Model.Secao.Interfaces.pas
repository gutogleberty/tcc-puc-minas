unit Frontend.Model.Secao.Interfaces;

interface

uses
  Data.DB;

type
  iModelSecao = interface
  ['{3597D9A7-74D4-4ED8-9A66-3F548CE1AF7F}']
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelSecao; overload;
    function Descricao: string; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
  end;

implementation

end.
