class JobOffer < ApplicationRecord
  belongs_to :profile
  belongs_to :headhunter
end
