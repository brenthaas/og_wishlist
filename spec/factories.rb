FactoryGirl.define do
  sequence :email do |num|
    "email#{num}@example.com"
  end

  factory :user do
    name "Testington"
    email  { FactoryGirl.generate :email }
    password "password"
    password_confirmation "password"
    factory :user_with_wishes do
      transient do
        wish_count 2
      end
      after(:create) do |user, evaluator|
        create_list(:wish, evaluator.wish_count, user: user)
      end
    end
  end

  factory :wish do
    user
    title "My two front teeth"
    summary "This is a description"
    url "http://google.com"
    image "http://google.com/image.jpg"
  end
end
