class SupervisorsController < ApplicationController
  def index
    @sinValidar = User.where(validacion: false, rol:2).order(fecha_ven: :asc)
    @usuarios = User.where(rol:2).order(fecha_ven: :asc)
  end

  def validar
    @a = User.find(params[:id])
    @a.validacion = true
    @a.save
    redirect_to supervisors_path
  end

  def show
  end

  def new
  end

  def create
  end
end
