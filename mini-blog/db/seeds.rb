require 'faker'

# 5.times do |_i|
#   Category.create(name: Faker::Lorem.sentence(word_count: 3))
# end

KindUser.find_or_create_by(kind: 'Journalist')
KindUser.find_or_create_by(kind: 'Admin')

Post.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, category_id: 1,
            user_id: 1)
Post.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, category_id: 2,
            user_id: 2)
Post.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, category_id: 3,
            user_id: 1)
Post.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, category_id: 4,
            user_id: 2)
Post.create(title: Faker::Lorem.sentence(word_count: 3), description: Faker::Lorem.paragraph, category_id: 5,
            user_id: 1)

Comment.create(comment: Faker::Lorem.paragraph, post_id: 1, user_id: 2)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 2, user_id: 1)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 3, user_id: 2)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 4, user_id: 1)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 5, user_id: 2)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 1, user_id: 1)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 2, user_id: 2)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 3, user_id: 1)
Comment.create(comment: Faker::Lorem.paragraph, post_id: 4, user_id: 2)
Comment.find_or_create_by(comment: Faker::Lorem.paragraph, post_id: 5, user_id: 1)
