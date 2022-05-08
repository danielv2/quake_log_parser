FactoryBot.define do
  factory :player, class: Domain::Entities::Player do
    name { Faker::Name.name }
  end
end
