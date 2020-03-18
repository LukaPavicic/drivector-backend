class ChangeCardTypeToCardBrandInCharges < ActiveRecord::Migration[6.0]
  def change
    remove_column :charges, :card_type
    add_column :charges, :card_brand, :string
  end
end
