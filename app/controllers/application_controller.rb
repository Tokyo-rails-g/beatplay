class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters,if: :devise_controller?

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
# 以下else以降の記述、新しくcartをcreateする記述なので、コメントアウト

    # else
    #   @cart = Cart.create
    #   session[:cart_id] = @cart.id
    end
  end


protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name,:email,:encrypted_password,:first_name,:last_name,:kana_first,:kana_last,:postal_code,:pref,:city,:address1,:address2,:phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:name,:email,:encrypted_password,:first_name,:last_name,:kana_first,:kana_last,:postal_code,:pref,:city,:address1,:address2,:phone_number])
  end

  def after_sign_in_path_for(resource)
  	mypage_user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    users_top_path
  end

end