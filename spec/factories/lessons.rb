# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lesson do
    course_module_id 1
    position 1
    name "MyString"
    content "MyText"
  end
end
