module Counterfeit
  module Schema
    def money(name)
      column "#{name.to_s}_in_cents", :integer, :default => 0, :null => false
      column "#{name.to_s}_currency", :string,  :limit => 3,   :null => false
    end
  end
end