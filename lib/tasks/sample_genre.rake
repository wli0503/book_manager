require 'faker'

namespace :db do
  desc "Fill genres table with random genres"
  task :populate_genres => :environment do
    30.times do
      Genre.create(
        :name => Faker::Name.last_name,
        :desc => Faker::Lorem.sentence,
      )
      end
    end
  end