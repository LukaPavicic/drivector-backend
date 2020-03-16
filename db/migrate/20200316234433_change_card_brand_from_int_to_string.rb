class ChangeCardBrandFromIntToString < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :card_brand
    add_column :users, :card_brand, :string
  end
end
