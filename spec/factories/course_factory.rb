FactoryBot.define do
  factory :course do
    name { Faker::Movie.title }
    description { Faker::Movie.quote }
    author
  end
end
