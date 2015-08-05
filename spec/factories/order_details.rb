FactoryGirl.define do
  factory :order_detail do
    book
    order
    quantity 1
    unit_price 30.00
  end
end