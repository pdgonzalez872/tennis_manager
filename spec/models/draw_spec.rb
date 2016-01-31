require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw)  { Draw.create(name: "Main", size: 32) }

  it "creates the correct class" do
    expect(draw).to be_instance_of described_class
  end

  context "Associations" do
    it { should belong_to(:tournament) }
    it { should have_many(:matches) }
    it { should have_many(:draw_positions) }
  end
end
