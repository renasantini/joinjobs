FactoryBot.define do
  factory :job do
    title { "MyString" }
    description { "MyText" }
    skills { "MyString" }
    wage_range { "MyString" }
    level { "MyString" }
    limit_date { "2020-05-19" }
    location { "MyString" }
    company { "MyString" }
  end
end
