module Domain
  module Entities
    class GamesPlayer < Infra::Models::ApplicationRecord
      attribute :kills, :integer, default: 0

      belongs_to :game
      belongs_to :player

      def add_kill
        self.kills += 1
      end

      def remove_kill
        self.kills -= 1
      end
    end
  end
end
