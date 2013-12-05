FactoryGirl.define do
  factory :user do
    name "Testington"
    email  "Testing1234@test.com"
    password "password"
    password_confirmation "password"
  end
end
