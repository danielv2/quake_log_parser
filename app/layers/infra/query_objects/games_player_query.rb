module Infra
  module QueryObjects
    class GamesPlayerQuery < Domain::Entities::GamesPlayer
      class << self
        alias_attribute :ranking_players, :all

        def ranking_players
          self
            .joins(:player)
            .select('players.name as name, sum(games_players.kills) as total_kills')
            .group(:player_id)
            .order('total_kills DESC')
        end
      end
    end
  end
end
