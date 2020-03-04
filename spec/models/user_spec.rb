require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do

    let(:params) {
      {email: "someemail@exapmple.com",
       age: 18,
       username: "luka",
       password: "12345678",
       password_confirmation: "12345678",
       steam_profile_link: "somelink",
       tmp_profile_link: "sometmplink"
      }
    }

    it 'ensures that username is present' do
      params.merge!(username: nil)
      user = User.new(params).save
      expect(user).to eq(false)
    end

    it 'ensures that email is present' do
      params.merge!(email: nil)
      user = User.new(params).save
      expect(user).to eq(false)
    end

    it 'ensures that TMP profile link is present' do
      params.merge!(tmp_profile_link: nil)
      user = User.new(params).save
      expect(user).to eq(false)
    end

    it 'ensures that Steam profile link is present' do
      params.merge!(steam_profile_link: nil)
      user = User.new(params).save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(params).save
      expect(user).to eq(true)
    end
  end
end
