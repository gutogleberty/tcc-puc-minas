unit Frontend.View.Cd.Perfil;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompButton, IWCompLabel, IWCompEdit;

type
  TViewCdPerfil = class(TViewPadrao)
    BtnRetornar: TIWButton;
    BtnConfirmar: TIWButton;
    IWLabel5: TIWLabel;
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
  ViewCdPerfil: TViewCdPerfil;

implementation

uses
  Frontend.Model.Perfil,
  Frontend.View.Pq.Perfil;

{$R *.dfm}

procedure TViewCdPerfil.BtnConfirmarAsyncClick(Sender: TObject;
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
      TModelPerfil.New
        .Descricao(EdtDescricao.Text)
        .Cadastrar;
        WebApplication.ShowMessage('Perfil cadastrado com sucesso');
    end;
    stAlteracao:
      begin
        TModelPerfil.New
          .Codigo(PrimaryKey)
          .Descricao(EdtDescricao.Text)
          .Alterar;
          WebApplication.ShowMessage('Perfil aletrado com sucesso');
      end;
  end;
end;

procedure TViewCdPerfil.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewPqPerfil.Create(WebApplication).Show;
end;

procedure TViewCdPerfil.IWAppFormShow(Sender: TObject);
begin
  inherited;
  EdtDescricao.Text := Descricao;
end;

end.
