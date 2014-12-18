require 'faker'

FactoryGirl.define do 
  factory :event do 
    referer_URL {Faker::Internet.url}
    created_on {Date.today}
    name {Faker::Lorem.word}
    property1 {Faker::Lorem.word}
    property2 {Faker::Lorem.word}
    user
  end 
end