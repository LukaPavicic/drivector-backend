class V1::JoinRequestSerializer < ActiveModel::Serializer
  attributes(:id, :vtc_id, :motivation_text, :rejection_message)
  attribute :created_at, key: :requested_at
  has_one :user
end
