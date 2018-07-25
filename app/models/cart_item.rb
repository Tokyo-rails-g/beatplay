class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product
	has_one :order_item, through: :product
end
