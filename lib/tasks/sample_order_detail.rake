require 'faker'

namespace :db do
  desc "Populate order details with order details"
  task :populate_order_details => :environment do
    10.times do
      book_id = Book.offset(rand(Book.count)).first.id
       OrderDetail.create(
        :book_id => book_id,
        :order_id => Order.offset(rand(Order.count)).first.id,
        :quantity => Random.rand(1..11),
        :unit_price => Book.find(book_id).price,
       )
    end  
  end
end