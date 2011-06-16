ActiveRecord::Schema.define :version => 0 do
  create_table "items", :force => true do |t|
    t.money :price
    t.money :balance
    t.money :another_money_attr
    t.integer :custom_money_amount
    t.string :custom_money_currency
  end
end
