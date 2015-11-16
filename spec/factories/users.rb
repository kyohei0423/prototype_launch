FactoryGirl.define do
  password = Forgery(:basic).password(at_least: 8)
  email = Faker::Internet.email
  factory :user do
    sequence(:email)          { |n| "hoge#{n}@gmail.com" }
    password                  password
    password_confirmation     password
    confirmed_at              Time.zone.now
  end
end