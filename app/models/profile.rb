class Profile < ApplicationRecord
  has_one_attached :picture
  has_one_attached :resume
end
