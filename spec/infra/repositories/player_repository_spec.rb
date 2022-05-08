require 'rails_helper' 

describe Infra::Repositories::PlayerRepository do
  let(:player) { FactoryBot.create(:player) }
  let(:player_repository) { Infra::Repositories::PlayerRepository.new }

  it "should create a player" do
    player_temp = FactoryBot.build(:player)
    expect(player_repository.save(player_temp)).to be_truthy
  end

  it "should find a player by name" do
    expect(player_repository.find_by_name(player.name).name).to eq(player.name)
  end

  it "should not find a player by name" do
    expect(player_repository.find_by_name('not_found')).to be_nil
  end
end
