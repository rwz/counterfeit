module Counterfeit
  module ActiveRecord
    extend ActiveSupport::Concern
    
    module ClassMethods
      
      def has_counterfeit(attr, options={})
        options = options.with_indifferent_access
        
        default_currency = options.delete(:currency).try(:to_s).try(:upcase)
        
        amount_attr = options.delete(:amount_attribute) || "#{attr}_in_cents"
        currency_attr = options.delete(:currency_attribute) || "#{attr}_currency"
        
        mapping = [[ amount_attr, 'cents' ], [ currency_attr, 'currency_as_string' ]]
        
        after_initialize do
          self[currency_attr] ||= default_currency || Money.default_currency.iso_code
        end
        
        constructor = lambda { |cents, currency| Money.new(cents || 0, currency) }
        
        converter = lambda do |value|
          if value.respond_to?(:to_money)
            value.to_money(default_currency)
          else
            raise ArgumentError, "Can't convert #{value.class} to Money"
          end
        end
        
        composed_of attr.to_sym,
          :class_name => 'Money',
          :mapping => mapping,
          :constructor => constructor,
          :converter => converter
        
      end
      
      alias :has_money :has_counterfeit
    end
  end
end