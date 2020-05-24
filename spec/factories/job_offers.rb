FactoryBot.define do
  factory :job_offer do
    message { "MyString" }
    profile { nil }
    headhunter { nil }
    title { "MyString" }
    role { "MyString" }
    wage { 1 }
    benefits { "MyString" }
    expectations { "MyString" }
    start_date { "2020-05-24" }
  end
end
