FactoryBot.define do
  factory :posts_tag do
    category_id {Faker::Number.between(from: 2, to: 5)}
    comment     { Faker::Lorem.sentence }
    name        { Faker::Games::Pokemon.name }
    after(:build) do |post|
      post.user_id = create(:user).id
    end
  end
end
