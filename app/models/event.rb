class Event < ApplicationRecord
  validates :title, presence: true, length: {minimum: 3, maximum: 100}
  validates :description, presence: true
  validates :user_id, presence: true
  validates :vtc_id, presence: true
  validates :start_city, presence: true
  validates :start_time, presence: true

  belongs_to :user
  belongs_to :vtc
end
