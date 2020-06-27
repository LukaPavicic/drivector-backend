module V1
  class EventSerializer < ActiveModel::Serializer
    attributes(:id, :start_time, :title, :created_at, :description)
    belongs_to :user
    belongs_to :vtc
  end
end
