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
    item = Item.new(:money => 500)
    item.custom_money_amount.should == 500_00
    item.custom_money_currency.should == 'EUR'
  end
  
  it 'should work witn has_money alias' do
    Item.new.should respond_to(:another_money_attr)
  end
end