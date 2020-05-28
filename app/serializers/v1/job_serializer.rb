module V1
  class JobSerializer < ActiveModel::Serializer
    attributes(:id, :km_driven, :money_made, :from_city, :to_city, :from_company, :to_company, :damage, :goods_type, :created_at)
    
    has_one :user
  end
end