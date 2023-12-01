unit Frontend.View.Cd.Fabricante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWCompLabel, IWCompEdit;

type
  TViewCdFabricante = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnConfirmar: TIWButton;
    ViewCdFabricante: TIWLabel;
    IWLabel1: TIWLabel;
    EdtDescricao: TIWEdit;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnConfirmarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Descricao: string;
  end;

var
  ViewCdFabricante: TViewCdFabricante;

implementation

{$R *.dfm}

uses
  Frontend.Model.Fabricante,
  Frontend.View.Pq.Fabricante;

procedure TViewCdFabricante.BtnConfirmarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  if EdtDescricao.Text = '' then
  begin
    EdtDescricao.SetFocus;
    WebApplication.ShowMessage('Descrição inválida');
    Exit;
  end;

 case Status of
    stInclusao:
    begin
      TModelFabricante.New
        .Descricao(EdtDescricao.Text)
        .Cadastrar;
        WebApplication.ShowMessage('Fabricante cadastrado com sucesso');
    end;
    stAlteracao:
      begin
        TModelFabricante.New
          .Codigo(PrimaryKey)
          .Descricao(EdtDescricao.Text)
          .Alterar;
          WebApplication.ShowMessage('Fabricante aletrado com sucesso');
      end;
 end;
end;

procedure TViewCdFabricante.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewPqFabricante.Create(WebApplication).Show;
end;

procedure TViewCdFabricante.IWAppFormShow(Sender: TObject);
begin
  inherited;
  if Status = stAlteracao then
  begin
    EdtDescricao.Text := Descricao;
  end;
end;

end.
