FactoryGirl.define do
  factory :answer do
    sentence        'hogehoghohgoehgoehogehogheoge'
    user_id         { Faker::Number.number(1) }
    question_id     { Faker::Number.number(1) }
  end
end
