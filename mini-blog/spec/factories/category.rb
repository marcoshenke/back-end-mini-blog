FactoryBot.define do
  factory :category, class: Category do
    name { Faker::ProgrammingLanguage.name }
  end

  trait :with_posts do
    after(:create) do |category|
      2.times do
        category.posts << create(:post, category_id: category.id)
      end
    end
  end
end
