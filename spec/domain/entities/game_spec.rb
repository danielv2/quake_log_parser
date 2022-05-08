require 'rails_helper' 

describe Domain::Entities::Game do
  let(:game) { FactoryBot.create(:game) }
  
  it "is valid with valid attributes" do
    expect(game).to be_valid
  end
end
