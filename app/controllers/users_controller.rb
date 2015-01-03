class UsersController < ApplicationController



  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def update
    @user = current_user
    @user.update_attributes(user_params)

    redirect_to user_path(@user)
  end

  def destroy_avatar
    @user = current_user
    @user.avatar = nil
    @user.save

    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:bio, :name, :avatar)
    end



 

end