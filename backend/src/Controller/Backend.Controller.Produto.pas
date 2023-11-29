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

  procedure ListarProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure CadastrarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  procedure AtualizarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);

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

procedure CadastrarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelProduto: TModelProduto;
  DaoProduto: TDaoProduto;
begin
  ModelProduto := TModelProduto.Create;
  DaoProduto := TDaoProduto.Create(nil);
  try
    DaoProduto.CadastrarProduto(Req,Res,Next);
  finally
    ModelProduto.Free;
    DaoProduto.Free;
  end;
end;

procedure AtualizarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  ModelProduto: TModelProduto;
  DaoProduto: TDaoProduto;
begin
  ModelProduto := TModelProduto.Create;
  DaoProduto := TDaoProduto.Create(nil);
  try
    DaoProduto.AtualizarProduto(Req,Res,Next);
  finally
    ModelProduto.Free;
    DaoProduto.Free;
  end;
end;

procedure ListarProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  DaoProduto: TDaoProduto;
  ModelProduto: TModelProduto;
  ListaProduto: TList<TModelProduto>;
begin
  DaoProduto := TDaoProduto.Create(nil);
  ListaProduto := TList<TModelProduto>.Create;
  try
    try
      DaoProduto.ListarProduto(Req,ListaProduto);
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

procedure Registry;
begin
  THorse.Get('/produtos',ListarProdutos);
  THorse.Post('/produtos',CadastrarProduto);
  THorse.Put('/produtos',AtualizarProduto);
end;

initialization
  Registry;
end.
