class Product < ApplicationRecord
	has_many :discs
	accepts_nested_attributes_for :discs, allow_destroy: true
end
