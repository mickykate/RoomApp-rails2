class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def new  #マイページ
    @user = User.find(profile_params[:id])
  end

  def profile_edit
    @user = User.current_user.usename
  end

  def profile_update
    @user = User.current_user.username
     if @user.update(profile_params)
       redirect_to profile_path
     else
       render "profile_edit"
     end
  end
    
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:profile_update, keys: [:name, :image, :introduction])
  end
    
  def profile_params
    Rails.logger.debug(params.inspect)
    params.require(:users).permit(:username, :icon, :introduction)
  end
end
