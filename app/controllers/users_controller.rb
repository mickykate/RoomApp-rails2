class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def profile_edit
    @user = current_user
  end

  def profile_update
    @user = current_user
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
    params.require(:users).permit(:username, :icon, :introduction)
  end
