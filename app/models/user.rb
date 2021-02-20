class User < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code, method_name: :pref

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

  # JpPrefecture
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
