class Favorite < ApplicationRecord
	belongs_to :user, -> { with_deleted }
	belongs_to :product

end
