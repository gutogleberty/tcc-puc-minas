unit Backend.Controller.Produto;

interface

uses
  Horse,
  System.Classes,
  System.Generics.Collections,
  System.SysUtils;

type
  TControllerProduto = class
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
  Backend.Dao.Produto,
  Backend.Model.Produto;

{ TControllerProduto }

constructor TControllerProduto.Create;
begin

end;

destructor TControllerProduto.Destroy;
begin

  inherited;
end;

procedure Cadastrar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelProduto: TModelProduto;
  DaoProduto: TDaoProduto;
begin
  ModelProduto := TModelProduto.Create;
  DaoProduto := TDaoProduto.Create(nil);
  try
    DaoProduto.Cadastrar(Req,Res,Next);
  finally
    ModelProduto.Free;
    DaoProduto.Free;
  end;
end;

procedure Alterar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelProduto: TModelProduto;
  DaoProduto: TDaoProduto;
begin
  ModelProduto := TModelProduto.Create;
  DaoProduto := TDaoProduto.Create(nil);
  try
    DaoProduto.Alterar(Req,Res,Next);
  finally
    ModelProduto.Free;
    DaoProduto.Free;
  end;
end;

procedure Listar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoProduto: TDaoProduto;
  ModelProduto: TModelProduto;
  ListaProduto: TList<TModelProduto>;
begin
  DaoProduto := TDaoProduto.Create(nil);
  ListaProduto := TList<TModelProduto>.Create;
  try
    try
      DaoProduto.Listar(Req,ListaProduto);
      Res.Send(ModelProduto.GetJSON(ListaProduto)).Status(THTTPStatus.OK);
    except on
      E: Exception do
      begin
        Res.Send(E.Message).Status(THTTPStatus.BadRequest);
      end;
    end;
  finally
    DaoProduto.Free;
    // ModelProduto.Free;
    ListaProduto.Free;
  end;
end;

procedure Deletar(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelProduto: TModelProduto;
  DaoProduto: TDaoProduto;
begin
  ModelProduto := TModelProduto.Create;
  DaoProduto := TDaoProduto.Create(nil);
  try
    DaoProduto.Deletar(Req,Res,Next);
  finally
    ModelProduto.Free;
    DaoProduto.Free;
  end;
end;

procedure Registry;
begin
  THorse.Get('/produtos',Listar);
  THorse.Post('/produtos',Cadastrar);
  THorse.Put('/produtos',Alterar);
  THorse.Delete('/produtos',Deletar);
end;

initialization
  Registry;
end.
