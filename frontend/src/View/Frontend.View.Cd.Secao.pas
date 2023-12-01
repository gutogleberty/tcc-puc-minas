unit Frontend.View.Cd.Secao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Frontend.View.Padrao, Data.DB,
  IWVCLComponent, IWBaseLayoutComponent, IWBaseContainerLayout,
  IWContainerLayout, IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompLabel, IWCompEdit, IWCompButton;

type
  TViewCdSecao = class(TViewPadrao)
    ViewSecao: TIWLabel;
    IWLabel1: TIWLabel;
    EdtDescricao: TIWEdit;
    BtnConfirmar: TIWButton;
    BtnRetornar: TIWButton;
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
  ViewCdSecao: TViewCdSecao;

implementation

uses
  Frontend.Model.Secao,
  Frontend.View.Pq.Secao;

{$R *.dfm}

procedure TViewCdSecao.BtnConfirmarAsyncClick(Sender: TObject;
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
      TModelSecao.New
        .Descricao(EdtDescricao.Text)
        .Cadastrar;
        WebApplication.ShowMessage('Seção cadastrada com sucesso');
    end;
    stAlteracao:
      begin
        TModelSecao.New
          .Codigo(PrimaryKey)
          .Descricao(EdtDescricao.Text)
          .Alterar;
          WebApplication.ShowMessage('Seção aletrada com sucesso');
      end;
  end;
end;

procedure TViewCdSecao.BtnRetornarAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;
  TViewPqSecao.Create(WebApplication).Show;
end;

procedure TViewCdSecao.IWAppFormShow(Sender: TObject);
begin
  inherited;
  EdtDescricao.Text := Descricao;
end;

end.
