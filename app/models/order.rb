class Order < ApplicationRecord
	attachment :image

	# 支払方法 ０：クレジット、１：代引き、２：コンビニ・ATM払い
	enum payment: { クレジット: 0, 代引き: 1, コンビニ: 2 }
	
	# 配送状況 ０：出荷待ち、１：出荷済み、２：お届け済み
	enum status: { 出荷待ち: 0, 出荷済み: 1, お届け済み: 2 }

	belongs_to :user

	has_many :order_items
	has_many :products, through: :order_items
	has_many :contacts
end
