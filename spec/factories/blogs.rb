require 'faker'
  
FactoryGirl.define do
  factory :blog do
    title { Faker::Name.title }
  end
  factory :invalid_blog do
    title nil
  end
end
