class V1::VtcSerializer < ActiveModel::Serializer
  attributes(:id, :name, :description, :money_made, :deliveries_completed, :minimum_age_to_join, :main_color, :total_km_driven, :member_count, :pricing_plan, :created_at, :maximum_amount_of_users)
  attribute :user_id, key: :owner
  belongs_to :user
end
