class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  private

  def user_params
      params.require(:user).permit(:nickname, :favorite_group, :favorite_member, :self_introduction)
  end

end
