# monkeypatching Money class to catch Money::Bank::UnknownRate error

class Money
  alias_method :exchange_to_without_google, :exchange_to
  alias_method :exchange_to, :exchange_to_with_google
  
  attr_accessor :google_helped
  
  self.google_helped = false
  
  def self.google_to_the_rescue
    !google_helped && google_helped = true
  end
  
  def exchange_to_with_google(*args)
    exchange_to_without_google(*args)
  rescue Money::Bank::UnknownRate => e
    if self.class.google_to_the_rescue
      Money.default_bank = Money::Bank::GoogleCurrency.new
      retry
    else
      raise e
    end
  end
end