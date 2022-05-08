FactoryBot.define do
  factory :game, class: Domain::Entities::Game do
    name { Faker::Game.title }
    total_kills { Faker::Number.positive }
  end
end
