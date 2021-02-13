class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :last_name, :first_name,:last_name_kana, :first_name_kana, :birth_date, presence: true

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: "Include both letters and numbers"

  with_options  format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: "Full-width characters" } do
    validates :first_name
    validates :last_name
  end
  
  with_options  format: { with: /\A[ァ-ヶ]+\z/, message: "Full-width katakana characters" } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
