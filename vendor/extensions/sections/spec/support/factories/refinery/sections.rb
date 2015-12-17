
FactoryGirl.define do
  factory :section, :class => Refinery::Sections::Section do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

