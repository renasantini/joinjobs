FactoryBot.define do
  factory :feedback do
    headhunter 
    profile 
    feedback { "Obrigado, mas..." }
    job
  end
end
