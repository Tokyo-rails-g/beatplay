class Disc < ApplicationRecord
	belongs_to :product, optional: true
	has_many :musics
	accepts_nested_attributes_for :musics, allow_destroy: true
end
