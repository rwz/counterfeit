# monkeypatching Money class to catch Money::Bank::UnknownRate error

class Money  
  mattr_accessor :google_saved_the_day
  
  self.google_saved_the_day = false
  
  def self.google_to_the_rescue
    !google_saved_the_day && self.google_saved_the_day = true
  end
  
  def exchange_to_with_google(*args)
    exchange_to_without_google(*args)
  rescue Money::Bank::UnknownRate => e
    
    if @bank == Money::Bank::VariableExchange.instance &&
        self.class.google_to_the_rescue
        
      Money.default_bank = @bank = Money::Bank::GoogleCurrency.new
      retry
    else
      raise e
    end
  end
  
  alias_method :exchange_to_without_google, :exchange_to
  alias_method :exchange_to, :exchange_to_with_google
end