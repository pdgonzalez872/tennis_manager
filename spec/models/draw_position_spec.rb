require 'rails_helper'

RSpec.describe DrawPosition, type: :model do
  let(:player_ex)        { Player.create!(name: "Kelsey Laird") }
  let(:draw_position)    { DrawPosition.create! }

  it "creates the correct class" do
    expect(draw_position).to be_instance_of described_class
  end

  context "Associations" do
    it { should have_many(:players) }
    it { should belong_to(:draw) }
    it { should belong_to(:match) }
  end
end
