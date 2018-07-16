class Disc < ApplicationRecord
	belongs_to :product
	has_many :musics
end
