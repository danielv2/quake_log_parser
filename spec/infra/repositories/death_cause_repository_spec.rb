require 'rails_helper' 

describe Infra::Repositories::DeathCauseRepository do
  let(:death_cause) { FactoryBot.create(:death_cause) }
  let(:death_cause_repository) { Infra::Repositories::DeathCauseRepository.new }

  it "should create a death cause list" do
    expect(death_cause_repository.create([{ name: 'MOD_SHOTGUN' }])).to be_truthy
  end

  it "should find a death cause by name" do
    expect(death_cause_repository.find_by_name(death_cause.name).name).to eq(death_cause.name)
  end

  it "should not find a death cause by name" do
    expect(death_cause_repository.find_by_name('not_found')).to be_nil
  end

  it "should not create a death cause with invalid attributes" do
    expect { death_cause_repository.create(name: nil) }.to_not change { death_cause }
  end
end
