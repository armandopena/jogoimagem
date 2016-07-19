unit uMainJogoImagens;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, uJogoImagens;

type
  TFrmJogoImagens = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Panel3: TPanel;
    Image3: TImage;
    Panel4: TPanel;
    Image4: TImage;
    Panel5: TPanel;
    Image5: TImage;
    Panel6: TPanel;
    Image6: TImage;
    Panel7: TPanel;
    Image7: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image5Click(Sender: TObject);
  private
    { Private declarations }
  public
    JogoImagem: TJogoImagens;
  end;

var
  FrmJogoImagens: TFrmJogoImagens;

implementation


{$R *.dfm}

procedure TFrmJogoImagens.FormCreate(Sender: TObject);
begin
    JogoImagem := TJogoImagens.Create(Self);
    with JogoImagem do
    begin
      AddImagem(JImgSuperior, Image1);
      AddImagem(JImgSuperior, Image2);
      AddImagem(JImgSuperior, Image3);
      AddImagem(JImgSuperior, Image4);
      AddImagem(JImgInferior, Image5);
      AddImagem(JImgInferior, Image6);
      AddImagem(JImgInferior, Image7);
    end;
end;

procedure TFrmJogoImagens.FormDestroy(Sender: TObject);
begin
    FreeAndNil(JogoImagem);
end;

procedure TFrmJogoImagens.Image1Click(Sender: TObject);
begin
    JogoImagem.JogarImagem(JImgSuperior, (Sender as TImage));
end;

procedure TFrmJogoImagens.Image5Click(Sender: TObject);
begin
    JogoImagem.JogarImagem(JImgInferior, (Sender as TImage));
end;

end.
