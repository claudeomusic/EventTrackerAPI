  FactoryGirl.define do
    factory :user do
      sequence(:email, 1000) { |n| "person#{n}@example.com"}
      password 'helloworld'
      password_confirmation 'helloworld'

      after(:build) do |user|
        event=create(:event,user: user)
      end
    end
  end