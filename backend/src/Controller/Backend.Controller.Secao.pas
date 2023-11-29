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

  procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);

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

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelSecao: TModelSecao;
  DaoSecao: TDaoSecao;
begin
  ModelSecao := TModelSecao.Create;
  DaoSecao := TDaoSecao.Create(nil);
  try
    DaoSecao.Cadastrar(Req,Res,Next);
  finally
    ModelSecao.Free;
    DaoSecao.Free;
  end;
end;

procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelSecao: TModelSecao;
  DaoSecao: TDaoSecao;
begin
  ModelSecao := TModelSecao.Create;
  DaoSecao := TDaoSecao.Create(nil);
  try
    DaoSecao.Alterar(Req,Res,Next);
  finally
    ModelSecao.Free;
    DaoSecao.Free;
  end;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoSecao: TDaoSecao;
  ModelSecao: TModelSecao;
  ListaSecao: TList<TModelSecao>;
begin
  DaoSecao := TDaoSecao.Create(nil);
  ListaSecao := TList<TModelSecao>.Create;
  try
    try
      DaoSecao.Listar(Req,ListaSecao);
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

procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelSecao: TModelSecao;
  DaoSecao: TDaoSecao;
begin
  ModelSecao := TModelSecao.Create;
  DaoSecao := TDaoSecao.Create(nil);
  try
    DaoSecao.Deletar(Req,Res,Next);
  finally
    ModelSecao.Free;
    DaoSecao.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/secoes',Listar);
  THorse.Post('/secoes',Cadastrar);
  THorse.Put('/secoes',Alterar);
  THorse.Delete('/secoes',Deletar);
end;

initialization
  Registry;

end.
