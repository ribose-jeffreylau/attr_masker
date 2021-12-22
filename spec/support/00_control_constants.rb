WITHOUT_ACTIVE_RECORD = ENV.fetch("WITHOUT", "") =~ /\bactiverecord\b/
WITHOUT_MONGOID = ENV.fetch("WITHOUT", "") =~ /\bmongoid\b/

if WITHOUT_ACTIVE_RECORD
  Object.send(:remove_const, "ActiveRecord")
end

require 'pp'

puts "... What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
warn "... What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
pp WITHOUT_ACTIVE_RECORD

puts

puts "... What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
warn "... What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
pp WITHOUT_MONGOID
