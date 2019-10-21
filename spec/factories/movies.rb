FactoryBot.define do
  factory :movie do
    title { Faker::Name }
    year { Faker::Number.number(digits: 4)}
    genre { Faker::Name }
    director { Faker::Name }
    actors { Faker::Name }
    plot { Faker::Lorem.sentence(word_count: 5) }
    country { Faker::Vehicle.make }
    metascore { Faker::Number.number(digits: 2) }
    imdb_rating { Faker::Number.decimal(l_digits: 1) }
  end
end