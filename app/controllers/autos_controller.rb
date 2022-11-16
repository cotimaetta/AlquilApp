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

  def dejar
    @auto = Auto.find(params[:id_auto])
  end

  def verificarDejar
    @auto = Auto.find(params[:auto][:id])
    @auto.update(auto_params)
    polygon = Geokit::Polygon.new([ 
      Geokit::LatLng.new(-34.920140999662024, -57.91551169140792), 
      Geokit::LatLng.new(-34.953443552547334, -57.95262186845976), 
      Geokit::LatLng.new(-34.92275203306298, -57.99405925723118), 
      Geokit::LatLng.new(-34.88915210274202, -57.956846729265635)
    ])    
    point = Geokit::LatLng.new(Float(@auto.location_point_x),Float(@auto.location_point_y))
    if(polygon.contains?(point))  
      @auto.alquilado = false
      @auto.descripcion = @auto.location_point_y
      @auto.save
      @historial = HistorialUso.where(auto_id: @auto.id).last
      HistorialUso.last.update(fechaFinal: DateTime.now)
      redirect_to historial_uso_path(:id => @historial.id)
    else
      redirect_to root_path,alert:"fuera de zona"
    end
  end
  
  #SE ACTUALIZA CON EL SUBMIT - OJO!!!!!!!!!!!!!
  def update
    @auto = Auto.find(params[:id])
    @auto.update(auto_params)
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
