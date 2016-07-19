unit uJogoImagens;

interface

uses Classes, Graphics, SysUtils, ExtCtrls;

type
ELimiteJogo = class(Exception);

TTipoJogoImagem = (JImgSuperior, JImgInferior);

TListImagem = class
  Quantidade: Integer;
  List: TList;

  function LimiteJogo: Boolean;
  procedure AddImagem(var Img:  TImage);
  constructor Create;
  destructor Destroy; override;
end;

TJogoImagens = class(TComponent)
private
  FImagensSuperiores: TListImagem;
  FImagensInferiores: TListImagem;
protected
  function GetTipoJogoList(const TipoJogoImagem: TTipoJogoImagem): TListImagem;
public
  constructor Create(AOwner: TComponent); override;
  destructor Destroy; override;

  procedure AddImagens(const TipoJogoImagem: TTipoJogoImagem; const Img: array of TImage);
  procedure AddImagem(const TipoJogoImagem: TTipoJogoImagem; var Img:  TImage);

  function JogarImagem(const TipoJogoImagem: TTipoJogoImagem; Img: TImage): Boolean;
published

end;
implementation


{ TJogoImagens }

procedure TJogoImagens.AddImagens(const TipoJogoImagem: TTipoJogoImagem;
  const Img: array of TImage);
begin
 //   GetTipoJogoList(TipoJogoImagem).AddImagens(Img);
end;

procedure TJogoImagens.AddImagem(const TipoJogoImagem: TTipoJogoImagem;
  var Img: TImage);
begin
    GetTipoJogoList(TipoJogoImagem).AddImagem(Img);
end;

constructor TJogoImagens.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FImagensSuperiores := TListImagem.Create;
  FImagensInferiores := TListImagem.Create;
end;

destructor TJogoImagens.Destroy;
begin
  FreeAndNil(FImagensSuperiores);
  FreeAndNil(FImagensInferiores);
  inherited;
end;

function TJogoImagens.GetTipoJogoList(
  const TipoJogoImagem: TTipoJogoImagem): TListImagem;
  var imgList: TListImagem;
begin
    if TipoJogoImagem = JImgSuperior  then
      Result := FImagensSuperiores
    else
      Result := FImagensInferiores;
end;

function TJogoImagens.JogarImagem(const TipoJogoImagem: TTipoJogoImagem;
  Img: TImage): Boolean;
  var listImg: TListImagem;
      listDest: TListImagem;
      var i: Integer;
      imgDest: TImage;
begin
    if img.Picture.Graphic = nil then
      Exit;

    listImg := GetTipoJogoList(TipoJogoImagem);

    if TipoJogoImagem = JImgSuperior then
        listDest := FImagensInferiores
    else
       listDest := FImagensSuperiores;


    for I := 0 to listDest.List.Count - 1 do
    begin
      imgDest := TImage(listDest.List[I]);
      if imgDest.Picture.Graphic = nil then
      begin
          imgDest.Picture := Img.Picture;
          Inc(listDest.Quantidade);
          Break;
      end
      else
        if I = listDest.List.Count - 1 then
          raise ELimiteJogo.Create('Imagem não pode ser movida.');
    end;
    i := listImg.List.IndexOf(Img);
    if i  >= 0 then
      TImage(listImg.List[i]).Picture := nil
    else
      raise EListError.Create('Não foi encontrado a imagem na lista de imagens para mover.');
end;

{ TListImagem }

procedure TListImagem.AddImagem(var Img: TImage);
begin
    List.Add(Img);

end;

constructor TListImagem.Create;
begin
    List := TList.Create;
end;

destructor TListImagem.Destroy;
begin
  FreeAndNil(List);
  inherited;
end;

function TListImagem.LimiteJogo: Boolean;
begin
    Result := Quantidade = List.Count;
end;

end.
