class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :vtc

  validates :vtc_id, presence: true
  validates :user_id, presence: true

  def accept
    self.status = 1
    self.save
  end

  def rejectJR(message)
    self.status = 2
    self.rejection_message = message
    self.save
  end

  def can_submit_again?
    if 7.days.ago <= Date.parse(self.created_at.to_date.to_s, "%y-%m-%d")
      return false
    else
      return true
    end
  end
end
