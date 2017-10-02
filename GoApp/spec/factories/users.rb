FactoryGirl.define do
  factory :user do
    username { |n| Faker::Internet.user_name }
    password { |p| Faker::Internet.password }
  end
end
