class User < ApplicationRecord
  has_many :recruits, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :lockable,
         :timeoutable, :trackable, :omniauthable,
         omniauth_providers: [:twitter]

  validates :name,  presence: true, length: { maximum: 50 },
                    uniqueness: true
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: Const::VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, presence: true, length: { minimum: 6 },
                       # format: { with: Const::VALID_PASSWORD_REGEX },
                       allow_nil: true
  validates :first_name, length: { maximum: 50 }
  validates :last_name, length: { maximum: 50 }
  validates :first_name_ruby, length: { maximum: 50 }
  validates :last_name_ruby, length: { maximum: 50 }
  validates :license, length: { maximum: 255 }
  validates :career, length: { maximum: 1000 }
  validates :postcode, length: { maximum: 8 }
  validates :city, length: { maximum: 50 }
  validates :street, length: { maximum: 255 }
  validates :phone_number, length: { maximum: 13 }
  validates :work_times, length: { maximum: 255 }
  validates :self_promotion, length: { maximum: 1000 }

  # Twitterログイン
  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end

  # ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.name = "hajime"
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now
    end
  end

  # passwordなしでedit
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
  
  #求人情報の表示
  def feed
    Recruit.where("user_id = ?", id)
  end
end
