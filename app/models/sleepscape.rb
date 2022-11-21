class Sleepscape < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :recorded_at, presence: true
  validates :description, presence: true

  has_one_attached :sleepscape_video
  has_one_attached :sleepscape_audio
  has_one_attached :sleepscape_still_picture

  has_many :comments
end
