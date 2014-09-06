namespace :db do
  namespace :populate do
    require 'faker'

    models = {
      managers: 2,
      drivers: 20,
      readings: 500
    }

    desc "Clear and populate every table"
    task all: :environment do
      models.keys.each do |model|
        Rake::Task["db:populate:#{model}"].execute
      end
    end

    desc "Clear and populate the managers table"
    task managers: :environment do
      Manager.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!("managers")
      managers = []

      count = 0;
      models[:managers].times do
        managers.push({  
          full_name: Faker::Name.name,
          email: "m#{count}@test.com",
          password: 'wat',
          password_confirmation: 'wat'
        })
        count += 1
      end

      Manager.create!([managers])
      puts "Populated managers table"
    end

    desc "Clear and populate the drivers table"
    task drivers: :environment do
      Driver.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!("drivers")
      drivers = []

      count = 0;
      models[:drivers].times do
        drivers.push({  
          name: Faker::Name.name,
          manager_id: rand(1..Manager.count)
        })
        count += 1
      end

      Driver.create!([drivers])
      puts "Populated drivers table"
    end

    desc "Clear and populate the readings table"
    task readings: :environment do
      Reading.destroy_all
      ActiveRecord::Base.connection.reset_pk_sequence!("readings")
      readings = []

      count = 0;
      models[:readings].times do
        readings.push({  
          name: Reading.values.sample,
          value: Faker::Number.number(2),
          timestamp: Time.at(rand * Time.now.to_i),
          driver_id: rand(1..Driver.count)
        })
        count += 1
      end

      Reading.create!([readings])
      puts "Populated readings table"
    end
  end
end