class UsuariosController < ApplicationController
  def show
    @usuario = User.find(params[:id])
    @foto = Fotouser.find_by("id_user": @usuario.id)

  end

  def index

  end

  def new
  end
end
