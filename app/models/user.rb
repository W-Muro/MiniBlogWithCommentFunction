class User < ApplicationRecord
  # アソシエーション
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :name, presence: true
end
