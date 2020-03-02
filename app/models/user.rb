class User < ApplicationRecord
  has_one :vtc
  has_one :user_joined_vtc

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :age, presence: true
  validates :tmp_profile_link, presence: true
  validates :steam_profile_link, presence: true

  before_save :email.downcase
end
