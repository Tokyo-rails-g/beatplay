class OrderItem < ApplicationRecord
	has_one :product
	has_one :cart_item, through: :product
	belongs_to :order
end
