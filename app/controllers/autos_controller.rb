class AutosController < ApplicationController
  def new
    @auto = Auto.new
  end 

  def initialize 
    @cantidad = 0 
  end

  def mientrasalquiler
    @auto = Auto.find(params[:id])
  end

  #def dejar
   # @auto = Auto.find(params[:id])
    #@auto.update(alquilado: false)
    #HistorialUso.last.update(fechaFinal: DateTime.now)

  #end
  
  #SE ACTUALIZA CON EL SUBMIT - OJO!!!!!!!!!!!!!
  def update
    @auto = Auto.find(params[:id])
    @auto.update!(auto_params)
    @auto.update(alquilado: false)
    @historial = HistorialUso.last
    HistorialUso.last.update(fechaFinal: DateTime.now)
    redirect_to historial_uso_path(:id => @historial.id)
 end

 def alquilar 
    @auto = Auto.find(params[:id])
    @user = User.find(params[:id_user])
    if @auto.alquilado == true
      # el auto fue alquilado por otro
      redirect_to autos_path, alert: "El auto fue alquilado por otra persona"
    else
      if Date.today > @user.fecha_ven
        #el carnet esta mal
        redirect_to root_path, alert: "Tu carnet esta vencido"        
      else
        #todo bien
        @auto.update(alquilado: true)
        redirect_to new_historial_uso_path(:id_auto => @auto.id)
      end
    end
  end 
  
  
  
  def desbloquear 
    @auto = Auto.find(params[:id])
    @auto.update(desbloqueado: true)
    redirect_to autos_mientrasalquiler_path(:id => @auto.id), alert: "auto desbloqueado" 
  end 

  def mostrardocumentacion
    @auto = Auto.find(params[:id])
  end 
  
  def index
    @autos = Auto.all
    @auto = Auto.last
    @cant = Auto.where(en_servicio: true, alquilado: false).count 
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
    params.require(:auto).permit(:patente, :modelo, :marca, :descripcion, :cant_puertas, :cant_combustible, :location_point_x, :location_point_y, :foto, :fotodocumentacion)
  end

end
