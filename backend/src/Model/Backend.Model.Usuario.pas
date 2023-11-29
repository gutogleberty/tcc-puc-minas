unit Backend.Model.Usuario;

interface

uses
  System.JSON,
  System.Generics.Collections;

type
  TModelUsuario = class
  private
    FCodigo: Integer;
    FNome: string;
    FSenha: string;
    FCodPerfil: Integer;
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Senha: string read FSenha write FSenha;
    property CodPerfil: Integer read FCodPerfil write FCodPerfil;
    function GetJSON(var ListaUsuario: TList<TModelUsuario>): TJSONObject;
  end;

implementation

{ TModelUsuario }

constructor TModelUsuario.Create;
begin

end;

destructor TModelUsuario.Destroy;
begin

  inherited;
end;

function TModelUsuario.GetJSON(
  var ListaUsuario: TList<TModelUsuario>): TJSONObject;
var
  LJSONMaster: TJSONObject;
  LJSONUsuario: TJSONObject;
  LJSONListaUsuario: TJSONArray;
begin
  if ListaUsuario.Count > 0 then
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaUsuario := TJSONArray.Create;

    for var I := 0 to Pred(ListaUsuario.Count) do
    begin
      LJSONUsuario := TJSONObject.Create;
      LJSONUsuario.AddPair('codigo',TJSONNumber.Create(ListaUsuario[I].Codigo));
      LJSONUsuario.AddPair('nome',TJSONString.Create(ListaUsuario[I].Nome));
      LJSONUsuario.AddPair('senha',TJSONString.Create(ListaUsuario[I].Senha));
      LJSONUsuario.AddPair('codperfil',TJSONNumber.Create(ListaUsuario[I].CodPerfil));
      LJSONListaUsuario.AddElement(LJSONUsuario);
    end;
    LJSONMaster.AddPair('usuarios',LJSONListaUsuario);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(ListaUsuario.Count));
    Result := LJSONMaster;
  end
  else
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaUsuario := TJSONArray.Create;
    LJSONMaster.AddPair('usuarios',LJSONListaUsuario);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(0));
    Result := LJSONMaster;
  end;
end;

end.
