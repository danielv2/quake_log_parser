
Domain::Entities::GamesPlayer.destroy_all
Domain::Entities::DeathCausesGame.destroy_all
Domain::Entities::DeathCause.destroy_all
Domain::Entities::Player.destroy_all
Domain::Entities::Game.destroy_all

death_cause_repository = Infra::Repositories::DeathCauseRepository.new
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

quake_log_service = Services::QuakeLogService.new
quake_log_service.api_get_load_quake_log_data
