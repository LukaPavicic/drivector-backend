class AddStripeDataToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :stripe_id, :string
    add_column :users, :stripe_subscription_id, :string
    add_column :users, :card_last4, :string
    add_column :users, :card_expiration_month, :integer
    add_column :users, :card_expiration_year, :integer
    add_column :users, :card_brand, :integer
  end
end
