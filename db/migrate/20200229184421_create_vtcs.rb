class CreateVtcs < ActiveRecord::Migration[6.0]
  def change
    create_table :vtcs do |t|
      t.string :name, null: false, default: ""
      t.references :user, index: true, foreign_key: true
      t.text :description, null: false, default: ""
      t.integer :money_made, null: false, default: 0
      t.integer :deliveries_completed, null: false, default: 0
      t.integer :minimum_age_to_join, null: false, default: 1
      t.string :main_color, null: false, default: "#27ae60"
      t.integer :total_km_driven, null: false, default: 0
      t.integer :member_count, null: false, default: 0
      t.integer :pricing_plan, null: false, default: 1
      t.timestamps
    end
  end
end
