FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person #{n}" }
    password "foobarer"

    factory :admin do
      admin true
    end
  end

  factory :post do
    content "here is a sample post for the content"
    user
  end
end