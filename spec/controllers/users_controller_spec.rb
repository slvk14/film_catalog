require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:admin) }
  before :each do
        sign_in user
      end

  describe 'GET index' do
    before :each do
        sign_in user
      end

    it 'should get index' do
      get 'index'
      expect(response).to have_http_status(200)
    end

    it 'should return list of all users' do
      get 'index'
      expect(page).to have_content('Users')
    end
  end

  describe 'edit action' do
    before :each do
        sign_in user
      end

    it 'should get index' do
      get 'edit'
      expect(page).to have_content('Submit')
    end
  end


  

end