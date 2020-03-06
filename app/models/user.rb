class User < ApplicationRecord
  has_one :vtc
  has_one :user_joined_vtc

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :tmp_profile_link, presence: true
  validates :steam_profile_link, presence: true
  validates :birth_date, presence: true

  before_save :email.downcase

  def get_user_age
    now = Time.now.utc.to_date
    now.year - self.birth_date.year - ((now.month > self.birth_date.month || (now.month == self.birth_date.month && now.day >= self.birth_date.day)) ? 0 : 1)
  end
end
