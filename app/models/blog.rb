class Blog < ApplicationRecord
  # アソシエーション
  belongs_to :user
  has_many :comments, dependent: :destroy

  # バリデーション
  validates :title, presence: true
  validates :body, presence: true
end
