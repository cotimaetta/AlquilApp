class AutosController < ApplicationController
  def new
    @auto = Auto.new
  end 

  def initialize 
    @cantidad = 0 
  end

  def dejar
    @a = User.find(params[:id])
    @a.validacion = true
    @a.save
    redirect_to supervisors_path
  end

  def alquilar 
    @auto = Auto.find(params[:id])
    @auto.update(alquilado: true)
    
    @historial = Historial_de_uso.new


    redirect_to autos_path 
  end 

  
  def index
    @autos = Auto.all
  end

  def show
    @auto = Auto.find(params[:id])
  end

  def create
    @auto = Auto.new(auto_params)
    if @auto.save
      redirect_to @auto
    else
      render :new, status: :see_other
    end
  end
  private

  def auto_params
    params.require(:auto).permit(:patente, :marca, :descripcion, :cant_puertas, :cant_combustible, :pos, :foto)
  end

end
