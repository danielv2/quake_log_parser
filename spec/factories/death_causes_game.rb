FactoryBot.define do
  factory :death_causes_game, class: Domain::Entities::DeathCausesGame do
    quantity { Faker::Number.positive }
    game
    death_cause
  end
end
