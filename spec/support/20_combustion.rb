# (c) 2017 Ribose Inc.
#

Combustion.path = "spec/dummy"

require 'pp'

puts "support/combu: What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
pp WITHOUT_ACTIVE_RECORD

puts

puts "support/combu: What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
pp WITHOUT_MONGOID

if WITHOUT_ACTIVE_RECORD
  Combustion.initialize!
else
  Combustion.initialize! :active_record
end
