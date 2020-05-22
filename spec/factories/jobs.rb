FactoryBot.define do
  factory :job do
    sequence (:title) { |n| "Job#{n}" }
    description { "MyText" }
    skills { "MyString" }
    wage_range { "5000" }
    level { "MyString" }
    limit_date { "2020-05-19" }
    location { "MyString" }
    company { "MyString" }
    headhunter 
  end
end
