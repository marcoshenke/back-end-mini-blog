FactoryBot.define do
  factory :user, class: User do
    name { Faker::Name.name }
    username { Faker::Internet.user[:username] }
    password { '12345678' }
    password_confirmation { '12345678' }
    email { Faker::Internet.email }
    admin { false }

    trait :is_admin do
      admin { true }
    end
  end
end
