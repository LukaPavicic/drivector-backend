class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :vtc

  validates :vtc_id, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true, uniqueness: { scope: :vtc_id }

  def accept
    self.status = 1
    self.save
  end

  def rejectJR(message)
    self.status = 2
    self.rejection_message = message
    self.save
  end
end
