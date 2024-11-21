class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # ここから
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email]) # 新規登録時(sign_up時)にusenameというキーのパラメーターを追加で許可する
  end

  def after_sign_in_path_for(resource)
    top_show_path
  end

  private
      def sign_in_required
          redirect_to new_user_session_url unless user_signed_in?
      end
  #ここまでを追記　usernameカラムをdbに登録させる設定
end
