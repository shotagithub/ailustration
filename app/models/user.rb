class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # validation
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー－]+\z/.freeze
  VALID_RUBY_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  with_options presence: true do
    validates :password,        format: { with: VALID_PASSWORD_REGEX }
    validates :nickname
    validates :last_name,       format: { with: VALID_NAME_REGEX }
    validates :first_name,      format: { with: VALID_NAME_REGEX }
    validates :last_name_ruby,  format: { with: VALID_RUBY_REGEX }
    validates :first_name_ruby, format: { with: VALID_RUBY_REGEX }
    validates :birth
    validates :prefecture
    validates :municipality
    validates :address
  end

  # Association
  has_many :illusts
  has_many :illust_comments
  has_many :illust_likes

  has_many :novels
  has_many :novel_comments
  has_many :novel_likes

  has_many :items
  has_many :item_comments
  has_many :item_likes
  
  has_many :orders

end
