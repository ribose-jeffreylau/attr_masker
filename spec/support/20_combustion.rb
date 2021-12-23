# (c) 2017 Ribose Inc.
#

Combustion.path = "spec/dummy"

require 'pp'
puts "support/combu: What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
puts "support/combu: What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"

if WITHOUT_ACTIVE_RECORD
  Combustion.initialize!
else
  Combustion.initialize! :active_record
end
