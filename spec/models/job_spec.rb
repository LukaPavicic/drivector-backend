require 'rails_helper'

RSpec.describe Job, type: :model do
  it { should validate_presence_of(:money_made) }
  it { should validate_presence_of(:km_driven) }
  it { should validate_presence_of(:goods_type) }
  it { should validate_presence_of(:from_city) }
  it { should validate_presence_of(:to_city) }
  it { should validate_presence_of(:from_company) }
  it { should validate_presence_of(:to_company) }
  it { should validate_presence_of(:damage) }
end
