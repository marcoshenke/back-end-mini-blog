FactoryBot.define do
  factory :comment, class: Comment do
    comment { Faker::Quote.yoda }

    before(:create) do |comment|
      comment.post ||= create(:post)
      comment.user ||= create(:user)
    end
  end
end
