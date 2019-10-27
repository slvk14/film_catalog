require 'rails_helper'

RSpec.describe Review, type: :model do
  context 'validation tests' do
    let!(:review) { create(:review) }

    describe 'factory' do
      it { is_expected.to be_truthy }
    end

    describe 'rate' do
      it { is_expected.to validate_presence_of(:rate) }
    end

    describe 'description' do
      it { is_expected.to validate_presence_of(:description) }
    end
  end
end
