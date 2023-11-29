unit Backend.Controller.Secao;

interface

uses
  Horse,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerSecao = class
  private
  public
    constructor Create;
    destructor Destroy; override;
  end;

  procedure ListarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure CadastrarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure AtualizarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses
  Backend.Dao.Secao,
  Backend.Model.Secao;

{ TControllerSecao }

constructor TControllerSecao.Create;
begin

end;

destructor TControllerSecao.Destroy;
begin

  inherited;
end;

procedure CadastrarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelSecao: TModelSecao;
  DaoSecao: TDaoSecao;
begin
  ModelSecao := TModelSecao.Create;
  DaoSecao := TDaoSecao.Create(nil);
  try
    DaoSecao.CadastrarSecao(Req,Res,Next);
  finally
    ModelSecao.Free;
    DaoSecao.Free;
  end;
end;

procedure AtualizarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelSecao: TModelSecao;
  DaoSecao: TDaoSecao;
begin
  ModelSecao := TModelSecao.Create;
  DaoSecao := TDaoSecao.Create(nil);
  try
    DaoSecao.AtualizarSecao(Req,Res,Next);
  finally
    ModelSecao.Free;
    DaoSecao.Free;
  end;
end;

procedure ListarSecao(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoSecao: TDaoSecao;
  ModelSecao: TModelSecao;
  ListaSecao: TList<TModelSecao>;
begin
  DaoSecao := TDaoSecao.Create(nil);
  ListaSecao := TList<TModelSecao>.Create;
  try
    try
      DaoSecao.ListarSecao(Req,ListaSecao);
      Res.Send(ModelSecao.GetJSON(ListaSecao)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoSecao.Free;
    // ModelSecao.Free;
    ListaSecao.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/secoes',ListarSecao);
  THorse.Post('/secoes',CadastrarSecao);
  THorse.Put('/secoes',AtualizarSecao);
end;

initialization
  Registry;

end.
