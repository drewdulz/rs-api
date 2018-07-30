FactoryBot.define do
  factory :pot do
    name { Faker::Seinfeld.character }
    shelf_id 1
  end
end