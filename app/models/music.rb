class Music < ApplicationRecord
	belongs_to :disc, optional: true

	default_scope -> { order(track_number: :asc) }
end
