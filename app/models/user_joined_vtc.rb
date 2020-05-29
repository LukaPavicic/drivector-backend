class UserJoinedVtc < ApplicationRecord
  belongs_to :user
  belongs_to :vtc

  validates :user, presence: true, uniqueness: true  
  validates :vtc, presence: true
  validates :permissions, presence: true
end
