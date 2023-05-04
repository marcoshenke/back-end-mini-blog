FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Quote.yoda }
    description { Faker::Lorem.characters(number: 15) }

    before(:create) do |post|
      post.user ||= create(:user)
      post.category ||= create(:category)
    end

    trait :with_comments do
      after(:create) do |post|
        2.times do
          post.comments << create(:comment, user: post.user)
        end
      end
    end
  end
end
