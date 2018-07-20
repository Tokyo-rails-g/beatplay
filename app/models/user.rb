class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

# gem jp_prefectureの追加の為、追記しました------------------------------------------------
  # include JpPrefecture
  # jp_prefecture :prefecture

  #   def prefecture_name
  #     JpPrefecture::Prefecture.find(code: pref_id).try(:name)
  #   end

  #   def prefecture_name=(prefecture_name)
  #     self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  #   end

# ----------------------------------------------------------------------------------

  has_many :orders
  has_one :cart
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name,
  	presence:true,
  	length: { minimum: 1, maximum: 20}

  validates :last_name,
  	presence:true,
  	length: { minimum: 1, maximum: 20}

  validates :kana_first,
  	presence:true,
  	length: { minimum: 1, maximum: 20}

  validates :kana_last,
  	presence:true,
  	length: { minimum: 1, maximum: 20}

  validates :postal_code,
  	presence:true

  validates :prefecture,
  	presence:true

  validates :city,
  	presence:true

  validates :address1,
  	presence:true

  validates :address2,
  	presence:true

  validates :phone_number,
  	presence:true

end
