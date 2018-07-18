class Music < ApplicationRecord
	belongs_to :disc, optional: true
end
