module Infra
	module Repositories
		class GamePlayerRepository < Domain::Interfaces::Repositories::IPlayerRepository
			def initialize(model = {})
				@game_player = model.fetch(:game_player) { Domain::Entities::GamesPlayer } if model.blank?
			end

			def save(game_player)
				game_player.save
				game_player
			end

			def add_player(game, player)
				game.players << player
			end

			def find_by_game_player(game_id, player_id)
				@game_player.find_by(game_id: game_id, player_id: player_id)
			end
		end
	end
end
