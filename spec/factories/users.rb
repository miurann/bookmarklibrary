FactoryBot.define do
  factory :user do
    name { "Jane" }
    sequence(:email) { |n| "example_mail#{n}@example.com" }
    password { "abcdefghijk" }
    password_confirmation { "abcdefghijk" }
  end
end
