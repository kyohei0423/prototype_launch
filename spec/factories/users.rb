FactoryGirl.define do
  password = Forgery(:basic).password(at_least: 8)
  email = Forgery('email').address
  factory :user do
    email                     email
    password                  password
    password_confirmation     password
    confirmed_at              Time.zone.now
  end
end