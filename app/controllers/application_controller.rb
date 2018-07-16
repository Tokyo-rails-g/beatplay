class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:email,:encrypted_password,:first_name,:last_name,:kana_first,:kana_last,:postal_code,:prefecture,:city,:address1,:address2,:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:email,:encrypted_password,:first_name,:last_name,:kana_first,:kana_last,:postal_code,:prefecture,:city,:address1,:address2,:phone_number])
  end


  def after_sign_in_path_for(resource)
  	mypage_user_path(current_user)
  end

end
