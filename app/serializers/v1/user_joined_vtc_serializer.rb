class V1::UserJoinedVtcSerializer < ActiveModel::Serializer
  attributes(:id, :permissions, :created_at)
  belongs_to :user
  belongs_to :vtc
end
