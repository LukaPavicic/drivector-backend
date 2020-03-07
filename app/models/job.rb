class Job < ApplicationRecord
  validates :money_made, presence: true
  validates :damage, presence: true
  validates :to_company, presence: true
  validates :from_company, presence: true
  validates :from_city, presence: true
  validates :to_city, presence: true
  validates :km_driven, presence: true
  validates :user_id, presence: true
  validates :vtc_id, presence: true
  validates :goods_type, presence: true

  belongs_to :user
  belongs_to :vtc
end
