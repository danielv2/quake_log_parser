module Infra
	module Repositories
		class DeathCauseGameRepository < Domain::Interfaces::Repositories::IDeathCauseGameRepository
			def initialize(model = {})
				@death_cause_game = model.fetch(:death_cause_game) { Domain::Entities::DeathCausesGame } if model.blank?
			end

			def save(death_cause_game)
				death_cause_game.save
				death_cause_game
			end

			def find_by_death_cause_game(game_id, death_cause_id)
				@death_cause_game.find_by(game_id: game_id, death_cause_id: death_cause_id)
			end
		end
	end
end
