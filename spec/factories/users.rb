FactoryGirl.define do
  factory :user do
    sequence(:name){|n| "name#{n}" }
    # name 'name'
    password 'password'
    password_confirmation 'password'
    created_at Time.now
  end
end