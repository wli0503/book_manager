require 'faker'

namespace :db do
  desc "Fill reviews table with random reviews"
  task :populate_reviews => :environment do
    10.times do
      Review.create(
        :reader_id => Reader.offset(rand(Reader.count)).first.id,
        :book_id => Book.offset(rand(Book.count)).first.id,
        :rating => Random.rand(1..6)
      )
      end
    end
  end