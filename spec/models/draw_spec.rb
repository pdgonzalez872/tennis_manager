require 'rails_helper'

RSpec.describe Draw, type: :model do
  let(:draw)  { Draw.create(name: "Main", size: 32) }

  it "creates the correct class" do
    expect(draw).to be_instance_of described_class
  end

  context "Associations" do

    it { should belong_to(:tournament) }

  end
end
