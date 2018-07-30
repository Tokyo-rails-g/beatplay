class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:top]

  def top
    @users = User.last(10)
    @orders = Order.last(10)
    @q = Product.includes(:discs,:musics).ransack(params[:q])
  end

  def confirm
  end

  def mypage
    @user = User.find(params[:id])
    @favorites = @user.favorites.reverse_order
    @q = Product.includes(:discs,:musics).ransack(params[:q])
  end

  def edit
    @q = Product.includes(:discs,:musics).ransack(params[:q])
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_name
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_name
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_address
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_address
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_phonenumber
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_phonenumber
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_email
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_email
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def edit_password
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit_password
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = 'successfully updated'
      redirect_to edit_user_path(@user.id)
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  private
    def user_params
      params.require(:user).permit(:email,:encrypted_password,:first_name,:last_name,:kana_first,:kana_last,:postal_code,:pref,:city,:address1,:address2,:phone_number)
    end
end
