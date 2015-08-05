require 'faker'

namespace :db do
  desc "Fill authors table with random authors"
  task :populate_authors => :environment do
    10.times do
      Author.create(
        :first_name => Faker::Name.first_name,
        :last_name => Faker::Name.last_name,
        :DOB => Faker::Number.number(10)
      )
      end
    end
  end