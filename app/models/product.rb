class Product < ApplicationRecord
	has_many :discs
	has_many :order_items
	has_many :orders, through: :order_items
	accepts_nested_attributes_for :discs, allow_destroy: true
	belongs_to :category
	attachment :image_url
end
