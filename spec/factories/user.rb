FactoryGirl.define do
  factory :user do
    name "Ryan Haase"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "hellowworld"
    password_confirmation "hellowworld"
    confirmed_at Time.now
  end
end