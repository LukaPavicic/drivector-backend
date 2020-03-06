require 'rails_helper'

RSpec.describe Vtc, type: :model do
  context 'validation tests' do

    it {should validate_presence_of(:name)}

    it {should validate_presence_of(:user_id)}

  end
end
