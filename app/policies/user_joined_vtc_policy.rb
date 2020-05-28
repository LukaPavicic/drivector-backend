class UserJoinedVtcPolicy < ApplicationPolicy

    def kick?        
        performer_permissions = UserJoinedVtc.find_by(user_id: user.id)
        # User can kick members only if he has permission level of 2 or 3. Also he needs to be in that VTC. Admin(3) cannot be kicked
        if performer_permissions.permissions == 2 && record.permissions == 2 && record.permissions != 3
            return false
        elsif (performer_permissions.permissions == 3 || performer_permissions == 2) && performer_permissions.vtc_id == record.vtc_id && user.present?            
            return true
        else
           return false
        end
    end

    def promote?
        performer_permissions = UserJoinedVtc.find_by(user_id: user.id).permissions
        if record.permissions == 2
            return false
        elsif performer_permissions ==  3 && record.permissions == 1
            return true
        else
            return false
        end
    end

    def demote?
        performer_permissions = UserJoinedVtc.find_by(user_id: user.id).permissions
        if record.permissions == 1
            return false
        elsif record.permissions == 2 && performer_permissions == 3
            return true
        else
            return false
        end
    end
end