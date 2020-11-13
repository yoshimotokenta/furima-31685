class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :nickname
         validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
         validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
         validates :first_name_kana,format: { with:/\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい" }
         validates :family_name_kana,format: { with:/\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,message: "全角カタカナのみで入力して下さい" }
         validates :birthday
         end
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 
         has_many :purchasers
         has_many :items
end
