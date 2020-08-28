class Comment < ApplicationRecord
  # アソシエーション
  belongs_to :blog
  belongs_to :user

  # バリデーション
  validates :body, presence: true
end
