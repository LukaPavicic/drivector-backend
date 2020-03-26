class V1::VtcSerializer < ActiveModel::Serializer
  attributes(
      :id,
      :name,
      :description,
      :money_made,
      :deliveries_completed,
      :minimum_age_to_join,
      :main_color,
      :total_km_driven,
      :member_count,
      :pricing_plan,
      :created_at,
      :maximum_amount_of_users,
      :twitter_link,
      :facebook_link,
      :twitch_link,
      :youtube_link,
      :discord_link,
      :instagram_link
  )
  attribute :user_id, key: :owner
  has_many :user_joined_vtcs, key: :members
end
