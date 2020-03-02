class CreateUserJoinedVtcs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_joined_vtcs do |t|
      t.references :user, foreign_key: true, index: true
      t.references :vtc, foreign_key: true, index: true
      t.integer :permissions, null: false, default: 1
      t.timestamps
    end
  end
end
