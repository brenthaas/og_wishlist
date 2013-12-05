FactoryGirl.define do
  factory :user do
    name "Testington"
    email  "Testing1234@test.com"
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
