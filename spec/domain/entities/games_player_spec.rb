require 'rails_helper' 

describe Domain::Entities::GamesPlayer do
  let(:games_player) { FactoryBot.create(:games_player) }
  
  it "is valid with valid attributes" do
    expect(games_player).to be_valid
  end

  it "should increment kills" do
    expect { games_player.add_kill }.to change { games_player.kills }.by(1)
  end

  it "should decrement kills" do
    expect { games_player.remove_kill }.to change { games_player.kills }.by(-1)
  end
end
