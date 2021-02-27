class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recruit

  validates :content, presence: true, length: { maximum: 140 }
  validates :evaluation, presence: true
end
