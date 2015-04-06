FactoryGirl.define do
  factory :user do
    username "Ryan"
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password "hellowworld"
    password_confirmation "hellowworld"
    confirmed_at Time.now
  end

  factory :test_user do
    username "Oggie"
    email "oggie@test.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end