unit Frontend.View.Cd.Usuario;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, IWCompButton, IWCompEdit,
  IWCompListbox;

type
  TViewCdUsuario = class(TViewPadrao)
    ViewCdUsuario: TIWLabel;
    BtnConfirmar: TIWButton;
    BtnRetornar: TIWButton;
    IWLabel1: TIWLabel;
    EdtNome: TIWEdit;
    EdtEmail: TIWEdit;
    EdtSenha: TIWEdit;
    IWLabel2: TIWLabel;
    IWLabel3: TIWLabel;
    IWLabel4: TIWLabel;
    CbbPerfil: TIWComboBox;
    procedure BtnRetornarAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure BtnConfirmarAsyncClick(Sender: TObject; EventParams: TStringList);
  private
    { Private declarations }
  public
    { Public declarations }
    Nome: string;
  end;

var
  ViewCdUsuario: TViewCdUsuario;

implementation

{$R *.dfm}

uses
  Frontend.Model.Usuario,
  Frontend.View.Pq.Usuario;

procedure TViewCdUsuario.BtnConfirmarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  if EdtNome.Text = '' then
  begin
    EdtNome.SetFocus;
    WebApplication.ShowMessage('Nome inválido');
    Exit;
  end;

  if EdtEmail.Text = '' then
  begin
    EdtEmail.SetFocus;
    WebApplication.ShowMessage('E-mail inválido');
    Exit;
  end;

  if EdtSenha.Text = '' then
  begin
    EdtSenha.SetFocus;
    WebApplication.ShowMessage('Senha inválida');
    Exit;
  end;

  if CbbPerfil.ItemIndex = 0 then
  begin
    CbbPerfil.SetFocus;
    WebApplication.ShowMessage('Perfil inválido');
    Exit;
  end;

  case Status of
    stInclusao:
    begin
      TModelUsuario.New
        .Nome(EdtNome.Text)
        .Email(EdtEmail.Text)
        .Senha(EdtSenha.Text)
        .CodPerfil(CbbPerfil.ItemIndex)
        .Cadastrar;
        WebApplication.ShowMessage('Usuário cadastrado com sucesso');
    end;
    stAlteracao:
      begin
        TModelUsuario.New
          .Codigo(PrimaryKey)
          .Nome(EdtNome.Text)
          .Email(EdtEmail.Text)
          .Senha(EdtSenha.Text)
          .CodPerfil(CbbPerfil.ItemIndex)
          .Alterar;
          WebApplication.ShowMessage('Usuário aletrado com sucesso');
      end;
  end;
end;

procedure TViewCdUsuario.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewPqUsuario.Create(WebApplication).Show;
end;

end.
