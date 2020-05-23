FactoryBot.define do
  factory :comment do
    headhunter 
    profile 
    message { "Message" }
  end
end
