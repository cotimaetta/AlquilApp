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
    @historial.update!(historial_params)
    redirect_to autos_dejar_path(:id => @historial.auto.id)
 end

  def cambiarhoras
    @historial = Historialuso.last
  end

 def historial_params
  params.require(:historialuso).permit(:cant_horas)
end

end
