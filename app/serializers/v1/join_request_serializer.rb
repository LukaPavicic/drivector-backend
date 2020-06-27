module V1
  class JoinRequestSerializer < ActiveModel::Serializer
    attributes(:id, :vtc_id, :motivation_text, :rejection_message, :status)
    attribute :created_at, key: :requested_at
    attribute :updated_at, key: :responded_at
    attribute :user
    attribute :vtc

    def user
      usr = User.find_by(id: object.user_id)
      V1::UserSerializer.new(usr)
    end

    def vtc
      vtc_record = Vtc.find_by(id: object.vtc_id)
      data = {
        "id": vtc_record.id,
        "name": vtc_record.name
      }
      data
    end
  end
end
