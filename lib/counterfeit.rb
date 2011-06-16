require 'money'
require 'money/bank/google_currency'
require 'counterfeit/version'
require 'counterfeit/schema'
require 'counterfeit/active_record'
require 'counterfeit/money'


ActiveRecord::Base.send :include, Counterfeit::ActiveRecord
ActiveRecord::ConnectionAdapters::Table.send :include, Counterfeit::Schema
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, Counterfeit::Schema