require 'faker'

FactoryGirl.define do
  factory :encounter do |f|
    f.visit_number 'VN0001'
    f.admitted_at { Faker::Date.backward(14) }
  end
end
