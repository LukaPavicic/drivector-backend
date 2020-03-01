class Vtc < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true, length: {minimum: 3, maximum: 35}
  validates :description, length: {minimum: 10, maximum: 255}
  validates :pricing_plan, presence: true
  validates :user_id, presence: true, uniqueness: true

  def increase_money_made(amount)
    self.money_made += amount
  end

  def increase_deliveries_completed
    self.deliveries_completed += 1
  end

  def increase_total_km_driven(amount)
    self.total_km_driven += amount
  end

  def increase_member_count
    self.member_count += 1
  end
end
