class V1::UserSerializer < ActiveModel::Serializer
  attributes(:id, :email, :username, :tmp_profile_link, :steam_profile_link)
  attribute :birth_date, key: :age
  has_one :user_joined_vtc, serializer: V1::VtcSerializer

  def birth_date
    object.get_user_age
  end
end
