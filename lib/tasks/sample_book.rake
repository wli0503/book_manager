require 'faker'

namespace :db do
  desc "Fill books table with books"
  task :populate_books => :environment do
    20.times do
      Book.create(
        :name => Faker::Lorem.word,
        :year => Faker::Number.number(4),
        :author_id => Author.offset(rand(Author.count)).first.id,
        :subgenre_id => Subgenre.offset(rand(Subgenre.count)).first.id,
        :publisher_id => Publisher.offset(rand(Publisher.count)).first.id,
        :price => Faker::Commerce.price,
        :genre_id => Genre.offset(rand(Genre.count)).first.id
      )
    end
  end
end