class Disc < ApplicationRecord
	belongs_to :product, touch: true
	has_many :musics, inverse_of: :disc
	#inverse_of: :disc = (has_many/belongs_to関係下ではデフォルトで設定されている。discの変更をdiscに反映する)
	accepts_nested_attributes_for :musics, reject_if: :all_blank, allow_destroy: true
	#allow_destroy = 親を削除した時に子も同時に削除
end
