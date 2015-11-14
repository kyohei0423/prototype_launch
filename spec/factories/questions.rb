FactoryGirl.define do
  factory :question do
    title      "hoge"
    sentence   "hogehoge"
    time_limit "120"
    user_id    { Faker::Number.number(1) }
  end
end
