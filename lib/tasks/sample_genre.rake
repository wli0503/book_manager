require 'faker'

namespace :db do
  desc "Fill genres table with random genres"
  task :populate_genres => :environment do
    10.times do
      Genre.create(
        :name => Faker::Lorem.word,
        :desc => Faker::Lorem.sentence,
      )
      end
    end
  end