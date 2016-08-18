
FactoryGirl.define do
  factory :student, :class => Refinery::Students::Student do
    sequence(:first_name) { |n| "refinery#{n}" }
  end
end

