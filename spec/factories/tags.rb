FactoryBot.define do
  factory :tag do
    sequence(:name) { |n| "Tag_#{n}" }
    association :owner
  end
end
