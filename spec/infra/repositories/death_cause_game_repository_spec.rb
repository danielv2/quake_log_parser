require 'rails_helper' 

describe Infra::Repositories::DeathCauseGameRepository do
  let(:death_causes_game) { FactoryBot.create(:death_causes_game) }
  let(:death_causes_game_repository) { Infra::Repositories::DeathCauseGameRepository.new }

  it "should create a death cause game" do
    death_causes_game_temp = FactoryBot.build(:death_causes_game)
    expect(death_causes_game_repository.save(death_causes_game_temp)).to be_truthy
  end

  it "should find a death cause game by game_id and death_cause_id" do
    expect(death_causes_game_repository.find_by_death_cause_game(death_causes_game.game_id, death_causes_game.death_cause_id).id).to eq(death_causes_game.id)
  end

  it "should not find a death cause game by game_id and death_cause_id" do
    expect(death_causes_game_repository.find_by_death_cause_game('not_found', 'not_found')).to be_nil
  end
end
