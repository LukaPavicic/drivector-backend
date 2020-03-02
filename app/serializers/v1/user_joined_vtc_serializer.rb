class V1::UserJoinedVtcSerializer < ActiveModel::Serializer
  attributes(:id)
  belongs_to :user
  belongs_to :vtc
end
