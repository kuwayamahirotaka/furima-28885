class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
  NAME_REGEX_KANA = /\A[ァ-ヶー－]+\z/
  
  with_options presence: true do
    validates :nickname
    validates :password_confirmation, format: { with: /\A[a-z\d]{6,}+\z/i, message: 'is invalid. Input password.' }
    validates :first_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :last_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters.' }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters.' }
    validates :birth_date
  end

  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'is invalid. Input email.' }, uniqueness: { case_sensitive: false }
  validates :password, format: { with: /\A[a-z\d]{8,}+\z/i, message: 'is invalid. Input password.' }

  has_many :items
end
