class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :last_name, :kana_family_name, :kana_last_name, :nickname, :birthday])
  end
end
