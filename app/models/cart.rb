class Cart < ApplicationRecord
	attachment :image
	has_many :cart_items
	belongs_to :user
end
