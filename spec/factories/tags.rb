FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "Tag_#{n}" }
    association :user
  end
end
