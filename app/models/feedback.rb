class Feedback < ApplicationRecord
  belongs_to :headhunter
  belongs_to :profile
  belongs_to :job
end
