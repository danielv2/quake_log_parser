class QuakeLogParser::Container
  extend Dry::Container::Mixin

  register('repositories.game') do
    Infra::Repositories::GameRepository.new
  end

  register('repositories.player') do
    Infra::Repositories::PlayerRepository.new
  end

  register('repositories.game.player') do
    Infra::Repositories::GamePlayerRepository.new
  end

  register('repositories.deathcause') do
    Infra::Repositories::DeathCauseRepository.new
  end

  register('repositories.deathcause.game') do
    Infra::Repositories::DeathCauseGameRepository.new
  end

  register('services.player') do
    Services::PlayerService.new
  end

  register('services.quakelog') do
    Services::QuakeLogService.new
  end
end

AutoInject = Dry::AutoInject(QuakeLogParser::Container)
