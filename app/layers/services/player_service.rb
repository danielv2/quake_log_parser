module Services
  class PlayerService < Domain::Interfaces::Services::IPlayerService
    include AutoInject[player_repository: 'repositories.player']

    def create(create_player_dto)
      player = Domain::Entities::Player.new(name: create_player_dto.name)
      player_repository.save(player)
    end

    def find_all
      player_repository.find_all
    end
  end
end
