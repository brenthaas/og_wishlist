FactoryGirl.define do
  sequence :email do |num|
    "email#{num}@example.com"
  end

  factory :user do
    name "Testington"
    email  { FactoryGirl.generate :email }
    password "password"
    password_confirmation "password"
  end

  factory :wish do
    title "My two front teeth"
    summary "This is a description"
    url "http://google.com"
    image "http://google.com/image.jpg"
  end
end
