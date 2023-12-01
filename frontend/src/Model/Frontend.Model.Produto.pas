unit Frontend.Model.Produto;

interface

uses
  Frontend.Model.Produto.Interfaces,
  Data.DB,
  System.JSON,
  REST.Types,
  FireDAC.Comp.Client;

type
  TModelProduto = class(TInterfacedObject, iModelProduto)
  private
    FCodigo: Integer;
    FDescricao: string;
    FCodFabricante: Integer;
    FCodSecao: Integer;
    FValorUnitario: Currency;
    FEstoque: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelProduto;
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

uses
  Frontend.Model.RequestRestPadrao;

{ TModelProduto }

procedure TModelProduto.Alterar;
var
  LJSONMaster: TJSONObject;
  LJSONProduto: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONProduto := TJSONObject.Create;
  LJSONProduto.AddPair('codigo',TJSONNumber.Create(Codigo));
  LJSONProduto.AddPair('descricao',TJSONString.Create(Descricao));
  LJSONProduto.AddPair('codfabricante',TJSONNumber.Create(CodFabricante));
  LJSONProduto.AddPair('codsecao',TJSONNumber.Create(CodSecao));
  LJSONProduto.AddPair('valorunitario',TJSONNumber.Create(ValorUnitario));
  LJSONProduto.AddPair('estoque',TJSONNumber.Create(Estoque));
  LJSONMaster.AddPair('produto',LJSONProduto);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('produtos')
                      .Method(rmPUT)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

procedure TModelProduto.Cadastrar;
var
  LJSONMaster: TJSONObject;
  LJSONProduto: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONProduto := TJSONObject.Create;
  LJSONProduto.AddPair('descricao',TJSONString.Create(Descricao));
  LJSONProduto.AddPair('codfabricante',TJSONNumber.Create(CodFabricante));
  LJSONProduto.AddPair('codsecao',TJSONNumber.Create(CodSecao));
  LJSONProduto.AddPair('valorunitario',TJSONNumber.Create(ValorUnitario));
  LJSONProduto.AddPair('estoque',TJSONNumber.Create(Estoque));
  LJSONMaster.AddPair('produto',LJSONProduto);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('produtos')
                      .Method(rmPOST)
                      .AddJSON(LJSONMaster)
                      .Request1;

end;

function TModelProduto.CodFabricante: Integer;
begin
  Result := FCodFabricante;
end;

function TModelProduto.Codigo(AValue: Integer): iModelProduto;
begin
  Result := Self;
  FCodigo := AValue;
end;

function TModelProduto.CodFabricante(AValue: Integer): iModelProduto;
begin
  Result := Self;
  FCodFabricante := AValue;
end;

function TModelProduto.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelProduto.CodSecao: Integer;
begin
  Result := FCodSecao;
end;

function TModelProduto.CodSecao(AValue: Integer): iModelProduto;
begin
  Result := Self;
  FCodSecao := AValue;
end;

constructor TModelProduto.Create;
begin

end;

procedure TModelProduto.Deletar;
var
  LJSONMaster: TJSONObject;
  LJSONProduto: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONProduto := TJSONObject.Create;
  LJSONProduto.AddPair('codigo',TJSONNumber.Create(Codigo));
  LJSONMaster.AddPair('produto',LJSONProduto);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('produtos')
                      .Method(rmDELETE)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

function TModelProduto.Descricao: string;
begin
  Result := FDescricao;
end;

function TModelProduto.Descricao(AValue: string): iModelProduto;
begin
  Result := Self;
  FDescricao := AValue;
end;

destructor TModelProduto.Destroy;
begin

  inherited;
end;

function TModelProduto.Estoque: Integer;
begin
  Result := Estoque;
end;

function TModelProduto.Estoque(AValue: Integer): iModelProduto;
begin
  Result := Self;
  FEstoque := AValue;
end;

procedure TModelProduto.Listar(ADataSet: TDataSet);
var
  LJSONMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONProduto: TJSONArray;
begin
  LJSONMaster := TModelRequestRestPadrao.New
                    .Server('localhost')
                    .Port(9000)
                    .Resource('produtos')
                    .Method(rmGET)
                    .Request1;

  PairCabecalho := LJSONMaster.Get('produtos');

  LJSONProduto := PairCabecalho.JsonValue as TJSONArray;

  ADataSet.Close;
  TFDMemTable(ADataSet).CreateDataSet;
  try
    for var I := 0 to Pred(LJSONProduto.Size) do
    begin
      if not ADataSet.Active then
        ADataSet.Append;
      ADataSet.Insert;
      ADataSet.FieldByName('codigo').AsInteger := LJSONProduto.Get(I).GetValue<Integer>('codigo');
      ADataSet.FieldByName('descricao').AsString := LJSONProduto.Get(I).GetValue<string>('descricao');
      ADataSet.FieldByName('fabricante').AsString := LJSONProduto.Get(I).GetValue<string>('fabricante');
      ADataSet.FieldByName('secao').AsString := LJSONProduto.Get(I).GetValue<string>('secao');
      ADataSet.FieldByName('valorunitario').AsCurrency := LJSONProduto.Get(I).GetValue<Currency>('valorunitario');
      ADataSet.FieldByName('estoque').AsInteger := LJSONProduto.Get(I).GetValue<Integer>('estoque');
      ADataSet.Post;
    end;
  finally

  end;
end;

class function TModelProduto.New: iModelProduto;
begin
  Result := Self.Create;
end;

function TModelProduto.ValorUnitario(AValue: Currency): iModelProduto;
begin
  Result := Self;
  FValorUnitario := AValue;
end;

function TModelProduto.ValorUnitario: Currency;
begin
  Result := FValorUnitario;
end;

end.
