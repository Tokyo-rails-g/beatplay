class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def soft_delete
    update(deleted_at: Time.now)
  end

  def active_for_authentication?
    !deleted_at
  end

  def inactive_message
    !deleted_at? super: :deleted_account
  end

# gem jp_prefectureの追加の為、追記しました------------------------------------------------
  include JpPrefecture
  jp_prefecture :pref

    def prefecture_name
      JpPrefecture::Prefecture.find(code: pref_id).try(:name)
    end

    def prefecture_name=(prefecture_name)
      self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
    end

# ----------------------------------------------------------------------------------

  has_many :orders
  has_many :addresses
  has_one :cart
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :orders, :allow_destroy => true
  has_many :order_items, through: :orders  #ユーザーマイページの購入履歴表示に必要

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
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

  validates :kana_last,
  	presence:true,
    format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}

  validates :postal_code,
  	presence:true

  validates :pref,
  	presence:true

  validates :city,
  	presence:true

  validates :phone_number,
  	presence:true,
    format: { with: /\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/}
end
