require 'rails_helper' 

describe Infra::Repositories::GamePlayerRepository do
  let(:game_player) { FactoryBot.create(:games_player) }
  let(:game_player_repository) { Infra::Repositories::GamePlayerRepository.new }

  it "should create a game player" do
    game_player_temp = FactoryBot.build(:games_player)
    expect(game_player_repository.save(game_player_temp)).to be_truthy
  end

  it "should find a game player by game_id and player_id" do
    expect(game_player_repository.find_by_game_player(game_player.game_id, game_player.player_id).id).to eq(game_player.id)
  end

  it "should not find a game player by game_id and player_id" do
    expect(game_player_repository.find_by_game_player('not_found', 'not_found')).to be_nil
  end

  it "should add a player to a game" do
    game_player_repository.add_player(game_player.game, game_player.player)
  end
end
