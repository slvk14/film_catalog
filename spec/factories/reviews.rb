# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    rate { Faker::Number.number(digits: 1) }
    description { Faker::Quote.famous_last_words }
  end
end
