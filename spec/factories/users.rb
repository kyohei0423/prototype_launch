FactoryGirl.define do
  PASSWORD = Forgery(:basic).password(at_least: 8)
  EMAIL = Forgery('email').address
  factory :user do
    email                     EMAIL
    password                  PASSWORD
    password_confirmation     PASSWORD
    confirmed_at              Time.zone.now
  end
end