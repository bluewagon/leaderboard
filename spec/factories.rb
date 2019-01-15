FactoryGirl.define do
  factory :user do
    email "test@example.com"
    password "foobar123"
    password_confirmation "foobar123"
  end

  factory :ranking do
    name "Test Ranking"
    description "This is a test ranking"
  end
end