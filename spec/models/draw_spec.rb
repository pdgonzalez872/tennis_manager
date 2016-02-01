require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw)  { Draw.create(name: "Main", size: 16) }

  it "creates the correct class" do
    expect(draw).to be_instance_of described_class
  end

  context "Associations" do
    it { should belong_to(:tournament) }
    it { should have_many(:matches) }
    it { should have_many(:draw_positions) }
  end

  context "Creates the correct structure" do
    it "draw has the correct draw positions" do
      result = draw.draw_positions.count
      expect(result).to eq 3
    end

    it "draw has the correct number of matches to be played" do
      result = draw.matches.count
      expect(result).to be 1
    end
  end
end
