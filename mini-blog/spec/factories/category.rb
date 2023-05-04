FactoryBot.define do
  factory :category, class: Category do
    name { Faker::ProgrammingLanguage.name }
  end
end
