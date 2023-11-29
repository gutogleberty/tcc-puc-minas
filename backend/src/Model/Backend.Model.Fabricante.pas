unit Backend.Model.Fabricante;

interface

uses
  System.JSON,
  System.Generics.Collections;

type
  TModelFabricante = class
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    function GetJSON(var ListaFabricante: TList<TModelFabricante>): TJSONObject;
  end;

implementation

{ TModelFabricante }

constructor TModelFabricante.Create;
begin

end;

destructor TModelFabricante.Destroy;
begin

  inherited;
end;

function TModelFabricante.GetJSON(
  var ListaFabricante: TList<TModelFabricante>): TJSONObject;
var
  LJSONMaster: TJSONObject;
  LJSONFabricante: TJSONObject;
  LJSONListaFabricante: TJSONArray;
begin
  if ListaFabricante.Count > 0 then
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaFabricante := TJSONArray.Create;

    for var I := 0 to Pred(ListaFabricante.Count) do
    begin
      LJSONFabricante := TJSONObject.Create;
      LJSONFabricante.AddPair('codigo',TJSONNumber.Create(ListaFabricante[I].Codigo));
      LJSONFabricante.AddPair('descricao',TJSONString.Create(ListaFabricante[I].Descricao));
      LJSONListaFabricante.AddElement(LJSONFabricante);
    end;
    LJSONMaster.AddPair('fabricantes',LJSONListaFabricante);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(ListaFabricante.Count));
    Result := LJSONMaster;
  end
  else
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaFabricante := TJSONArray.Create;
    LJSONMaster.AddPair('fabricantes',LJSONListaFabricante);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(0));
    Result := LJSONMaster;
  end;
end;

end.
