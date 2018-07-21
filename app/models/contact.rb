class Contact < ApplicationRecord

   # 注文のキャンセル,0	 お届け先の変更,1 配送状況について,2 商品の返品・返金について,3 商品の破損・不具合について,4 注文した商品と異なる商品が届いた,5 発送に関するその他質問,6 商品の登録情報について,7 お礼,8 その他の質問,9
# 	enum title:{cancel: 0, change_address: 1, about_status: 2, return: 3, failure: 4, different: 5, about_sipping: 6, about_product: 7, thanks: 8, other: 9}

# 	class << self
#     def localed_titles
#       titles.keys.map do |s|
#         [ApplicationController.helpers.t("title.contact.#{s}"), s]
#       end
#     end
# end

	belongs_to :order
	belongs_to :user

	has_many :comments
end
