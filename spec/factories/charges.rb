FactoryBot.define do
  factory :charge do
    user_id { 1 }
    amount { 1 }
    card_last4 { "MyString" }
    card_type { "MyString" }
    card_exp_month { "MyString" }
    card_exp_year { "MyString" }
  end
end
