class User < ApplicationRecord
  include Clearance::User

  has_one_attached :profile_picture
  has_one_attached :profile_banner
end
