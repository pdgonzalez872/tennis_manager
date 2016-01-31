require 'rails_helper'

RSpec.describe Match, type: :model do
  let(:match) { Match.create!() }

  it 'creates the correct class' do
    expect(match).to be_instance_of described_class
  end

  context "Associations" do
    it { should belong_to(:draw) }
    # it { should have_many(:players) }
  end
end
