unit Backend.Dao.Secao;

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
  Horse.Request,
  System.Generics.Collections,
  Backend.Model.Secao,
  Horse.Response,
  System.JSON, Horse;

type
  TDaoSecao = class(TDaoConexaoPadrao)
    QrySecao: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Listar(const Req: THorseRequest; var ListaSecao: TList<TModelSecao>): TList<TModelSecao>;
    procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDaoSecao }

function TDaoSecao.Listar(const Req: THorseRequest;
  var ListaSecao: TList<TModelSecao>): TList<TModelSecao>;
var
  ModelSecao: TModelSecao;
begin
  try
    QrySecao.Close;
    QrySecao.SQL.Clear;
    QrySecao.SQL.Add(' select         ');
    QrySecao.SQL.Add('   codigo,      ');
    QrySecao.SQL.Add('   descricao    ');
    QrySecao.SQL.Add(' from           ');
    QrySecao.SQL.Add('   secao        ');
    QrySecao.SQL.Add(' where          ');
    QrySecao.SQL.Add('   codigo > 0   ');

    if Req.Query.ContainsKey('codigo') then
    begin
      QrySecao.SQL.Add(' and p.codigo = :pcodigo');
      QrySecao.ParamByName('codigo').AsInteger := StrToInt(Req.Query.Items['codigo']);
    end;

    if Req.Query.ContainsKey('descricao') then
    begin
      QrySecao.SQL.Add(' and p.descricao like :pdescricao');
      QrySecao.ParamByName('pdescricao').AsString := Req.Query.Items['descricao'].ToUpper + '%';
    end;

    QrySecao.Open;

    if not QrySecao.IsEmpty then
    begin
      QrySecao.First;
      while not QrySecao.Eof do
      begin
        ModelSecao := TModelSecao.Create;
        ModelSecao.Codigo := QrySecao.FieldByName('codigo').AsInteger;
        ModelSecao.Descricao := QrySecao.FieldByName('descricao').AsString;
        ListaSecao.Add(ModelSecao);
        QrySecao.Next;
      end;
      Result := ListaSecao;
    end
    else
    begin
    end;

  finally
    // ModelEntityProduto.Free;
  end;
end;

procedure TDaoSecao.Alterar(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONSecao: TJSONObject;
  LCodigo: Integer;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('secao');

  LJSONSecao := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONSecao.GetValue<Integer>('codigo');
  LDescricao := LJSONSecao.GetValue<string>('descricao');

  try
    QrySecao.Close;
    QrySecao.SQL.Clear;
    QrySecao.SQL.Add(' update secao set    ');
    QrySecao.SQL.Add('   descricao = :pdescricao ');
    QrySecao.SQL.Add(' where                      ');
    QrySecao.SQL.Add('   codigo = :pcodigo        ');

    QrySecao.ParamByName('pcodigo').AsInteger := LCodigo;
    QrySecao.ParamByName('pdescricao').AsString := LDescricao;

    QrySecao.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar atualizar uma seção').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoSecao.Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONFabricante: TJSONObject;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('secao');

  LJSONFabricante := PairCabecalho.JsonValue as TJSONObject;

  LDescricao := LJSONFabricante.GetValue<string>('descricao');

  try
    QrySecao.Close;
    QrySecao.SQL.Clear;
    QrySecao.SQL.Add(' insert into secao ( ');
    QrySecao.SQL.Add('   descricao         ');
    QrySecao.SQL.Add(')                    ');
    QrySecao.SQL.Add(' values              ');

    QrySecao.SQL.Add('(');
    QrySecao.SQL.Add(' :pdescricao              ');
    QrySecao.SQL.Add(')');

    QrySecao.ParamByName('pdescricao').AsString := LDescricao;

    QrySecao.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar cadastrar uma seção').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoSecao.Deletar(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONSecao: TJSONObject;
  LCodigo: Integer;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('secao');

  LJSONSecao := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONSecao.GetValue<Integer>('codigo');

  try
    QrySecao.Close;
    QrySecao.SQL.Clear;
    QrySecao.SQL.Add(' delete from secao         ');
    QrySecao.SQL.Add(' where                     ');
    QrySecao.SQL.Add('   codigo = :pcodigo       ');

    QrySecao.ParamByName('pcodigo').AsInteger := LCodigo;

    QrySecao.ExecSQL;

    Res.Status(THTTPStatus.NoContent);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar deletar uma seção').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

end.
