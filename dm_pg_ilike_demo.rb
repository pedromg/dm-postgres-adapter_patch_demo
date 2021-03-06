require 'rubygems'
require 'dm-core'
require 'dm-postgres-adapter'
require 'adapter.rb'          # local; patched
require 'comparison.rb'       # local; patched
require 'symbol.rb'
#require 'dm-migrations'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, 'postgres://user:password@localhost/database')

class Item
  include DataMapper::Resource
  property :id, Serial
  property :kind, String
end

#DataMapper.auto_upgrade!
DataMapper.finalize

# To check for the Symbol class issue
#
# This works:
# $ irb -r dm_pg_ilike_demo.rb
# irb> Item.create(:kind => "Product")
# irb> Item.all(:kind.like => "product").count # returns 0
# irb> Item.all(:kind.ilike => "product").count # returns 1
#
# Now, comment line #6 and run a new IRB session
# Rerun the code above and ilike will return an error.
# Now, still in IRB require symbol.rb, and the code will work.
# Symbol class must be loaded after requiring adapter.rb and comparison.rb

