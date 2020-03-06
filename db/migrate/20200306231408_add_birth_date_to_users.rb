class AddBirthDateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :birth_date, :datetime
  end
end
