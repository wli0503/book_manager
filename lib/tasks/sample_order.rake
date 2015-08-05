require 'faker'

namespace :db do
  desc "Populate orders with orders"
  task :populate_orders => :environment do
    10.times do
       Order.create(
        :total_price => Faker::Commerce.price,
        :customer_name => Faker::Name.name
       )
    end  
  end
end