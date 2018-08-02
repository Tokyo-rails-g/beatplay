# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super do |user|
    end
    @cart = Cart.new
    if current_user
       @cart.user_id = current_user.id
       @cart.save
    end
  end

  # GET /resource/edit
  def edit
    #super do
    #end
    @user = current_user
    @orders = @user.orders.find_by(status: '0')
    @orders2 = @user.orders.find_by(status: '1')
    binding.pry
  end

  # PUT /resource
  # def update
    # super
    # end
    # @user = current_user
    # if @user.id == current_user.id
    #     # redirect_to edit_user_password_path(current_user)
    #   # redirect_to edit_user_path(current_user)

    #   render :edit_password
    # else
    #   redirect_to edit_user_path(current_user)
    # end
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def after_update_path_for(resource)
    edit_user_path(current_user)
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
