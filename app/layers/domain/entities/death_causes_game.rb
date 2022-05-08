module Domain
  module Entities
    class DeathCausesGame < Infra::Models::ApplicationRecord
      attribute :quantity, :integer, default: 0

      belongs_to :game
      belongs_to :death_cause

      def add_quantity
        self.quantity += 1
      end
    end
  end
end
