class RegistrationsController < Devise::RegistrationsController

    private
  
    def sign_up_params
      params.require(:user).permit(:nombre, :apellido, :dni, :fecha_nac, :fecha_ven, :email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:nombre, :apellido, :dni, :fecha_nac, :fecha_ven, :email, :password, :password_confirmation, :current_password, :foto)
    end
  end