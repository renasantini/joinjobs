class JobOffer < ApplicationRecord
  belongs_to :profile
  belongs_to :headhunter
  enum status: { sent: 0, rejected: 5, accepted: 10 }
end
