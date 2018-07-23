class Disc < ApplicationRecord
	belongs_to :product, optional: true
	has_many :musics, inverse_of: :disc
	accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
end
