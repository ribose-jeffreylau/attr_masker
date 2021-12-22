require "database_cleaner-core"

RSpec.configure do |config|
  config.before(:suite) do
    # TODO: puts
    require 'pp'

    puts "support: What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
    warn "support: What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
    pp WITHOUT_ACTIVE_RECORD

    puts

    puts "support: What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
    warn "support: What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
    pp WITHOUT_MONGOID

    unless WITHOUT_ACTIVE_RECORD
      warn "Gonna require database_cleaner-active_record"
      pp require "database_cleaner-active_record"
      DatabaseCleaner[:active_record].strategy = :truncation
      DatabaseCleaner[:active_record].start
    end

    # Since models are defined dynamically in specs, Database Cleaner is unable
    # to list them and to determine collection names to be cleaned.
    # Therefore, they are specified explicitly here.
    unless WITHOUT_MONGOID
      warn "Gonna require database_cleaner-mongoid"
      pp require "database_cleaner-mongoid"
      strategy = DatabaseCleaner::Mongoid::Deletion.new(only: %w[users])
      DatabaseCleaner[:mongoid].instance_variable_set :'@strategy', strategy
      DatabaseCleaner[:mongoid].start
    end
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
