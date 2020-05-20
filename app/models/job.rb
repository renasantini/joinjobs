class Job < ApplicationRecord
before_create :generate_code


private

  def generate_code
    self.code = loop do
      code = SecureRandom.alphanumeric(7).upcase
      break code unless Job.exists?(code: code)
    end
  end
end
