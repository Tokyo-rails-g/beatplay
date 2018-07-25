class OrderItem < ApplicationRecord
	belongs_to :product
	has_one :cart_item, through: :product
	belongs_to :order
end
