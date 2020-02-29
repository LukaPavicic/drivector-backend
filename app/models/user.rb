class User < ApplicationRecord
  has_one :vtc
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: true
  validates :age, presence: true
  validates :tmp_profile_link, presence: true
  validates :steam_profile_link, presence: true
end
