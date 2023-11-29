unit Backend.Dao.Usuario;

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
  Backend.Model.Usuario,
  System.JSON;

type
  TDaoUsuario = class(TDaoConexaoPadrao)
    QryUsuario: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function Listar(const Req: THorseRequest; var ListaUsuario: TList<TModelUsuario>): TList<TModelUsuario>;
    procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
    procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDaoUsuario }

procedure TDaoUsuario.Alterar(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONUsuario: TJSONObject;
  LCodigo: Integer;
  LNome: string;
  LEmail: string;
  LSenha: string;
  LCodPerfil: Integer;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('usuarios');

  LJSONUsuario := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONUsuario.GetValue<Integer>('codigo');
  LNome := LJSONUsuario.GetValue<string>('nome');
  LEmail := LJSONUsuario.GetValue<string>('email');
  LSenha := LJSONUsuario.GetValue<string>('senha');
  LCodPerfil := LJSONUsuario.GetValue<Integer>('codperfil');

  try
    QryUsuario.Close;
    QryUsuario.SQL.Clear;
    QryUsuario.SQL.Add(' update usuario set       ');
    QryUsuario.SQL.Add('   nome = :pnome,         ');
    QryUsuario.SQL.Add('   email = :pemail,       ');
    QryUsuario.SQL.Add('   senha = :psenha,       ');
    QryUsuario.SQL.Add('   codperfil = :pcodperfil ');
    QryUsuario.SQL.Add(' where                    ');
    QryUsuario.SQL.Add('   codigo = :pcodigo      ');

    QryUsuario.ParamByName('pcodigo').AsInteger := LCodigo;
    QryUsuario.ParamByName('pnome').AsString := LNome;
    QryUsuario.ParamByName('pemail').AsString := LEmail;
    QryUsuario.ParamByName('psenha').AsString := LSenha;
    QryUsuario.ParamByName('pcodperfil').AsInteger := LCodPerfil;

    QryUsuario.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar atualizar um usuário').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoUsuario.Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONUsuario: TJSONObject;
  LNome: string;
  LEmail: string;
  LSenha: string;
  LCodPerfil: Integer;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('usuarios');

  LJSONUsuario := PairCabecalho.JsonValue as TJSONObject;

  LNome := LJSONUsuario.GetValue<string>('nome');
  LEmail := LJSONUsuario.GetValue<string>('email');
  LSenha := LJSONUsuario.GetValue<string>('senha');
  LCodPerfil := LJSONUsuario.GetValue<Integer>('codperfil');

  try
    QryUsuario.Close;
    QryUsuario.SQL.Clear;
    QryUsuario.SQL.Add(' insert into usuario    ( ');
    QryUsuario.SQL.Add('   nome,                  ');
    QryUsuario.SQL.Add('   email,                 ');
    QryUsuario.SQL.Add('   senha,                 ');
    QryUsuario.SQL.Add('   codperfil              ');
    QryUsuario.SQL.Add(')                         ');
    QryUsuario.SQL.Add(' values                   ');

    QryUsuario.SQL.Add('(');
    QryUsuario.SQL.Add(' :pnome,      ');
    QryUsuario.SQL.Add(' :pemail,     ');
    QryUsuario.SQL.Add(' :psenha,     ');
    QryUsuario.SQL.Add(' :pcodperfil  ');
    QryUsuario.SQL.Add(')');

    QryUsuario.ParamByName('pnome').AsString := LNome;
    QryUsuario.ParamByName('pemail').AsString := LEmail;
    QryUsuario.ParamByName('psenha').AsString := LSenha;
    QryUsuario.ParamByName('pcodperfil').AsInteger := LCodPerfil;

    QryUsuario.ExecSQL;

    Res.Send(Req.Body).Status(THTTPStatus.Created);
   except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar cadastrar um usuário').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

procedure TDaoUsuario.Deletar(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
var
  ObjetoMaster: TJSONObject;
  PairCabecalho: TJSONPair;
  LJSONUsuario: TJSONObject;
  LCodigo: Integer;
begin
  ObjetoMaster := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body),0) as TJSONObject;

  PairCabecalho := ObjetoMaster.Get('usuarios');

  LJSONUsuario := PairCabecalho.JsonValue as TJSONObject;

  LCodigo := LJSONUsuario.GetValue<Integer>('codigo');

  try
    QryUsuario.Close;
    QryUsuario.SQL.Clear;
    QryUsuario.SQL.Add(' delete from usuario      ');
    QryUsuario.SQL.Add(' where                    ');
    QryUsuario.SQL.Add('   codigo = :pcodigo      ');

    QryUsuario.ParamByName('pcodigo').AsInteger := LCodigo;

    QryUsuario.ExecSQL;

    Res.Status(THTTPStatus.NoContent);
  except on
    E: Exception do
    begin
      Res.Send('Erro ao tentar deletar um usuário').Status(THTTPStatus.BadRequest);
    end;
  end;
end;

function TDaoUsuario.Listar(const Req: THorseRequest;
  var ListaUsuario: TList<TModelUsuario>): TList<TModelUsuario>;
var
  ModelUsuario: TModelUsuario;
begin
  try
    QryUsuario.Close;
    QryUsuario.SQL.Clear;
    QryUsuario.SQL.Add(' select         ');
    QryUsuario.SQL.Add('   codigo,      ');
    QryUsuario.SQL.Add('   nome,        ');
    QryUsuario.SQL.Add('   email,       ');
    QryUsuario.SQL.Add('   senha,       ');
    QryUsuario.SQL.Add('   codperfil    ');
    QryUsuario.SQL.Add(' from           ');
    QryUsuario.SQL.Add('   usuario      ');
    QryUsuario.SQL.Add(' where          ');
    QryUsuario.SQL.Add('   codigo > 0   ');

    if Req.Query.ContainsKey('codigo') then
    begin
      QryUsuario.SQL.Add(' and p.codigo = :pcodigo');
      QryUsuario.ParamByName('codigo').AsInteger := StrToInt(Req.Query.Items['codigo']);
    end;

    if Req.Query.ContainsKey('nome') then
    begin
      QryUsuario.SQL.Add(' and p.nome like :pnome');
      QryUsuario.ParamByName('pnome').AsString := Req.Query.Items['nome'].ToUpper + '%';
    end;

    QryUsuario.Open;

    if not QryUsuario.IsEmpty then
    begin
      QryUsuario.First;
      while not QryUsuario.Eof do
      begin
        ModelUsuario := TModelUsuario.Create;
        ModelUsuario.Codigo := QryUsuario.FieldByName('codigo').AsInteger;
        ModelUsuario.Nome := QryUsuario.FieldByName('nome').AsString;
        ModelUsuario.Email := QryUsuario.FieldByName('email').AsString;
        ModelUsuario.Senha := QryUsuario.FieldByName('senha').AsString;
        ModelUsuario.CodPerfil := QryUsuario.FieldByName('codperfil').AsInteger;
        ListaUsuario.Add(ModelUsuario);
        QryUsuario.Next;
      end;
      Result := ListaUsuario;
    end
    else
    begin
    end;

  finally
    // ModelEntityProduto.Free;
  end;
end;

end.
