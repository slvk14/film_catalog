# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:admin) }

  describe 'GET index' do
    before :each do
      sign_in user
      get 'index'
    end

    it 'should get index' do
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

  describe '#update' do
    let!(:user) { create(:admin) }
    let!(:params) { attributes_for(:user) }

    context 'with signed in user' do
      before(:each) do
        sign_in user
      end

      it 'update device' do
        params[:first_name] = 'Updated'
        put :update, params: { id: user.id, user: params }
        user.reload
        expect(user.first_name).to eq 'Updated'
      end
    end
  end

  describe '#delete' do
    let!(:admin) { create(:admin) }
    let!(:user) { create(:user) }
    let!(:params) { attributes_for(:user) }

    context 'with signed in user' do
      before(:each) do
        sign_in admin
      end

      it 'deactivates user' do
        params[:active] = false
        put :update, params: { id: user.id, user: params }
        user.reload
        expect(user.active).to eq false
      end
    end
  end
end
