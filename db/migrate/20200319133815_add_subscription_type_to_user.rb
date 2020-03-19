class AddSubscriptionTypeToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :subscription_type, :integer, default: 0, null: false
  end
end
