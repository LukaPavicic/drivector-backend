FactoryBot.define do
  factory :user do
    id {Faker::Number.number}
    username {Faker::Lorem.word}
    email {Faker::Internet.email}
    tmp_profile_link {Faker::Internet.url}
    steam_profile_link {Faker::Internet.url}
    password {Faker::Internet.password}
    birth_date {Faker::Date.birthday(min_age: 18, max_age: 60)}
  end
end