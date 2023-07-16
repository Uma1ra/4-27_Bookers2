class UsersController < ApplicationController
  def show
    @show_user = User.find(params[:id])
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
  
end