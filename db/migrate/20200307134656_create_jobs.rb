class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.references :user, index: true, foreign_key: true
      t.references :vtc, index: true, foreign_key: true
      t.integer :money_made, null: false, default: 0
      t.integer :km_driven, null: false, default: 0
      t.string :goods_type, null: false, default: ""
      t.string :from_city, null: false, default: ""
      t.string :to_city, null: false, default: ""
      t.string :from_company, null: false, default: ""
      t.string :to_company, null: false, default: ""
      t.float :damage, null: false, default: 0
      t.timestamps
    end
  end
end
