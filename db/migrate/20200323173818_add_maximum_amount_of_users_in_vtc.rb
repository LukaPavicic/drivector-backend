class AddMaximumAmountOfUsersInVtc < ActiveRecord::Migration[6.0]
  def change
    add_column :vtcs, :maximum_amount_of_users, :integer, default: 10, null: false
  end
end
