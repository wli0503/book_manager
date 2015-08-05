require 'faker'

namespace :db do
  desc "Populate readers with readers"
  task :populate_readers => :environment do
    10.times do
       Reader.create(
        :name => Faker::Name.name
       )
    end  
  end
end