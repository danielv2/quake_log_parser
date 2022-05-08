module Domain
  module Entities
    class DeathCause < Infra::Models::ApplicationRecord
      attribute :name, :string

      has_many :death_causes_games
      has_many :games, through: :death_causes_games
    end
  end
end
