module V1
  class EventSerializer < ActiveModel::Serializer
    attributes(:id, :start_time, :title, :created_at, :description, :event_author, :vtc)

    def event_author
      event_author = User.find_by(id: object.user_id)
      data = {
          "id": event_author.id,
          "username": event_author.username,
      }
      data
    end

    def vtc
      vtc = Vtc.find_by(id: object.vtc_id)
      data = {
          "id": vtc.id,
          "name": vtc.name
      }
      data
    end
  end
end
