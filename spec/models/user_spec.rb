require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    it { should validate_presence_of(:username)}

    it { should validate_presence_of(:email)}

    it { should validate_presence_of(:tmp_profile_link)}

    it { should validate_presence_of(:steam_profile_link)}
  end
end
