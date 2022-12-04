class Like < ApplicationRecord
  belongs_to :user
  # validates :liked_id, :uniqueness => true
end
