class Product < ApplicationRecord
	attachment :image
	has_one :order_item
	has_many :orders, through: :order_items
	has_one :cart_item
	has_many :favorites, dependent: :delete_all
	has_many :discs, dependent: :destroy
	accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
	has_many :musics, through: :discs  #商品の曲検索で必要
	belongs_to :category


	validates :album_title, presence: true
	validates :artist, presence: true
	validates :label, presence: true
	validates :category_id, presence: true
	validates :price, presence: true
	validates :stock, presence: true
	validates :release_year, presence: true
end
