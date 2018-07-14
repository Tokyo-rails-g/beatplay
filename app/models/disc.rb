class Disc < ApplicationRecord
	belongs_to :product
	has_many :musics, allow_destroy: true
end
