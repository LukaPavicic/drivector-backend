FactoryBot.define do
  factory :user do
    id {Faker::Number.number}
    username {Faker::Lorem.word}
    email {Faker::Internet.email}
    tmp_profile_link {Faker::Internet.url}
    steam_profile_link {Faker::Internet.url}
    age {Faker::Number.number}
    password {Faker::Internet.password}
  end
end