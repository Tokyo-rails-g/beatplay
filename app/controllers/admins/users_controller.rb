class Admins::UsersController < ApplicationController

PER = 30

  def top
    # 注文直近１０件をひっぱってくる記述
    @orders = Order.last(10)
    @q = Order.ransack(params[:q])
    @orders2 = @q.result.last(10)
    # ユーザー直近１０件の登録者を表示
    @users = User.last(10)
    @q2 = User.ransack(params[:q])
    @users2 = @q2.result.last(10)
    # @admin = Admin.find(params[:id])
  end

  def index
    @users = User.page(params[:page]).per(PER)
    @admins = Admin.all
    @q = User.ransack(params[:q])
    @users = @q.result
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
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

  def search_params
    params.require(:q).permit!
  end
end
