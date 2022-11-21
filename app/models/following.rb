class Following < ApplicationRecord
  belongs_to :user
  validates :following_id, :uniqueness => true
end
