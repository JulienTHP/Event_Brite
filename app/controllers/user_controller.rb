class UserController < ApplicationController
	before_action :authenticate_user!, only: [:secret, :show]

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    post_params = params.require(:user).permit(:first_name, :last_name, :description, :is_admin)

    if @user.update(post_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end




  def secret
  end
end