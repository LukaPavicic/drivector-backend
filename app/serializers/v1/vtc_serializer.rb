class V1::VtcSerializer < ActiveModel::Serializer
  attributes(:id, :name, :description, :user_id, :money_made, :deliveries_completed, :minimum_age_to_join, :main_color, :total_km_driven, :member_count, :pricing_plan)
  belongs_to :user
end
