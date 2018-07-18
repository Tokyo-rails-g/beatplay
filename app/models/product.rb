class Product < ApplicationRecord
	has_many :discs
	has_many :order_items
	has_many :orders, through: :order_items
	has_one :cart_item
	accepts_nested_attributes_for :discs, allow_destroy: true
	belongs_to :category
	attachment :image

	# validates :album_title, presence: true
	# validates :artist, presence: true
	# validates :label, presence: true
	# validates :category_id, presence: true
	# validates :favorite_count, presence: true
	# validates :image_url, presence: true
	# validates :price, presence: true
	# validates :stock, presence: true
	# validates :release_year, presence: true
end
