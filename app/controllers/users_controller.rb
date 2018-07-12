class UsersController < ApplicationController

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: 'ユーザー情報を更新しました'
    elsif
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name,
      :nickname,
      :email,
      )
  end
end
