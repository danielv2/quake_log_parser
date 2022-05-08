module Infra
	module Repositories
		class GameRepository < Domain::Interfaces::Repositories::IGameRepository
			def initialize(model = {})
				@game = model.fetch(:game) { Domain::Entities::Game } if model.blank?
			end

			def save(game)
				game.save
			end

			def find_by_id(id)
				@game.find_by(id: id)
			end

			def find_all
				@game.all
			end
		end
	end
end
  
  