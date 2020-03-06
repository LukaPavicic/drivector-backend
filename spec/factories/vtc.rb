FactoryBot.define do
  factory :vtc do
    id {Faker::Number.number}
    name {Faker::Internet.name}
    user_id {Faker::Number.number}
  end
end