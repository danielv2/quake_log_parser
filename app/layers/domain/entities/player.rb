module Domain
  module Entities
    class Player < Infra::Models::ApplicationRecord
      attribute :name, :string

      has_many :games_players
      has_many :games, through: :games_players
    end
  end
end
  