class Recruit < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :co_name, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }
  validates :title, length: { maximum: 50 }
  validates :pay, length: { maximum: 255 }
  validates :phone_number, length: { maximum: 13 }
  validates :postcode, length: { maximum: 8 }
  validates :city, length: { maximum: 50 }
  validates :street, length: { maximum: 255 }
  validates :work_style, length: { maximum: 255 }
  validates :access, length: { maximum: 255 }
  validates :web_site, length: { maximum: 255 }
  validates :transportation, length: { maximum: 255 }
  validates :required_license, length: { maximum: 255 }
  validates :image, content_type: {
    in: %w(image/jpeg image/gif image/png),
    message: "拡張子は「.jpeg」「.gif」「.png」で指定して下さい",
  },
                    size: {
                      less_than: 5.megabytes,
                      message: "容量が5MB以下のファイルを指定してください",
                    }

  # 画像のリサイズ
  def display_image
    image.variant(resize:'800x600')
  end
end
