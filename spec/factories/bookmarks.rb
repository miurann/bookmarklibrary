FactoryBot.define do
  factory :bookmark do
    sequence(:title) { |n| "Bookmark #{n}" }
    sequence(:url) { |n| "https://example#{n}" }
    memo { "test memo" }
    association :user
    association :cover_image
  end
end
