class FotouserController < ApplicationController
  def new
    @fotouser = Fotouser.new
  end

  def create
    @fotouser = Fotouser.new(fotouser_params)
    if @fotouser.save
      redirect_to @fotouser
    else
      render :new, status: :see_other
    end
  end

  def show
    @fotouser = Fotouser.find_by(id_user: params[id_user])
  end

  private

  def auto_params
    params.require(:auto).permit( :id_user, :foto)
  end
end
