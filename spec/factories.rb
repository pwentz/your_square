FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    password { 'password' }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
