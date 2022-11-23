class UsuariosController < ApplicationController
  def show
    @usuario = User.find(params[:id])
    @foto = Fotouser.where(id_user: params[:id]).last
  end

  def index
    @usuarios = User.all
    @sinValidar = User.where(validacion: 2, rol:2)
    @validados = User.where(validacion: 1, rol:2)
    @supervisores = User.where(rol:1)
    @admins = User.where(rol:0)
  end

  def cambiarrol
    @a = User.find(params[:id])
    @a.rol = 1
    @a.save
    redirect_to usuarios_index_path
  end

  def new
  end
end
