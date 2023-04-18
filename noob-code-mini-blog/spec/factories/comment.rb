FactoryBot.define do
  factory :comment, class: Comment do
    comment { Faker::Quote.yoda }

    before(:create) do |comment|
      comment.post ||= create(:post)
    end
  end
end
