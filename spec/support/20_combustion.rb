# (c) 2017 Ribose Inc.
#

if defined?(::Combustion)
  Combustion.path = "spec/dummy"

  if WITHOUT_ACTIVE_RECORD
    Combustion.initialize!
  else
    Combustion.initialize! :active_record
  end
end
