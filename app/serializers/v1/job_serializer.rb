class V1::JobSerializer < ActiveModel::Serializer
  attributes(:id, :km_driven, :money_made, :user, :vtc, :from_city, :to_city, :from_company, :to_company, :damage, :goods_type)
end