class HistorialusosController < ApplicationController
  def index
    @historiales = Historialusos.all
  end

  def new
  end

  def show
  end

  def update
    @historial = Historialuso.find(params[:id])

    if  (Integer(params[:cant_horas])  * 1000) < current_user.saldo 
      flash[:notice] = "AVERRRRRRRR te dejo alquilar "     
      redirect_to root_url, alert: "AVERRRRRRRR te dejo alquilar "     
    else 
      flash[:notice] = "NO TE DEJO ALQUILAR NI MIERDA"
      redirect_to root_url, alert: "NO TE DEJO ALQUILAR NI MIERDA" 
    end 
    #@historial.update!(historial_params)
    #redirect_to autos_dejar_path(:id => @historial.auto.id)
  end

  def cambiarhoras
    @historial = Historialuso.last
  end

 def historial_params
  params.require(:historialuso).permit(:cant_horas)
end

end
