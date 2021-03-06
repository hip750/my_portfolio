class Message include ActiveModel::Model

  attr_accessor :name, :email, :first_name, :last_name, :first_name_ruby,
    :last_name_ruby, :gender, :age, :license,
    :career, :postcode, :prefecture_code, :city, :street,
    :phone_number, :self_promotion, :work_times

  validates :name, presence: true, length: { maximum: 20 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 30 },
                    format: { with: VALID_EMAIL_REGEX }

  # JpPrefecture
  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end
end
