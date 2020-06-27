class EventPolicy < ApplicationPolicy
  def create?
    performer_permissions = UserJoinedVtc.find_by(user_id: user.id)

    if performer_permissions.permissions == 2 || performer_permissions.permissions == 3
      return true
    else
      return false
    end
  end
end
