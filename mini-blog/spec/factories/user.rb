FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    username { Faker::Superhero.name }
    encrypted_password { Faker::Lorem.characters(number: 8) }
    sequence(:email) { |n| "person#{n}@example.com" }
    admin { Faker::Boolean.boolean }
  end
end
