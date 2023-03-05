class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  # validation
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  VALID_NAME_REGEX = /\A[ぁ-んァ-ン一-龥々ー－]+\z/.freeze
  VALID_RUBY_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  
  validates :password,        format: { with: VALID_PASSWORD_REGEX, if: :password_required? }
  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :last_name,       format: { with: VALID_NAME_REGEX }
    validates :first_name,      format: { with: VALID_NAME_REGEX }
    validates :last_name_ruby,  format: { with: VALID_RUBY_REGEX }
    validates :first_name_ruby, format: { with: VALID_RUBY_REGEX }
    validates :birth
    validates :prefecture
    validates :municipality
    validates :address
  end
  validate :age
  
  # Association
  has_many :illusts
  has_many :illust_comments
  has_many :illust_likes

  has_many :novels
  has_many :novel_comments
  has_many :novel_likes

  has_many :products
  has_many :product_comments
  has_many :product_likes
  
  has_many :orders


  private
  # 誕生日から年齢を計算しバリデータ
  def age
    year = birth.year.to_s
    month = ("%02d" % birth.month).to_s
    day = ("%02d" % birth.day).to_s
    date_birth = (year + month + day).to_i
    ages = ((Date.today.strftime('%Y%m%d').to_i - date_birth) / 10000).floor
    if ages.present? && ages < 18
      errors.add(:age, "must be 18 or older")
    end
  end
  # 登録情報変更時にパスワード除外
  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end
end
