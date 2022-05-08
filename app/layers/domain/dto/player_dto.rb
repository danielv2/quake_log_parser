module Domain
  module Dto
    class PlayerDto
      attr_accessor :name

      def initialize(name:)
        @name = name
      end
    end
  end
end
