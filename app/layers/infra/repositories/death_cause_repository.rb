module Infra
	module Repositories
		class DeathCauseRepository < Domain::Interfaces::Repositories::IDeathCauseRepository
			def initialize(model = {})
				@death_cause = model.fetch(:death_cause) { Domain::Entities::DeathCause } if model.blank?
			end

			def create(death_causes)
				@death_cause.create(death_causes)
			end

			def find_by_name(name)
				@death_cause.find_by(name: name)
			end
		end
	end
end
  
  