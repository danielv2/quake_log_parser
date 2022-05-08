require 'rails_helper' 

describe Domain::Entities::DeathCause do
  let(:death_cause) { FactoryBot.create(:death_cause) }
  
  it "is valid with valid attributes" do
    expect(death_cause).to be_valid
  end
end
