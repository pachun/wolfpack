FactoryBot.define do
  factory :game do
    RINKS = [ "A", "B", "C", "D" ]

    scheduled_at { 1.day.from_now }
    sequence(:home_team) { |n| "factory_generated_home_team_#{n}" }
    sequence(:away_team) { |n| "factory_generated_away_team_#{n}" }
    sequence(:rink) { |n| RINKS[n % RINKS.length] }
  end
end
