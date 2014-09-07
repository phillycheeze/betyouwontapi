require 'factory_girl'

FactoryGirl.define do
  factory :manager do
    sequence(:full_name) { |n| "m#{n}" }
    email { "#{full_name}@test.com" }
    password 'password'
    password_confirmation { password }
    authentication_token SecureRandom.hex
  end

  factory :driver do
    sequence(:name) { |n| "driver#{n}" }
    manager
  end

  factory :reading do
    speed 10
    rpm 1200
    odometer 30000
    longitude 12
    latitude 45
    timestamp Time.now.to_i
    driver
  end
end