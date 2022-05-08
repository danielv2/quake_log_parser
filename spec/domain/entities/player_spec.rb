require 'rails_helper' 

describe Domain::Entities::Player do
  let(:player) { FactoryBot.create(:player) }
  
  it "is valid with valid attributes" do
    expect(player).to be_valid
  end
end
