class UsersController < ApplicationController



  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def destroy_avatar
    @user = current_user
    @user.avatar = nil
    @user.save

    redirect_to @user
  end




 

end