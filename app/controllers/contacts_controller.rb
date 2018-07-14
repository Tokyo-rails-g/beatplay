class ContactsController < ApplicationController
  def new
  	@contact = Contact.new
  end

  def create
  	@contact = Contact.new(contact_params)
  	@contact.user = current_user
  	@contact.save
  end


  	private
  	def contact_params
  		params.require(:contact).permit(:title, :body)
  	end
end
