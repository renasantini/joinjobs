FactoryBot.define do
  factory :profile do
    full_name { "MyString" }
    name { "MyString" }
    birth_date { "2020-05-20" }
    document { "MyString" }
    graduation { "MyString" }
    university { "MyString" }
    description { "MyText" }
    experience { "MyText" }
  end
end
