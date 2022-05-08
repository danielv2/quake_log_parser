module Domain
  module Entities
    class Game < Infra::Models::ApplicationRecord
      attribute :name, :string

      has_many :games_players
      has_many :players, through: :games_players

      has_many :death_causes_games
      has_many :death_causes, through: :death_causes_games

      def increment_total_kills
        self.total_kills += 1
      end
    end
  end
end
