
FactoryGirl.define do
  factory :role, :class => Refinery::Employees::Role do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

