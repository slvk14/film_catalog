require 'rails_helper'

RSpec.describe Movie, type: :model do

  context 'validation tests' do
    let!(:movie) { create(:movie) }
    
    describe 'factory' do
      it 'is truthy' { is_expected.to be_truthy }
    end    

    describe 'title' do
      it 'can not be null' { is_expected.to validate_presence_of(:first_name) }
    end

    describe 'year' do
      it 'can not be null' { is_expected.to validate_presence_of(:year) }
    end

    describe 'genre' do
      it 'can not be null' { is_expected.to validate_presence_of(:genre) }
    end

    describe 'director' do
      it 'can not be null' { is_expected.to validate_presence_of(:director) }
    end

    describe 'actors' do
      it 'can not be null' { is_expected.to validate_presence_of(:actors) }
    end

    describe 'plot' do
      it 'can not be null' { is_expected.to validate_presence_of(:plot) }
    end

    describe 'country' do
      it 'can not be null' { is_expected.to validate_presence_of(:country) }
    end

    describe 'imdb_rating' do
      it 'can not be null' { is_expected.to validate_presence_of(:imdb_rating) }
    end

    describe 'metascore' do
      it 'can not be null' { is_expected.to validate_presence_of(:metascore) }
    end  
  end
end
