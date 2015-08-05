require 'faker'

namespace :db do
  desc "Fill publishers table with random publishers"
  task :populate_publishers => :environment do
    10.times do
      Publisher.create(
        :name => Faker::Company.name,
        :desc => Faker::Company.catch_phrase
      )
      end
    end
  end