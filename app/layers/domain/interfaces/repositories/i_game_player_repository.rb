module Domain
  module Interfaces
    module Repositories
      class IGamePlayerRepository
        def save(game_player)
          raise "Not implemented yet"
        end

        def add_player(game, player)
          raise "Not implemented yet"
        end

        def find_by_game_player(game_id, player_id)
          raise "Not implemented yet"
        end
      end
    end
  end
end
