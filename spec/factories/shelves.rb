FactoryBot.define do
  factory :shelf do
    name { Faker::Color.color_name }
  end
end