require 'faker'

# 5.times do |_i|
#   Category.create(name: Faker::Lorem.sentence(word_count: 3))
# end

KindUser.find_or_create_by(kind: 'Journalist')
KindUser.find_or_create_by(kind: 'Admin')
