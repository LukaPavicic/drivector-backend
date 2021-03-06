module V1
  class VtcSerializer < ActiveModel::Serializer

    include Rails.application.routes.url_helpers

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

    attribute :image

    def image
      rails_blob_path(object.image, only_path: true) if object.image.attached?
    end
  end
end
