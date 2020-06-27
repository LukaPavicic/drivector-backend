class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title, null: false, default: ""
      t.text :description, null: false, default: ""
      t.datetime :start_time, null: false, default: ""
      t.references :user, foreign_key: true, index: true
      t.references :vtc, foreign_key: true, index: true
      t.string :start_city, null: false, default: ""
      t.timestamps
    end
  end
end
