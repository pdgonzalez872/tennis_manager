require 'rails_helper'

RSpec.describe Player, type: :model do
  let(:player) { Player.create!() }

  it 'creates the correct class' do
    expect(player).to be_instance_of described_class
  end

  context "Associations" do
    it { should have_many(:draw_positions) }
  end
end
