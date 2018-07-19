class Order < ApplicationRecord

	# enum status:{credit: 0, cash_on_deli: 1, cov_atm: 2}
	# 支払方法 ０：クレジット、１：代引き、２：コンビニ・ATM払い

	belongs_to :user

	has_many :order_items
	has_many :products, through: :cart_items
	has_many :contacts
end
