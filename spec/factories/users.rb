FactoryGirl.define do
  password = Forgery(:basic).password
  factory :user do
    email                     Forgery('email').address
    password                  password
    password_confirmation     password
    confirmed_at              Time.zone.now
  end
end