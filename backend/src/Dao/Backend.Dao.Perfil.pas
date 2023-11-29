unit Backend.Dao.Perfil;

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
  Backend.Model.Perfil,
  System.JSON;

type
  TDaoPerfil = class(TDaoConexaoPadrao)
    QryPerfil: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function ListarPerfil(const Req: THorseRequest; var ListaPerfil: TList<TModelPerfil>): TList<TModelPerfil>;
    procedure CadastrarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure AtualizarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDaoPerfil }

procedure TDaoPerfil.AtualizarPerfil(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONPerfil: TJSONObject;
  LCodigo: Integer;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('perfil');

  LJSONPerfil := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONPerfil.GetValue<Integer>('codigo');
  LDescricao := LJSONPerfil.GetValue<string>('descricao');

  try
    QryPerfil.Close;
    QryPerfil.SQL.Clear;
    QryPerfil.SQL.Add(' update perfil set      ');
    QryPerfil.SQL.Add('   descricao = :pdescricao ');
    QryPerfil.SQL.Add(' where                      ');
    QryPerfil.SQL.Add('   codigo = :pcodigo        ');

    QryPerfil.ParamByName('pcodigo').AsInteger := LCodigo;
    QryPerfil.ParamByName('pdescricao').AsString := LDescricao;

    QryPerfil.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar atualizar um perfil').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoPerfil.CadastrarPerfil(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONPerfil: TJSONObject;
  LDescricao: string;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('perfil');

  LJSONPerfil := PairCabecalho.JsonValue as TJSONObject;

  LDescricao := LJSONPerfil.GetValue<string>('descricao');

  try
    QryPerfil.Close;
    QryPerfil.SQL.Clear;
    QryPerfil.SQL.Add(' insert into perfil ( ');
    QryPerfil.SQL.Add('   descricao              ');
    QryPerfil.SQL.Add(')                         ');
    QryPerfil.SQL.Add(' values                   ');

    QryPerfil.SQL.Add('(');
    QryPerfil.SQL.Add(' :pdescricao              ');
    QryPerfil.SQL.Add(')');

    QryPerfil.ParamByName('pdescricao').AsString := LDescricao;

    QryPerfil.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
   except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar cadastrar um perfil').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

function TDaoPerfil.ListarPerfil(const Req: THorseRequest;
  var ListaPerfil: TList<TModelPerfil>): TList<TModelPerfil>;
var
  ModelPerfil: TModelPerfil;
begin
  try
    QryPerfil.Close;
    QryPerfil.SQL.Clear;
    QryPerfil.SQL.Add(' select         ');
    QryPerfil.SQL.Add('   codigo,      ');
    QryPerfil.SQL.Add('   descricao    ');
    QryPerfil.SQL.Add(' from           ');
    QryPerfil.SQL.Add('   perfil       ');
    QryPerfil.SQL.Add(' where          ');
    QryPerfil.SQL.Add('   codigo > 0   ');

    if Req.Query.ContainsKey('codigo') then
    begin
      QryPerfil.SQL.Add(' and p.codigo = :pcodigo');
      QryPerfil.ParamByName('codigo').AsInteger := StrToInt(Req.Query.Items['codigo']);
    end;

    if Req.Query.ContainsKey('descricao') then
    begin
      QryPerfil.SQL.Add(' and p.descricao like :pdescricao');
      QryPerfil.ParamByName('pdescricao').AsString := Req.Query.Items['descricao'].ToUpper + '%';
    end;

    QryPerfil.Open;

    if not QryPerfil.IsEmpty then
    begin
      QryPerfil.First;
      while not QryPerfil.Eof do
      begin
        ModelPerfil := TModelPerfil.Create;
        ModelPerfil.Codigo := QryPerfil.FieldByName('codigo').AsInteger;
        ModelPerfil.Descricao := QryPerfil.FieldByName('descricao').AsString;
        ListaPerfil.Add(ModelPerfil);
        QryPerfil.Next;
      end;
      Result := ListaPerfil;
    end
    else
    begin
    end;

  finally
    // ModelEntityProduto.Free;
  end;
end;

end.
