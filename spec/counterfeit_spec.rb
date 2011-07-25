require 'spec_helper'

describe Item do
  it 'responds to price method' do
    Item.new.should respond_to(:price)
  end
  
  it 'responds to counterfeit method with Money object' do
    Item.new.price.should be_kind_of(Money)
  end
  
  it 'sets default currency' do
    Money.default_currency = Money::Currency.new('RUB')
    Item.new.price_currency.should == 'RUB'
  end
  
  it 'sets specified currency by default' do
    Item.new.balance_currency.should == 'THB'
  end
  
  it 'should handle custom attribute names' do
    Item.new(:money => 500).custom_money_amount.should == 500_00
  end
  
  it 'should respect default currency attribute' do
    Item.new.custom_money_currency.should == 'EUR'
  end
  
  it 'should work witn has_money alias' do
    Item.new.should respond_to(:another_money_attr)
  end
  
  it 'google saved the day' do
    Money.google_to_the_rescue.should be_true
    Money.google_to_the_rescue.should be_false
  end
  
  it 'should automatically turn on google exchange on fail' do
    Money.google_saved_the_day = false
    Money.default_bank = Money::Bank::VariableExchange.instance
    money = Money.new(500_00, 'USD')
    lambda do
      money.exchange_to('EUR')
    end.should_not raise_error
    
    Money.default_bank.should be_kind_of(Money::Bank::GoogleCurrency)
  end
  
  it 'should use the google hack only once' do
    Money.default_bank = Money::Bank::VariableExchange.instance
    money = Money.new(500_00, 'USD')
    money.bank.should be_kind_of(Money::Bank::VariableExchange)
    lambda do
      money.exchange_to('EUR')
    end.should raise_error(Money::Bank::UnknownRate)
  end
  
  it 'should allow currency change' do
    Money.default_currency = Money::Currency.new('USD')
    item = Item.create
    item.price_currency.should == 'USD'
    item.update_attributes(:price => '100', :price_currency => 'RUB')
    item.reload.price.should == Money.new(100_00, 'RUB')
    item.save
    item.reload.price_currency.should == 'RUB'
  end
end