class Profile < ApplicationRecord
  has_one_attached :picture
  has_one_attached :resume
  belongs_to :user
  has_many :comments
end
