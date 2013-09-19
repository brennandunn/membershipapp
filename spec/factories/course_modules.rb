# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_module do
    name "MyString"
    description "MyText"
    unlocks_in 1
  end
end
