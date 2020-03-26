class CreateJoinRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :join_requests do |t|
      t.references :user, foreign_key: true, index: true
      t.references :vtc, foreign_key: true, index: true
      t.integer :status, default: 0, null: false
      t.text :rejection_message, default: "", null: false
      t.text :motivation_text, default: "", null: false
      t.timestamps
    end
  end
end
