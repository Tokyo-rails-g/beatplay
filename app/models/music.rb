class Music < ApplicationRecord
	belongs_to :disc, touch: true
	#optional: true = 外部キーがnilでも保存可能（製作途中に使用）
	#touch: true = 子モデルを更新した時に親モデルのupdated_atも更新

	scope :asc, -> { order("musics.track_number ASC")}
	#track_number順でのDB格納をデフォルト設定
end
