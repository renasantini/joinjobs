FactoryBot.define do
  factory :answer do
    user { nil }
    comment { nil }
    answer { "MyText" }
  end
end
