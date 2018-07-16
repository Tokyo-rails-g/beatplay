class Product < ApplicationRecord
	has_many :discs
	belongs_to :category
	attachment :image_url
end
