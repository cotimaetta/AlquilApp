class UsuariosController < ApplicationController
  def show
    @usuario = User.find(params[:id])
    @foto = Fotouser.find_by("id_user": @usuario.id)

  end

  def index
    @usuarios = User.all
    @sinValidar = User.where(validacion: false, rol:2)
    @validados = User.where(validacion: true, rol:2)
    @supervisores = User.where(rol:1)
    @admins = User.where(rol:0)
  end

  def new
  end
end
