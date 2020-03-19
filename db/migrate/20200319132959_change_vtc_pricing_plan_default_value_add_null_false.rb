class ChangeVtcPricingPlanDefaultValueAddNullFalse < ActiveRecord::Migration[6.0]
  def change
    remove_column :vtcs, :pricing_plan
    add_column :vtcs, :pricing_plan, :integer, default: 0, null:false
  end
end
