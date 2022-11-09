class AutosController < ApplicationController
  def new
    @auto = Auto.new
  end 

  def initialize 
    @cantidad = 0 
  end

  def dejar
    @auto = Auto.find(params[:id])
    @auto.update(alquilado: false)
    @historial = @auto.historialusos.last.update!(fecha_fin: DateTime.now)

  end
  
  def update
    @auto = Auto.find params[:id]
    @auto.update!(auto_params)
    redirect_to root_path
 end

 def alquilar 
    @auto = Auto.find(params[:id])
    @auto.update(alquilado: true)

    @usuario = User.find(current_user.id)
    
    @historial = Historialuso.create(fecha_inicio: DateTime.now, user: @usuario, auto: @auto)

    redirect_to historialusos_cambiarhoras_path(@historial.id)

  end 

  
  def index
    @autos = Auto.all
  end

  def show
    @historial = Historialuso.last
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
    params.require(:auto).permit(:patente, :marca, :descripcion, :cant_puertas, :cant_combustible, :location_point_x, :location_point_y, :foto, :fotodocumentacion)
  end

end
