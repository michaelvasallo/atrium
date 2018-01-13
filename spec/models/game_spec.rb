require 'rails_helper'

RSpec.describe Game, type: :model do
  context 'factory' do
    subject { create :game }
    it { should be_valid }
  end

  context 'associations' do
    it { should belong_to(:developer).class_name('Company').with_foreign_key(:developer_id) }
    it { should belong_to(:publisher).class_name('Company').with_foreign_key(:publisher_id) }

    it { should have_many(:game_genres) }
    it { should have_many(:genres).through(:game_genres) }

    it { should have_many(:ownerships) }
    it { should have_many(:owners).through(:ownerships).source(:user) }
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :price }
    it { should validate_presence_of :release_date }
    it { should validate_presence_of :developer }
    it { should validate_presence_of :publisher }
    it { should validate_uniqueness_of :title }
  end

  context 'methods' do
    let(:game) { create :game }

    describe '#free?' do
      it { expect(game.free?).to eq game.price.zero? }
    end

    describe '#on_sale' do
      it { expect(game.on_sale?).to eq game.discount != 0 }
    end

    describe '#sale_price' do
      let(:sale_price) do
        game.on_sale? ? (game.price - game.price * game.discount).round(2) : game.price
      end
      it { expect(game.sale_price).to eq sale_price }
    end
  end
end
