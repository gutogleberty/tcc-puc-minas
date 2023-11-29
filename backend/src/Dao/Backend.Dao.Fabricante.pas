unit Backend.Dao.Fabricante;

interface

uses
  System.SysUtils,
  System.Classes,
  Backend.Dao.ConexaoPadrao,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  Horse,
  System.Generics.Collections,
  Backend.Model.Fabricante,
  System.JSON;

type
  TDaoFabricante = class(TDaoConexaoPadrao)
    QryFabricante: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListarFabricante(const Req: THorseRequest; var ListaFabricante: TList<TModelFabricante>): TList<TModelFabricante>;
    procedure CadastrarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure AtualizarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDaoFabricante }

procedure TDaoFabricante.AtualizarFabricante(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONFabricante: TJSONObject;
  LCodigo: Integer;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('fabricante');

  LJSONFabricante := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONFabricante.GetValue<Integer>('codigo');
  LDescricao := LJSONFabricante.GetValue<string>('descricao');

  try
    QryFabricante.Close;
    QryFabricante.SQL.Clear;
    QryFabricante.SQL.Add(' update fabricante set      ');
    QryFabricante.SQL.Add('   descricao = :pdescricao ');
    QryFabricante.SQL.Add(' where                      ');
    QryFabricante.SQL.Add('   codigo = :pcodigo        ');

    QryFabricante.ParamByName('pcodigo').AsInteger := LCodigo;
    QryFabricante.ParamByName('pdescricao').AsString := LDescricao;

    QryFabricante.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar atualizar um fabricante').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoFabricante.CadastrarFabricante(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONFabricante: TJSONObject;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('fabricante');

  LJSONFabricante := PairCabecalho.JsonValue as TJSONObject;

  LDescricao := LJSONFabricante.GetValue<string>('descricao');

  try
    QryFabricante.Close;
    QryFabricante.SQL.Clear;
    QryFabricante.SQL.Add(' insert into fabricante ( ');
    QryFabricante.SQL.Add('   descricao              ');
    QryFabricante.SQL.Add(')                         ');
    QryFabricante.SQL.Add(' values                   ');

    QryFabricante.SQL.Add('(');
    QryFabricante.SQL.Add(' :pdescricao              ');
    QryFabricante.SQL.Add(')');

    QryFabricante.ParamByName('pdescricao').AsString := LDescricao;

    QryFabricante.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
   except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar cadastrar um fabricante').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

function TDaoFabricante.ListarFabricante(const Req: THorseRequest;
  var ListaFabricante: TList<TModelFabricante>): TList<TModelFabricante>;
var
  ModelFabricante: TModelFabricante;
begin
  try
    QryFabricante.Close;
    QryFabricante.SQL.Clear;
    QryFabricante.SQL.Add(' select         ');
    QryFabricante.SQL.Add('   codigo,      ');
    QryFabricante.SQL.Add('   descricao    ');
    QryFabricante.SQL.Add(' from           ');
    QryFabricante.SQL.Add('   fabricante   ');
    QryFabricante.SQL.Add(' where          ');
    QryFabricante.SQL.Add('   codigo > 0   ');

    if Req.Query.ContainsKey('codigo') then
    begin
      QryFabricante.SQL.Add(' and p.codigo = :pcodigo');
      QryFabricante.ParamByName('codigo').AsInteger := StrToInt(Req.Query.Items['codigo']);
    end;

    if Req.Query.ContainsKey('descricao') then
    begin
      QryFabricante.SQL.Add(' and p.descricao like :pdescricao');
      QryFabricante.ParamByName('pdescricao').AsString := Req.Query.Items['descricao'].ToUpper + '%';
    end;

    QryFabricante.Open;

    if not QryFabricante.IsEmpty then
    begin
      QryFabricante.First;
      while not QryFabricante.Eof do
      begin
        ModelFabricante := TModelFabricante.Create;
        ModelFabricante.Codigo := QryFabricante.FieldByName('codigo').AsInteger;
        ModelFabricante.Descricao := QryFabricante.FieldByName('descricao').AsString;
        ListaFabricante.Add(ModelFabricante);
        QryFabricante.Next;
      end;
      Result := ListaFabricante;
    end
    else
    begin
    end;

  finally
    // ModelEntityProduto.Free;
  end;
end;

end.
