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
    name Reading.names.sample
    value rand(1..100)
    timestamp Time.now.to_i
    driver
  end
end