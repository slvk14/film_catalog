require 'rails_helper'

RSpec.describe User, type: :model do

  context 'validation tests' do
    let!(:user) { create(:user) }

    it 'is truthy'{ is_expected.to be_truthy }

    it 'first_name is not null' { is_expected.to validate_presence_of(:first_name) }

    it 'last_name is not null' { is_expected.to validate_presence_of(:last_name) }

    it 'email can not be incorect' { is_expected.not_to allow_value('blah').for(:email) }
    
    it 'correct email is truthy' { is_expected.to allow_value('a@b.com').for(:email) }

    it "has default 'customer' role" { expect(user.role).to eq('customer') }

    it "might have 'admin' role" do
      user.admin!
      expect(user.role).to eq('admin')
    end

    it { is_expected.to allow_values('member', 'admin', 'super_admin').for(:role) }
  end
end
