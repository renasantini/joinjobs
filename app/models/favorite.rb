class Favorite < ApplicationRecord
  belongs_to :headhunter
  belongs_to :profile
end
