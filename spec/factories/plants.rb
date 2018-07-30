FactoryBot.define do
  factory :plant do
    name { Faker::Cannabis.strain }
    pot_id 1
  end
end