require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
    let!(:user) { create(:user) }

    describe 'factory' do
      it 'is truthy' { is_expected.to be_truthy }
    end    

    describe 'first_name' do
      it 'can not be null' { is_expected.to validate_presence_of(:first_name) }
    end

    describe 'last_name' do
      it 'can not be null' { is_expected.to validate_presence_of(:last_name) }
    end
    
    describe 'email' do
      it 'can not be incorect' { is_expected.not_to allow_value('blah').for(:email) }
    end
    
    describe 'correct email' do
      it 'is truthy' { is_expected.to allow_value('a@b.com').for(:email) }
    end

    describe 'default role' do
      it "should be 'customer'" { expect(user.role).to eq('customer') }
    end
    
    it "might have 'admin' role" do
      user.admin!
      expect(user.role).to eq('admin')
    end
  end
end
