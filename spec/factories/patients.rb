require 'faker'

FactoryGirl.define do
  factory :patient do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.MRN "FakeMRN"
  end
end
