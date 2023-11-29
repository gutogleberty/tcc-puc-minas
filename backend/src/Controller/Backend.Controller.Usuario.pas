unit Backend.Controller.Usuario;

interface

uses
  Horse,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerUsuario = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

  procedure ListarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure CadastrarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure AtualizarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  Backend.Dao.Usuario,
  Backend.Model.Usuario;

{ TControllerUsuario }

constructor TControllerUsuario.Create;
begin

end;

destructor TControllerUsuario.Destroy;
begin

  inherited;
end;

procedure CadastrarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelUsuario: TModelUsuario;
  DaoUsuario: TDaoUsuario;
begin
  ModelUsuario := TModelUsuario.Create;
  DaoUsuario := TDaoUsuario.Create(nil);
  try
    DaoUsuario.CadastrarUsuario(Req,Res,Next);
  finally
    ModelUsuario.Free;
    DaoUsuario.Free;
  end;
end;

procedure AtualizarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelUsuario: TModelUsuario;
  DaoUsuario: TDaoUsuario;
begin
  ModelUsuario := TModelUsuario.Create;
  DaoUsuario := TDaoUsuario.Create(nil);
  try
    DaoUsuario.AtualizarUsuario(Req,Res,Next);
  finally
    ModelUsuario.Free;
    DaoUsuario.Free;
  end;
end;

procedure ListarUsuario(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoUsuario: TDaoUsuario;
  ModelUsuario: TModelUsuario;
  ListaFabricante: TList<TModelUsuario>;
begin
  DaoUsuario := TDaoUsuario.Create(nil);
  ListaFabricante := TList<TModelUsuario>.Create;
  try
    try
      DaoUsuario.ListarUsuario(Req,ListaFabricante);
      Res.Send(ModelUsuario.GetJSON(ListaFabricante)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoUsuario.Free;
    // ModelUsuario.Free;
    ListaFabricante.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/usuarios',ListarUsuario);
  THorse.Post('/usuarios',CadastrarUsuario);
  THorse.Put('/usuarios',AtualizarUsuario);
end;

initialization
  Registry;

end.
