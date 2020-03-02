class UserJoinedVtc < ApplicationRecord
  belongs_to :user
  belongs_to :vtc

  validates :user, presence: true, uniqueness: { scope: :vtc}
  validates :vtc, presence: true, uniqueness: { scope: :user }
  validates :permissions, presence: true
end
