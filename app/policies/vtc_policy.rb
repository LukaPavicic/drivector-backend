class VtcPolicy < ApplicationPolicy

    def update_socials?
        action_performer = UserJoinedVtc.find_by(user_id: user.id)
        if action_performer.permissions == 3 && record.id == action_performer.vtc_id
            return true
        else
            return false
        end
    end

end