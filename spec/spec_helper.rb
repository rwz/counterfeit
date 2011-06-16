$LOAD_PATH << '.' unless $LOAD_PATH.include?('.')

begin
  require 'rubygems'
  require 'bundler'

  if Gem::Version.new(Bundler::VERSION) <= Gem::Version.new('0.9.5')
    raise RuntimeError, 'Your bundler version is too old.' +
     'Run `gem install bundler` to upgrade.'
  end

  # Set up load paths for all bundled gems
  Bundler.setup
rescue Bundler::GemNotFound
  raise RuntimeError, 'Bundler couldn\'t find some gems.' +
    'Did you run `bundlee install`?'
end

require 'rails/all'

Bundler.require
require File.expand_path('../../lib/counterfeit', __FILE__)

db_filename = 'counterfeit.sqlite3'

File.delete(db_filename)

active_record_configuration = { :adapter => 'sqlite3', :database => db_filename }

ActiveRecord::Base.establish_connection(active_record_configuration)
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))

ActiveRecord::Base.silence do
  ActiveRecord::Migration.verbose = false

  load(File.dirname(__FILE__) + '/schema.rb')
  load(File.dirname(__FILE__) + '/models.rb')
end

def clean_database!
  ActiveRecord::Base.connection.execute "DELETE FROM #{Item.table_name}"
end