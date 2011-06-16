Counterfeit
===========

This gem helps you count somebody's money in your Rails application.
It is basically a nice rails-wrapper for Money gem.

Installation
------------
Gemfile:

    gem 'counterfeit'

Console:

    bundle install

Usage
-----

In your migrations:

    create_table(:products) do |t|
      t.integer :price_in_cents, :default => 0, :null => false
      t.string  :price_currency, :limit => 3,   :null => false
    end

or

    create_table(:products) do |t|
      t.money :price
    end

In your models:

    class Product < ActiveRecord::Base
      has_counterfeit :price
    end

You can specify default currency like this:

    has_counterfeit :price, :currency => 'EUR'

Now lets play a little:

    product = Product.new
    product.price
    # => #<Money cents:0 currency:USD>
    product.price = 500
    product.price
    # => #<Money cents:50000 currency:USD>
    product.price.exchange_to('EUR')
    # => #<Money cents:35491 currency:EUR>
    user = User.new
    user.balance = Money.new(100000, 'RUB')
    user.balance > product.price
    # => false
    # need moar moneez

You can get more info on the ```money``` gem page here: https://github.com/RubyMoney/money


License
-------
Counterfeit is released under the MIT license.