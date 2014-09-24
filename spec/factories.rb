FactoryGirl.define do
  factory :author do
    name "Paul"
  end
end

FactoryGirl.define do
  factory :post do
    subject "Testing"
  end
end

FactoryGirl.define do
  factory :comment do
    body "This is my comment."
  end
end
