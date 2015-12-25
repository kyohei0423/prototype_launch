FactoryGirl.define do
  factory :user do
    sequence(:email)          { |n| "hoge#{n}@gmail.com" }
    password                  '00000000'
    password_confirmation     '00000000'
    confirmed_at              Time.zone.now
  end
end