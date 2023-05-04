FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Quote.yoda }
    description { Faker::Lorem.characters(number: 15) }
    category
    user

    trait :with_comments do
      after(:create) do |post|
        2.times do
          post.comments << create(:comment)
        end
      end
    end
  end
end
