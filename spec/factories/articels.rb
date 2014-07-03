FactoryGirl.define do
  factory :article do
    sequence(:title){|n| "title#{n}" }
    category_id 2
    content '1111'
    created_at Time.now
  end
end