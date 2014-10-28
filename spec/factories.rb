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

  factory :message do
    title { Faker::Lorem::word }
    message_type { Message::TYPES.first}
    message_text { Faker::Lorem::sentence }
    deliver_date { Date.today }
    deliver_time { Time.now }
  end
end