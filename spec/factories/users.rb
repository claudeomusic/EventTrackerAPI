  FactoryGirl.define do
    factory :user do
      username "Douglas Adams"
      sequence(:email, 100) { |n| "person#{n}@example.com"}
      password 'helloworld'
      password_confirmation 'helloworld'

      after(:build) do |user|
        event=create(:event,user: user)
      end
    end
  end