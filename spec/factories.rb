FactoryGirl.define do
  factory :admin_user do
    email { Faker::Internet::safe_email }
    password 'pa$sword'
    password_confirmation 'pa$sword'
  end

  factory :client do
    first_name { Faker::Name::first_name }
    last_name { Faker::Name::last_name }
    birthdate { 20.years.ago }
    email { Faker::Internet::safe_email }
    phone { Faker::PhoneNumber.cell_phone }
    terms_accepted false
  end

  factory :delivery do
    title { Faker::Lorem::word }
    message_type { Delivery::TYPES.first}
    message_text { Faker::Lorem::sentence }
    delivery_rate { Delivery::RATES.sample }
    next_delivery_date { Date.today }
    next_delivery_time { Time.now }
  end
end