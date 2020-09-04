FactoryBot.define do
  factory :profile do
    age_id        {Faker::Number.between(from: 2, to: 5)}
    profession_id {Faker::Number.between(from: 2, to: 16)}
    
    after(:build) do |profile|
      profile.user_id = create(:user).id
    end
  end
end
