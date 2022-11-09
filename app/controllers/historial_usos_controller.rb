class HistorialUsosController < ApplicationController
  before_action :set_historial_uso, only: %i[ show edit update destroy ]

  def agregarHoras
    @historial_uso = HistorialUso.where(user_id: current_user.id,fechaFinal: nil).last
    redirect_to edit_historial_uso_path(@historial_uso)
  end

  # GET /historial_usos or /historial_usos.json
  def index
    @historial_usos = HistorialUso.all
  end

  # GET /historial_usos/1 or /historial_usos/1.json
  def show
    @historial = HistorialUso.all
  end

  # GET /historial_usos/new
  def new
    @historial_uso = HistorialUso.new
    @auto_id = params[:id_auto]
  end

  # GET /historial_usos/1/edit
  def edit
  end

  # POST /historial_usos or /historial_usos.json
  def create
    @user = User.find(historial_uso_params[:user_id])
    if(@user.saldo >= Float(historial_uso_params[:cantHoras]) * 1000)
      @historial_uso = HistorialUso.new(historial_uso_params)
      @historial_uso.fechaInicio = DateTime.now
      @historial_uso.monto = @historial_uso.cantHoras * 1000
      
      @user.saldo = @user.saldo - @historial_uso.monto
      @user.save

      respond_to do |format|
        if @historial_uso.save
          #format.html { redirect_to historial_uso_url(@historial_uso), notice: "Historial uso was successfully created." }
          format.html { redirect_to autos_mientrasalquiler_path(:id => @historial_uso.auto_id) }
          format.json { render :show, status: :created, location: @historial_uso }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @historial_uso.errors, status: :unprocessable_entity }
        end
      end
    else
      @auto = Auto.find(historial_uso_params[:auto_id])
      @auto.update(alquilado: false)
      redirect_to root_path, alert: "No tenes saldo suficiente"
    end
  end

  # PATCH/PUT /historial_usos/1 or /historial_usos/1.json
  def update
    @user = User.find(@historial_uso.user_id)
    if(@user.saldo >= (Float(historial_uso_params[:horasExtra]) * 1500))
      @historial_uso.monto = @historial_uso.monto + (Float(historial_uso_params[:horasExtra]) * 1500)
      
      @user.saldo = @user.saldo - (Float(historial_uso_params[:horasExtra]) * 1500)
      @user.save

      respond_to do |format|
        if @historial_uso.update(historial_uso_params)
          #format.html { redirect_to historial_uso_url(@historial_uso), notice: "Historial uso was successfully updated." }
          format.html { redirect_to autos_mientrasalquiler_path(:id => @historial_uso.auto_id) }
          format.json { render :show, status: :ok, location: @historial_uso }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @historial_uso.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to autos_mientrasalquiler_path(:id => @historial_uso.auto_id), alert: "No tenes saldo suficiente,para extender horas"
    end

  end

  # DELETE /historial_usos/1 or /historial_usos/1.json
  def destroy
    @historial_uso.destroy

    respond_to do |format|
      format.html { redirect_to historial_usos_url, notice: "Historial uso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historial_uso
      @historial_uso = HistorialUso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def historial_uso_params
      params.require(:historial_uso).permit(:monto, :fechaInicio, :fechaFinal, :cantHoras, :user_id, :auto_id, :horasExtra)
    end
end
