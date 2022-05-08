module Infra
	module Repositories
		class PlayerRepository < Domain::Interfaces::Repositories::IPlayerRepository
			def initialize(model = {})
				@player = model.fetch(:player) { Domain::Entities::Player } if model.blank?
			end

			def save(player)
				player.save
				player
			end

			def find_by_id(id)
				@player.find_by(id: id)
			end

			def find_by_name(name)
				@player.find_by_name(name)
			end

			def find_all
				@player.all
			end
		end
	end
end
  
  