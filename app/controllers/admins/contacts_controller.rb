class Admins::ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def show
  	# @contact = Contact.find(params[:id])
  	# @contact.user_id = 
  	@comment = Comment.new
  end

  def new
  end

  def create
  end
end
