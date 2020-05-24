FactoryBot.define do
  factory :job_offer do
    message { "MyString" }
    profile 
    headhunter 
    sequence(:title) { |n| "Proposta#{n}" }
    role { "MyString" }
    wage { 10000 }
    benefits { "MyString" }
    expectations { "MyString" }
    start_date { "2020-05-24" }
    status { 0 }
    confirm_start { 1 }
    answer_message { "MyString" }
  end
end
