unit Frontend.Model.Perfil;

interface

uses
  Frontend.Model.Perfil.Interfaces,
  Data.DB,
  System.JSON,
  FireDAC.Comp.Client,
  REST.Types;

type
  TModelPerfil = class(TInterfacedObject, iModelPerfil)
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPerfil;
    function Codigo: Integer; overload;
    function Descricao(AValue: string): iModelPerfil; overload;
    function Descricao: string; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
  end;

implementation

uses
  Frontend.Model.RequestRestPadrao;

{ TModelPerfil }

procedure TModelPerfil.Alterar;
var
  LJSONMaster: TJSONObject;
  LJSONPerfil: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONPerfil := TJSONObject.Create;
  LJSONPerfil.AddPair('codigo',TJSONNumber.Create(Codigo));
  LJSONPerfil.AddPair('descricao',TJSONString.Create(Descricao));
  LJSONMaster.AddPair('perfil',LJSONPerfil);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('perfil')
                      .Method(rmPUT)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

procedure TModelPerfil.Cadastrar;
var
  LJSONMaster: TJSONObject;
  LJSONPerfil: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONPerfil := TJSONObject.Create;
  LJSONPerfil.AddPair('descricao',TJSONString.Create(descricao));
  LJSONMaster.AddPair('perfil',LJSONPerfil);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('perfil')
                      .Method(rmPOST)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

function TModelPerfil.Codigo: Integer;
begin
  Result := FCodigo;
end;

constructor TModelPerfil.Create;
begin

end;

function TModelPerfil.Descricao(AValue: string): iModelPerfil;
begin
  Result := Self;
  FDescricao := AValue;
end;

function TModelPerfil.Descricao: string;
begin
  Result := FDescricao;
end;

destructor TModelPerfil.Destroy;
begin

  inherited;
end;

procedure TModelPerfil.Listar(ADataSet: TDataSet);
var
  LJSONMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONPerfil: TJSONArray;
begin
  LJSONMaster := TModelRequestRestPadrao.New
                    .Server('localhost')
                    .Port(9000)
                    .Resource('perfil')
                    .Method(rmGET)
                    .Request1;

  PairCabecalho := LJSONMaster.Get('perfil');

  LJSONPerfil := PairCabecalho.JsonValue as TJSONArray;

  ADataSet.Close;
  TFDMemTable(ADataSet).CreateDataSet;
  try
    for var I := 0 to Pred(LJSONPerfil.Size) do
    begin
      if not ADataSet.Active then
        ADataSet.Append;
      ADataSet.Insert;
      ADataSet.FieldByName('codigo').AsInteger := LJSONPerfil.Get(I).GetValue<Integer>('codigo');
      ADataSet.FieldByName('descricao').AsString := LJSONPerfil.Get(I).GetValue<string>('descricao');
      ADataSet.Post;
    end;
  finally

  end;
end;

class function TModelPerfil.New: iModelPerfil;
begin
  Result := Self.Create;
end;

end.
