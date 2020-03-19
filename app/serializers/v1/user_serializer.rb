class V1::UserSerializer < ActiveModel::Serializer
  attributes(:id, :email, :username, :tmp_profile_link, :steam_profile_link)
  attribute :birth_date, key: :age
  has_one :user_joined_vtc

  def user_joined_vtc
    case object.reflect_on_association(:user_joined_vtc)
    when ActiveRecord::Reflection::HasOneReflection
      Vtc.find_by(id: object.user_joined_vtc.vtc_id)
    else
      nil
    end
  end

  def birth_date
    object.get_user_age
  end
end
