require 'rails_helper'

RSpec.describe Company, type: :model do
  context 'factory' do
    subject { create :company }
    it { should be_valid }
  end

  context 'associations' do
    it { should have_many(:developed_games).class_name('Game').with_foreign_key :developer_id }
    it { should have_many(:published_games).class_name('Game').with_foreign_key :publisher_id }
  end

  context 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
  end
end
