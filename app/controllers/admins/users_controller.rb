class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!

  def top
    @o_counter = Order.count
    @u_counter = User.count
    @p_counter = Product.count
    # 注文直近１０件をひっぱってくる記述

    @q = Order.ransack(params[:q])
    @orders2 = @q.result.last(10)
    if @q == nil
      @msg = "現在注文はありません"
    end
    # ユーザー直近１０件の登録者を表示
    @q2 = User.ransack(params[:q])
    @users2 = @q2.result.last(10)
    if @users2 == nil
      @msg2 = "現在登録ユーザーはいません"
    end
    # binding.pry
    # @admin = Admin.find(params[:id])
  end

  def index
    @users2 = User.all
    @users = User.with_deleted.page(params[:page]).per(30)
    @admins = Admin.all

    @q = User.ransack(params[:q])
    @searchuser = @q.result
    @q2 = User.with_deleted.ransack(params[:q])
    @searchuser2 = @q2.result
  end

  def search
    @q = User.search(search_params)
    @users = @q.result(distinct: true)
  end

  def show
    @user = User.with_deleted.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = '登録情報を更新しました！'
      redirect_to admins_user_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.soft_delete
      flash[:success] = 'ユーザーを削除しました(soft_deleted)'
      render 'index'
    end
  end

private
  def user_params
    params.require(:user).permit(:first_name,
                                  :last_name,
                                  :kana_first,
                                  :kana_last,
                                  :postal_code,
                                  :pref,
                                  :city,
                                  :address1,
                                  :address2,
                                  :phone_number,
                                  :email,
                                  :password)
  end
end
