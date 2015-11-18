FactoryGirl.define do
  factory :question do
    user
    title      "hoge"
    sentence   "hogehoge"
    time_limit "120"
  end
end
