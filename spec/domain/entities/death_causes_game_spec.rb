require 'rails_helper' 

describe Domain::Entities::DeathCausesGame do
  let(:death_causes_game) { FactoryBot.create(:death_causes_game) }
  
  it "is valid with valid attributes" do
    expect(death_causes_game).to be_valid
  end

  it "should increment quantity of kills" do
    expect { death_causes_game.add_quantity }.to change { death_causes_game.quantity }.by(1)
  end
end
