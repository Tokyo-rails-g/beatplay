class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new
    @contact.order_id = @order.id
  	@contact.user_id = current_user.id
    # binding.pry
  	if @contact.save
      redirect_to mypage_user_path(current_user)
    else
      flash[:danger] = "データを保存できていません"
      render action: :new
    end
  end


  	private
  	def contact_params
  		params.require(:contact).permit(:title, :body)
  	end
end
