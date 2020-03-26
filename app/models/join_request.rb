class JoinRequest < ApplicationRecord
  belongs_to :user
  belongs_to :vtc

  validates :vtc_id, presence: true
  validates :user_id, presence: true, uniqueness: true

  def accept
    self.status = 1
  end

  def reject(message)
    self.status = 2
    self.rejection_message = message
  end
end
