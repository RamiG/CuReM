FactoryGirl.define do
  factory :admin_user do
    email Faker::Internet::safe_email
    password 'pa$sword'
    password_confirmation 'pa$sword'
  end
end