class FotousersController < ApplicationController
  def new
    @fotouser = Fotouser.new
  end

  def index
    @fotousers = Fotouser.all
  end

  def show
    @fotouser = Fotouser.find(params[:id])
    @user = User.find(@fotouser.id_user)
  end

  def edit
    @fotouser = Fotouser.find(params[:id])
  end

  def update
    @foto = Fotouser.find(params[:id])
    foto.fotoCarnet.attach(params[:post][:fotoCarnet])
    foto.fotoDNI.attach(params[:post][:fotoDNI])
    if @foto.save
      format.html { redirect_to @foto, notice: 'Post was successfully created.' }
      format.json { render :show, status: :created, location: @user }
    else
      format.html { render :new }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end

  def create
    @fotouser = Fotouser.new(fotouser_params)
    if @fotouser.save
      redirect_to @fotouser
    else
      render :new, status: :see_other
    end
  end
  private

  def fotouser_params
    params.require(:fotouser).permit(:id_user, :fotoDNI, :fotoCarnet)
  end
end
