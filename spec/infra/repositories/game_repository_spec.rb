require 'rails_helper' 

describe Infra::Repositories::GameRepository do
  let(:game) { FactoryBot.create(:game) }
  let(:game_repository) { Infra::Repositories::GameRepository.new }

  it "should create a game" do
    game_temp = FactoryBot.build(:game)
    expect(game_repository.save(game_temp)).to be_truthy
  end

  it "should find a game by id" do
    expect(game_repository.find_by_id(game.id).id).to eq(game.id)
  end

  it "should find all games" do
    FactoryBot.create(:game)
    expect(game_repository.find_all.count).to eq(1)
  end

  it "should not find a game by id" do
    expect(game_repository.find_by_id('not_found')).to be_nil
  end

  it "should not find all games" do
    expect(game_repository.find_all).to be_empty
  end

end
