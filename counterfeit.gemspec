# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'counterfeit/version'

Gem::Specification.new do |s|
  s.name        = 'counterfeit'
  s.version     = Counterfeit::VERSION
  s.authors     = ['Pavel Pravosud']
  s.email       = ['rwz@duckroll.ru']
  s.homepage    = ''
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = 'counterfeit'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.add_dependency 'rails',           '~> 3.0'
  s.add_dependency 'money',           '~> 3.7.1'
  s.add_dependency 'google_currency', '~> 1.2.0'
  
  s.add_development_dependency 'sqlite3', '~> 1.3.3'
  s.add_development_dependency 'rspec',   '~> 2.6.0'
end