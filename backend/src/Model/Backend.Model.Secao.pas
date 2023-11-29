unit Backend.Model.Secao;

interface

uses
  System.JSON,
  System.Generics.Collections;

type
  TModelSecao = class
  private
    FCodigo: Integer;
    FDescricao: string;
  public
    constructor Create;
    destructor Destroy; override;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    function GetJSON(var ListaSecao: TList<TModelSecao>): TJSONObject;
  end;

implementation

{ TModelSecao }

constructor TModelSecao.Create;
begin

end;

destructor TModelSecao.Destroy;
begin

  inherited;
end;

function TModelSecao.GetJSON(var ListaSecao: TList<TModelSecao>): TJSONObject;
var
  LJSONMaster: TJSONObject;
  LJSONSecao: TJSONObject;
  LJSONListaSecao: TJSONArray;
begin
  if ListaSecao.Count > 0 then
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaSecao := TJSONArray.Create;

    for var I := 0 to Pred(ListaSecao.Count) do
    begin
      LJSONSecao := TJSONObject.Create;
      LJSONSecao.AddPair('codigo',TJSONNumber.Create(ListaSecao[I].Codigo));
      LJSONSecao.AddPair('descricao',TJSONString.Create(ListaSecao[I].Descricao));
      LJSONListaSecao.AddElement(LJSONSecao);
    end;
    LJSONMaster.AddPair('secoes',LJSONListaSecao);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(ListaSecao.Count));
    Result := LJSONMaster;
  end
  else
  begin
    LJSONMaster := TJSONObject.Create;
    LJSONListaSecao := TJSONArray.Create;
    LJSONMaster.AddPair('secoes',LJSONListaSecao);
    LJSONMaster.AddPair('registros',TJSONNumber.Create(0));
    Result := LJSONMaster;
  end;
end;

end.

