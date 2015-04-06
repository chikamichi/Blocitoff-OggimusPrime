FactoryGirl.define do
  factory :user do
    name "Ryan Haase"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "hellowworld"
    password_confirmation "hellowworld"
    confirmed_at Time.now
  end

  factory :test_user do
    name "Oggie"
    email "oggie@test.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end