unit Frontend.Model.Fabricante;

interface

uses
  Frontend.Model.Fabricante.Interfaces,
  Data.DB,
  System.JSON,
  REST.Types,
  FireDAC.Comp.Client;

type
  TModelFabricante = class(TInterfacedObject, iModelFabricante)
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelFabricante;
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

uses
  Frontend.Model.RequestRestPadrao;

{ TModelFabricante }

procedure TModelFabricante.Alterar;
var
  LJSONMaster: TJSONObject;
  LJSONFabricante: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONFabricante := TJSONObject.Create;
  LJSONFabricante.AddPair('codigo',TJSONNumber.Create(codigo));
  LJSONFabricante.AddPair('descricao',TJSONString.Create(descricao));
  LJSONMaster.AddPair('fabricante',LJSONFabricante);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('fabricantes')
                      .Method(rmPUT)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

procedure TModelFabricante.Cadastrar;
var
  LJSONMaster: TJSONObject;
  LJSONFabricante: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONFabricante := TJSONObject.Create;
  LJSONFabricante.AddPair('descricao',TJSONString.Create(descricao));
  LJSONMaster.AddPair('fabricante',LJSONFabricante);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('fabricantes')
                      .Method(rmPOST)
                      .AddJSON(LJSONMaster)
                      .Request1;

end;

function TModelFabricante.Codigo(AValue: Integer): iModelFabricante;
begin
  Result := Self;
  FCodigo := AValue;
end;

function TModelFabricante.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TModelFabricante.Create;
begin

end;

function TModelFabricante.Descricao(AValue: string): iModelFabricante;
begin
  Result := Self;
  FDescricao := AValue;
end;

procedure TModelFabricante.Deletar;
var
  LJSONMaster: TJSONObject;
  LJSONFabricante: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONFabricante := TJSONObject.Create;
  LJSONFabricante.AddPair('codigo',TJSONNumber.Create(codigo));
  LJSONMaster.AddPair('fabricante',LJSONFabricante);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('fabricantes')
                      .Method(rmDELETE)
                      .AddJSON(LJSONMaster)
                      .Request1;

end;

function TModelFabricante.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TModelFabricante.Destroy;
begin

  inherited;
end;

procedure TModelFabricante.Listar(ADataSet: TDataSet);
var
  LJSONMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONProduto: TJSONArray;
begin
  LJSONMaster := TModelRequestRestPadrao.New
                    .Server('localhost')
                    .Port(9000)
                    .Resource('fabricantes')
                    .Method(rmGET)
                    .Request1;

  PairCabecalho := LJSONMaster.Get('fabricantes');

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
      ADataSet.Post;
    end;
  finally

  end;
end;

class function TModelFabricante.New: iModelFabricante;
begin
  Result := Self.Create;
end;

end.
