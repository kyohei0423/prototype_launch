FactoryGirl.define do
  factory :answer do
    sentence        { Faker::ipster.paragraph }
    user_id         { Faker::Number.number }
    question_id     { Faker::Number.number }
  end
end
