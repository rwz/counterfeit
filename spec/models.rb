class Item < ActiveRecord::Base
  has_counterfeit :price
  has_counterfeit :balance, :currency => :thb
  has_money :another_money_attr
  has_counterfeit :money,   :currency => 'EUR',
                            :currency_attribute => :custom_money_currency,
                            :amount_attribute => :custom_money_amount
end