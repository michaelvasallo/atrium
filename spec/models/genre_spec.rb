require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'factory' do
    subject { create :genre }
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:game_genres) }
    it { should have_many(:games).through(:game_genres) }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
