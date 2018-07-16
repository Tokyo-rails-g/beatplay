class Contact < ApplicationRecord

	belongs_to :order
	belongs_to :user

	has_many :comments
end
