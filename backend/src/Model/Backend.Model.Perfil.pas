unit Backend.Model.Perfil;

interface

uses
  System.JSON,
  System.Generics.Collections;

type
  TModelPerfil = class
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    function GetJSON(var ListaPerfil: TList<TModelPerfil>): TJSONObject;
  end;

implementation

{ TModelPerfil }

constructor TModelPerfil.Create;
begin

end;

destructor TModelPerfil.Destroy;
begin

  inherited;
end;

function TModelPerfil.GetJSON(var ListaPerfil: TList<TModelPerfil>): TJSONObject;
var
  LJSONMaster: TJSONObject;
  LJSONPerfil: TJSONObject;
  LJSONListaPerfil: TJSONArray;
begin
  if ListaPerfil.Count > 0 then
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaPerfil := TJSONArray.Create;

    for var I := 0 to Pred(ListaPerfil.Count) do
    begin
      LJSONPerfil := TJSONObject.Create;
      LJSONPerfil.AddPair('codigo',TJSONNumber.Create(ListaPerfil[I].Codigo));
      LJSONPerfil.AddPair('descricao',TJSONString.Create(ListaPerfil[I].Descricao));
      LJSONListaPerfil.AddElement(LJSONPerfil);
    end;
    LJSONMaster.AddPair('perfis',LJSONListaPerfil);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(ListaPerfil.Count));
    Result := LJSONMaster;
  end
  else
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaPerfil := TJSONArray.Create;
    LJSONMaster.AddPair('perfis',LJSONListaPerfil);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(0));
    Result := LJSONMaster;
  end;
end;

end.
