unit Frontend.Model.Usuario;

interface

uses
  Frontend.Model.Usuario.Interfaces,
  Data.DB,
  System.JSON,
  REST.Types,
  FireDAC.Comp.Client;

type
  TModelUsuario = class(TInterfacedObject, iModelUsuario)
  private
    FCodigo: Integer;
    FNome: string;
    FSenha: string;
    FCodPerfil: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelUsuario;
    function Codigo: Integer; overload;
    function Nome(AValue: string): iModelUsuario; overload;
    function Nome: string; overload;
    function Senha(AValue: string): iModelUsuario; overload;
    function Senha: string; overload;
    function CodPerfil(AValue: Integer): iModelUsuario; overload;
    function CodPerfil: Integer; overload;
    procedure Listar(ADataSet: TDataSet);
    procedure Cadastrar;
    procedure Alterar;
  end;

implementation

uses
  Frontend.Model.RequestRestPadrao;

{ TModelUsuario }

procedure TModelUsuario.Alterar;
var
  LJSONMaster: TJSONObject;
  LJSONUsuario: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONUsuario := TJSONObject.Create;
  LJSONUsuario.AddPair('codigo',TJSONNumber.Create(Codigo));
  LJSONUsuario.AddPair('nome',TJSONString.Create(Nome));
  LJSONUsuario.AddPair('senha',TJSONNumber.Create(Senha));
  LJSONUsuario.AddPair('codperfil',TJSONNumber.Create(CodPerfil));
  LJSONMaster.AddPair('usuario',LJSONUsuario);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('usuarios')
                      .Method(rmPUT)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

procedure TModelUsuario.Cadastrar;
var
  LJSONMaster: TJSONObject;
  LJSONUsuario: TJSONObject;
begin
  LJSONMaster := TJSONObject.Create;
  LJSONUsuario := TJSONObject.Create;
  LJSONUsuario.AddPair('nome',TJSONString.Create(Nome));
  LJSONUsuario.AddPair('senha',TJSONNumber.Create(Senha));
  LJSONUsuario.AddPair('codperfil',TJSONNumber.Create(CodPerfil));
  LJSONMaster.AddPair('usuario',LJSONUsuario);

  TModelRequestRestPadrao.New
                      .Server('localhost')
                      .Port(9000)
                      .Resource('usuarios')
                      .Method(rmPOST)
                      .AddJSON(LJSONMaster)
                      .Request1;
end;

function TModelUsuario.Codigo: Integer;
begin
  Result := FCodigo;
end;

function TModelUsuario.CodPerfil: Integer;
begin
  Result := CodPerfil;
end;

function TModelUsuario.CodPerfil(AValue: Integer): iModelUsuario;
begin
  Result := Self;
  FCodPerfil := AValue;
end;

constructor TModelUsuario.Create;
begin

end;

destructor TModelUsuario.Destroy;
begin

  inherited;
end;

procedure TModelUsuario.Listar(ADataSet: TDataSet);
var
  LJSONMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONUsuario: TJSONArray;
begin
  LJSONMaster := TModelRequestRestPadrao.New
                    .Server('localhost')
                    .Port(9000)
                    .Resource('usuarios')
                    .Method(rmGET)
                    .Request1;

  PairCabecalho := LJSONMaster.Get('usuarios');

  LJSONUsuario := PairCabecalho.JsonValue as TJSONArray;

  ADataSet.Close;
  TFDMemTable(ADataSet).CreateDataSet;
  try
    for var I := 0 to Pred(LJSONUsuario.Size) do
    begin
      if not ADataSet.Active then
        ADataSet.Append;
      ADataSet.Insert;
      ADataSet.FieldByName('codigo').AsInteger := LJSONUsuario.Get(I).GetValue<Integer>('codigo');
      ADataSet.FieldByName('nome').AsString := LJSONUsuario.Get(I).GetValue<string>('nome');
      ADataSet.FieldByName('senha').AsString := LJSONUsuario.Get(I).GetValue<string>('senha');
      ADataSet.FieldByName('codperfil').AsString := LJSONUsuario.Get(I).GetValue<string>('codperfil');
      ADataSet.Post;
    end;
  finally

  end;
end;

class function TModelUsuario.New: iModelUsuario;
begin
  Result := Self.Create;
end;

function TModelUsuario.Nome: string;
begin
  Result := FNome;
end;

function TModelUsuario.Nome(AValue: string): iModelUsuario;
begin
  Result := Self;
  FNome := AValue;
end;

function TModelUsuario.Senha(AValue: string): iModelUsuario;
begin
  Result := Self;
  FSenha := AValue;
end;

function TModelUsuario.Senha: string;
begin
  Result := Senha;
end;

end.
