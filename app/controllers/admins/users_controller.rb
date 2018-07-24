class Admins::UsersController < ApplicationController

PER = 30

  def top
    @o_counter = Order.count
    @u_counter = User.count
    @p_counter = Product.count
    # 注文直近１０件をひっぱってくる記述
    
    @q = Order.ransack(params[:q])
    @orders2 = @q.result.last(10)
    if @orders2.blank?
      @msg = "現在注文はありません"
    end
    # ユーザー直近１０件の登録者を表示
    @q2 = User.ransack(params[:q])
    @users2 = @q2.result.last(10)
    if @users2.blank?
      @msg2 = "現在登録ユーザーはいません"
    end
    # binding.pry
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
    params.require(:user).permit(:first_name, 
                                  :last_name, 
                                  :kana_first, 
                                  :kana_last, 
                                  :postal_code, 
                                  :prefecture, 
                                  :city, 
                                  :address1, 
                                  :address2, 
                                  :phone_number, 
                                  :email, 
                                  :password)
  end

  def search_params
    params.require(:q).permit!
  end
end
