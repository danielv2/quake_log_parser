require 'rails_helper' 

describe Infra::QueryObjects::GamesPlayerQuery do
  let(:game_player) { FactoryBot.create(:games_player) }
  let(:game_player_query) { Infra::QueryObjects::GamesPlayerQuery }

  it "should create a game player" do
    expect(game_player_query.ranking_players).to be_truthy
  end
end
