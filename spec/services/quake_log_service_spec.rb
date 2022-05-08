require 'rails_helper' 

describe Services::QuakeLogService do
  let(:quake_log_service) { Services::QuakeLogService.new }
  let(:death_cause_repository) { Infra::Repositories::DeathCauseRepository.new }

  it "should get quake log data" do
    death_cause_repository.create(
      [
        { name: 'MOD_UNKNOWN' },
        { name: 'MOD_SHOTGUN' },
        { name: 'MOD_GAUNTLET' },
        { name: 'MOD_MACHINEGUN' },
        { name: 'MOD_GRENADE' },
        { name: 'MOD_GRENADE_SPLASH' },
        { name: 'MOD_ROCKET' },
        { name: 'MOD_ROCKET_SPLASH' },
        { name: 'MOD_PLASMA' },
        { name: 'MOD_PLASMA_SPLASH' },
        { name: 'MOD_RAILGUN' },
        { name: 'MOD_LIGHTNING' },
        { name: 'MOD_BFG' },
        { name: 'MOD_BFG_SPLASH' },
        { name: 'MOD_WATER' },
        { name: 'MOD_SLIME' },
        { name: 'MOD_LAVA' },
        { name: 'MOD_CRUSH' },
        { name: 'MOD_TELEFRAG' },
        { name: 'MOD_FALLING' },
        { name: 'MOD_SIUICIDE' },
        { name: 'MOD_TARGET_LASER' },
        { name: 'MOD_TRIGGER_HURT' },
      ]
    )

    log = File.open(Rails.root.join('spec', 'data', 'qgames.log')).read

    expect(quake_log_service.send(:parse_quake_log_data!, log)).to be_truthy
    expect(Domain::Entities::Game.count).to eq(21)
    expect(Domain::Entities::Player.count).to eq(12)
    expect(Domain::Entities::GamesPlayer.count).to eq(125)
    expect(Domain::Entities::DeathCause.count).to eq(23)
    expect(Domain::Entities::DeathCausesGame.count).to eq(106)
  end
end
