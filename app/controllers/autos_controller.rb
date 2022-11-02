class AutosController < ApplicationController
  def new
    @auto = Auto.new
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
    params.require(:auto).permit(:patente, :marca, :descripcion, :cant_puertas, :cant_combustible, :pos)
  end
end
