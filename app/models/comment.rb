class Comment < ApplicationRecord
  belongs_to :sleepscape
  validates :content, presence: true, length: {minimum:1, maximum:225}
end
