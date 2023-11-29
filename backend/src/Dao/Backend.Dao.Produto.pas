unit Backend.Dao.Produto;

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
  Horse,
  Backend.Model.Produto,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.Generics.Collections,
  System.JSON;

type
  TDaoProduto = class(TDaoConexaoPadrao)
    QryProduto: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListarProduto(const Req: THorseRequest; var ListaProduto: TList<TModelProduto>): TList<TModelProduto>;
    procedure CadastrarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure AtualizarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModule2 }

function TDaoProduto.ListarProduto(const Req: THorseRequest;
  var ListaProduto: TList<TModelProduto>): TList<TModelProduto>;
var
  ModelProduto: TModelProduto;
begin
  try
    QryProduto.Close;
    QryProduto.SQL.Clear;
    QryProduto.SQL.Add(' select             ');
    QryProduto.SQL.Add('   p.codigo,        ');
    QryProduto.SQL.Add('   p.descricao,     ');
    QryProduto.SQL.Add('   p.valorunitario, ');
    QryProduto.SQL.Add('   f.descricao as desfabric, ');
    QryProduto.SQL.Add('   s.descricao as dessecao   ');
    QryProduto.SQL.Add(' from               ');
    QryProduto.SQL.Add('   produto p        ');
    QryProduto.SQL.Add(' join             ');
    QryProduto.SQL.Add('   fabricante f on f.codigo = p.codfabricante ');
    QryProduto.SQL.Add(' join             ');
    QryProduto.SQL.Add('   secao s on s.codigo = p.codsecao ');
    QryProduto.SQL.Add(' where              ');
    QryProduto.SQL.Add('   p.codigo > 0     ');

    if Req.Query.ContainsKey('codigo') then
    begin
      QryProduto.SQL.Add(' and p.codigo = :pcodigo');
      QryProduto.ParamByName('codigo').AsInteger := StrToInt(Req.Query.Items['codigo']);
    end;

    if Req.Query.ContainsKey('descricao') then
    begin
      QryProduto.SQL.Add(' and p.descricao like :pdescricao');
      QryProduto.ParamByName('pdescricao').AsString := Req.Query.Items['descricao'].ToUpper + '%';
    end;

    QryProduto.Open;

    if not QryProduto.IsEmpty then
    begin
      QryProduto.First;
      while not QryProduto.Eof do
      begin
        ModelProduto := TModelProduto.Create;
        ModelProduto.Codigo := QryProduto.FieldByName('codigo').AsInteger;
        ModelProduto.Descricao := QryProduto.FieldByName('descricao').AsString;
        ModelProduto.ValorUnitario := (QryProduto.FieldByName('valorunitario').AsFloat);
        ModelProduto.DesFabricante := QryProduto.FieldByName('desfabric').AsString;
        ModelProduto.DesSecao := QryProduto.FieldByName('dessecao').AsString;
        ListaProduto.Add(ModelProduto);
        QryProduto.Next;
      end;
      Result := ListaProduto;
    end
    else
    begin
    end;

  finally

  end;
end;

procedure TDaoProduto.AtualizarProduto(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONProduto: TJSONObject;
  LCodigo: Integer;
  LDescricao: string;
  LCodFabricante: Integer;
  LCodSecao: Integer;
  LValorUnitario: Currency;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('produto');

  LJSONProduto := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONProduto.GetValue<Integer>('codigo');
  LDescricao := LJSONProduto.GetValue<string>('descricao');
  LCodFabricante := LJSONProduto.GetValue<Integer>('codfabricante');
  LCodSecao := LJSONProduto.GetValue<Integer>('codsecao');
  LValorUnitario := LJSONProduto.GetValue<Currency>('valorunitario');

  try
    QryProduto.Close;
    QryProduto.SQL.Clear;
    QryProduto.SQL.Add(' update produto set    ');
    QryProduto.SQL.Add('   descricao = :pdescricao,  ');
    QryProduto.SQL.Add('   codfabricante = :pcodfabricante,  ');
    QryProduto.SQL.Add('   codsecao = :pcodsecao,  ');
    QryProduto.SQL.Add('   valorunitario = :pvalorunitario  ');
    QryProduto.SQL.Add(' where                      ');
    QryProduto.SQL.Add('   codigo = :pcodigo        ');

    QryProduto.ParamByName('pcodigo').AsInteger := LCodigo;
    QryProduto.ParamByName('pdescricao').AsString := LDescricao;
    QryProduto.ParamByName('pcodfabricante').AsInteger := LCodFabricante;
    QryProduto.ParamByName('pcodsecao').AsInteger := LCodSecao;
    QryProduto.ParamByName('pvalorunitario').AsCurrency := LValorUnitario;

    QryProduto.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar atualizar um produto').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoProduto.CadastrarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONProduto: TJSONObject;
  LDescricao: string;
  LCodFabricante: Integer;
  LCodSecao: Integer;
  LValorUnitario: Currency;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('produto');

  LJSONProduto := PairCabecalho.JsonValue as TJSONObject;

  LDescricao := LJSONProduto.GetValue<string>('descricao');
  LCodFabricante := LJSONProduto.GetValue<Integer>('codfabricante');
  LCodSecao := LJSONProduto.GetValue<Integer>('codsecao');
  LValorUnitario := LJSONProduto.GetValue<Currency>('valorunitario');

  try
    QryProduto.Close;
    QryProduto.SQL.Clear;
    QryProduto.SQL.Add(' insert into produto ( ');
    QryProduto.SQL.Add('   descricao,          ');
    QryProduto.SQL.Add('   codfabricante,      ');
    QryProduto.SQL.Add('   codsecao,           ');
    QryProduto.SQL.Add('   valorunitario       ');
    QryProduto.SQL.Add(')                      ');
    QryProduto.SQL.Add(' values                ');
    QryProduto.SQL.Add('(');
    QryProduto.SQL.Add(' :pdescricao,          ');
    QryProduto.SQL.Add(' :pcodfabricante,      ');
    QryProduto.SQL.Add(' :pcodsecao,           ');
    QryProduto.SQL.Add(' :pvalorunitario       ');
    QryProduto.SQL.Add(')');

    QryProduto.ParamByName('pdescricao').AsString := LDescricao;
    QryProduto.ParamByName('pcodfabricante').AsInteger := LCodFabricante;
    QryProduto.ParamByName('pcodsecao').AsInteger := LCodSecao;
    QryProduto.ParamByName('pvalorunitario').AsCurrency := LValorUnitario;

    QryProduto.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar cadastrar um produto').Status(THTTPStatus.BadRequest);
    end;
  end;
end;
end.
