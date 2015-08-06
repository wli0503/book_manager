require 'faker'

namespace :db do
  desc "Fill subgenres table with random subgenres"
  task :populate_subgenres => :environment do
    50.times do
      Subgenre.create(
        :name => Faker::Lorem.word,
        :desc => Faker::Lorem.sentence,
        :genre_id => Genre.offset(rand(Genre.count)).first.id
      )
      end
    end
  end