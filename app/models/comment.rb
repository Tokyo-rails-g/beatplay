class Comment < ApplicationRecord

	belongs_to :contact
	belongs_to :admin
end
