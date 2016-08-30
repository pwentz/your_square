FactoryGirl.define do
  factory :user do
    name { Faker::Internet.user_name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
