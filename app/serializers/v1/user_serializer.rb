module V1
  class UserSerializer < ActiveModel::Serializer
    attributes(:id, :email, :username, :tmp_profile_link, :steam_profile_link, :money_earned, :jobs_completed)
    attribute :created_at
    attribute :birth_date, key: :age
    has_one :user_joined_vtc
    attribute :vtc
  
    def vtc
      connection = UserJoinedVtc.find_by(id: object.user_joined_vtc)
      if connection.nil?
        nil
      else
        Vtc.find_by(id: connection.vtc_id)
      end
    end
  
    def birth_date
      object.get_user_age
    end
  end
end
