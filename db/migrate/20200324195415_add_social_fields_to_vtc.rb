class AddSocialFieldsToVtc < ActiveRecord::Migration[6.0]
  def change
    add_column :vtcs, :twitter_link, :string, default: "", null: false
    add_column :vtcs, :facebook_link, :string, default: "", null: false
    add_column :vtcs, :discord_link, :string, default: "", null: false
    add_column :vtcs, :instagram_link, :string, default: "", null: false
    add_column :vtcs, :youtube_link, :string, default: "", null: false
    add_column :vtcs, :twitch_link, :string, default: "", null: false
  end
end
