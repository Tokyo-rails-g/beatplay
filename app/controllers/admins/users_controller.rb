class Admins::UsersController < ApplicationController

PER = 30

  def top
  end

  def index
    @users = User.page(params[:page]).per(PER)
    @admins = Admin.all
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.find(params[@user.id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admins_user_path
    else
      render 'edit'
    end
  end

  def destroy
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :kana_first, :kana_last, :postal_code, :prefecture, :city, :address1, :address2, :phone_number, :email, :password)
  end
end
