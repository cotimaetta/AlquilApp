class FotousersController < ApplicationController
  def new
    @fotouser = Fotouser.new
    #@fotouser.id_user = params[:id_user]
  end

  def index
    @fotousers = Fotouser.all
  end

  def show
    @fotouser = Fotouser.find(params[:id])
    @user = User.find(@fotouser.id_user)
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
    params.require(:fotouser).permit(:id_user, :foto)
  end
end
