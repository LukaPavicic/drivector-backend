FactoryBot.define do
  factory :job do
    user_id {Faker::Number.number}
    vtc_id {Faker::Number.number}
    money_made {Faker::Number.between(from: 1000, to: 300000)}
    km_driven {Faker::Number.between(from: 1000, to: 300000)}
    goods_type {Faker::Food.fruits}
    from_city {Faker::Address.city}
    to_city {Faker::Address.city}
    from_company {Faker::Company.name}
    to_company {Faker::Company.name}
    damage {Faker::Number.between(from: 0, to: 100)}
  end
end
