class SupervisorsController < ApplicationController
  def index
    @sinValidar = User.where(validacion: 2, rol:2).order(fecha_ven: :asc)
    @rechazados = User.where(validacion: 0, rol:2).order(fecha_ven: :asc)
    @usuarios = User.where(rol:2).order(fecha_ven: :asc)
  end

  # Validacion en 1, esta aprobada
  def validar
    @a = User.find(params[:id])
    @a.validacion = 1
    @a.save
    redirect_to supervisors_path
  end

  # Validacion en 0, esta desaprobada
  def desaprobar
    @a = User.find(params[:id])
    @a.update(validacion:0)
    redirect_to supervisors_path
  end

  def show
  end


  def new
  end

  def create
  end
end
