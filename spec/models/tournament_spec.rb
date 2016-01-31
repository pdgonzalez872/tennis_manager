RSpec.describe Tournament, type: :model do
  let(:tournament) { Tournament.create(name: "Roland Garros") }

  it 'creates the correct class' do
    expect(tournament).to be_instance_of described_class
  end

  context "Associations" do

    it { should have_many(:draws) }

  end
end
