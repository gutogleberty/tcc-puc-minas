unit Frontend.Model.Secao;

interface

uses
  Frontend.Model.Secao.Interfaces,
  Data.DB,
  System.JSON,
  REST.Types,
  FireDAC.Comp.Client;

type
  TModelSecao = class(TInterfacedObject, iModelSecao)
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelSecao;
    function Codigo(AValue: Integer): iModelSecao; overload;
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelSecao; overload;
    function Descricao: string; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
    procedure Deletar;
  end;

implementation

uses
  Frontend.Model.RequestRestPadrao;

{ TModelSecao }

procedure TModelSecao.Alterar;
var
  LJSONMaster: TJSONObject;
  LJSONSecao: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONSecao := TJSONObject.Create;
  LJSONSecao.AddPair('codigo',TJSONNumber.Create(codigo));
  LJSONSecao.AddPair('descricao',TJSONString.Create(descricao));
  LJSONMaster.AddPair('secao',LJSONSecao);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('secao')
                      .Method(rmPUT)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

procedure TModelSecao.Cadastrar;
var
  LJSONMaster: TJSONObject;
  LJSONSecao: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONSecao := TJSONObject.Create;
  LJSONSecao.AddPair('descricao',TJSONString.Create(descricao));
  LJSONMaster.AddPair('secao',LJSONSecao);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('secao')
                      .Method(rmPOST)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

function TModelSecao.Codigo(AValue: Integer): iModelSecao;
begin
   Result := Self;
   FCodigo := AValue;
end;

function TModelSecao.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TModelSecao.Create;
begin

end;

function TModelSecao.Descricao(AValue: string): iModelSecao;
begin
  Result := Self;
  FDescricao := AValue;
end;

procedure TModelSecao.Deletar;
var
  LJSONMaster: TJSONObject;
  LJSONSecao: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONSecao := TJSONObject.Create;
  LJSONSecao.AddPair('codigo',TJSONNumber.Create(codigo));
  LJSONMaster.AddPair('secao',LJSONSecao);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('secao')
                      .Method(rmDELETE)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

function TModelSecao.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TModelSecao.Destroy;
begin

  inherited;
end;

procedure TModelSecao.Listar(ADataSet: TDataSet);
var
  LJSONMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONProduto: TJSONArray;
begin
  LJSONMaster := TModelRequestRestPadrao.New
                    .Server('localhost')
                    .Port(9000)
                    .Resource('secao')
                    .Method(rmGET)
                    .Request1;

  PairCabecalho := LJSONMaster.Get('secao');

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

class function TModelSecao.New: iModelSecao;
begin
  Result := Self.Create;
end;

end.
