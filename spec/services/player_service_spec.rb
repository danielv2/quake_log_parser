require 'rails_helper' 

describe Services::PlayerService do
  let(:player_service) { Services::PlayerService.new }
  let(:player) { FactoryBot.create(:player) }

  it "should create a player" do
    player_dto = Domain::Dto::PlayerDto.new(name: 'test_player')
    expect(player_service.create(player_dto)).to be_a(Domain::Entities::Player)
  end

  it "should find all players" do
    expect(player_service.find_all).to be_truthy
  end
end
