WITHOUT_ACTIVE_RECORD = ENV.fetch("WITHOUT", "") =~ /\bactiverecord\b/
WITHOUT_MONGOID = ENV.fetch("WITHOUT", "") =~ /\bmongoid\b/

if WITHOUT_ACTIVE_RECORD
  Object.send(:remove_const, "ActiveRecord")
end

require 'pp'
warn "... What is WITHOUT_ACTIVE_RECORD?, #{WITHOUT_ACTIVE_RECORD.inspect}"
warn "... What is WITHOUT_MONGOID?, #{WITHOUT_MONGOID.inspect}"
