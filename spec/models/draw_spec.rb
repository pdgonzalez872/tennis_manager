require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw)  { Draw.create(name: "Main", size: 32) }

  it "creates the correct class" do
    expect(draw).to be_instance_of described_class
  end

  context "Associations" do
    it "belongs to a tournament" do
      tournament = Tournament.create(name:     "Roland Garros",
                                     location: "Paris, France")
      tournament.draws << draw
      result         = tournament.draws.count

      expect(result).to eq 1
    end

    xit "has many matches" do
      
    end

  end
end
