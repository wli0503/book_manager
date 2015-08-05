FactoryGirl.define do
  factory :price_history do
    book
    old_price 10.00
    new_price 20.00
  end
end