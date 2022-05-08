FactoryBot.define do
  factory :games_player, class: Domain::Entities::GamesPlayer do
    player
    game
    kills { Faker::Number.between(from: 0, to: 100) }
  end
end
