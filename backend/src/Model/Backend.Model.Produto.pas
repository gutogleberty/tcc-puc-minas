unit Backend.Model.Produto;

interface

uses
  System.JSON,
  System.Generics.Collections;

type
  TModelProduto = class
  private
    FDescricao: string;
    FCodigo: Integer;
    FCodFabricante: Integer;
    FValorUnitario: Currency;
    FCodSecao: Integer;
    FDesFabricante: string;
    FDesSecao: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property CodFabricante: Integer read FCodFabricante write FCodFabricante;
    property CodSecao: Integer read FCodSecao write FCodSecao;
    property ValorUnitario: Currency read FValorUnitario write FValorUnitario;
    property DesFabricante: string read FDesFabricante write FDesFabricante;
    property DesSecao: string read FDesSecao write FDesSecao;
    function GetJSON(var ListaProduto: TList<TModelProduto>): TJSONObject;
  end;

implementation

{ TModelProduto }

constructor TModelProduto.Create;
begin

end;

destructor TModelProduto.Destroy;
begin

  inherited;
end;

function TModelProduto.GetJSON(var ListaProduto: TList<TModelProduto>): TJSONObject;
var
  LJSONMaster: TJSONObject;
  LJSONProduto: TJSONObject;
  LJSONListaProduto: TJSONArray;
begin
  if ListaProduto.Count > 0 then
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaProduto := TJSONArray.Create;

    for var I := 0 to Pred(ListaProduto.Count) do
    begin
      LJSONProduto := TJSONObject.Create;
      LJSONProduto.AddPair('codigo',TJSONNumber.Create(ListaProduto[I].Codigo));
      LJSONProduto.AddPair('descricao',TJSONString.Create(ListaProduto[I].Descricao));
      LJSONProduto.AddPair('fabricante',TJSONString.Create(ListaProduto[I].DesFabricante));
      LJSONProduto.AddPair('secao',TJSONString.Create(ListaProduto[I].DesSecao));
      LJSONProduto.AddPair('valorunitario',TJSONNumber.Create(ListaProduto[I].ValorUnitario));
      LJSONListaProduto.AddElement(LJSONProduto);
    end;
    LJSONMaster.AddPair('produtos',LJSONListaProduto);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(ListaProduto.Count));
    Result := LJSONMaster;
  end
  else
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaProduto := TJSONArray.Create;
    LJSONMaster.AddPair('produtos',LJSONListaProduto);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(0));
    Result := LJSONMaster;
  end;
end;

end.
