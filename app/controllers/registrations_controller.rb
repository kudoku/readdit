class RegistrationsController < Devise::RegistrationsController
  def update
    # @user.save
    redirect_to @user
  end

  private
    def sign_up_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation,
                                   :current_password, :bio, :name, :avatar)
    end
end