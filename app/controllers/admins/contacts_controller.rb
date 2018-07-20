class Admins::ContactsController < ApplicationController
  def index
  	@contacts = Contact.all
  end

  def show
  end

  def new
  end

  def create
  end
end
