# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'counterfeit/version'

Gem::Specification.new do |s|
  s.name        = 'counterfeit'
  s.version     = Counterfeit::VERSION
  s.authors     = ['Pavel Pravosud']
  s.email       = ['rwz@duckroll.ru']
  s.homepage    = 'https://github.com/rwz/counterfeit'
  s.summary     = %q{Easy Money gem integration for rails 3.}
  s.description = %q{Easy Money gem integration for rails 3.}

  s.rubyforge_project = 'counterfeit'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  
  s.add_dependency 'activesupport',   '~> 3.0'
  s.add_dependency 'money',           '~> 3.7.1'
  s.add_dependency 'google_currency', '~> 1.2.0'
  
  s.add_development_dependency 'sqlite3', '~> 1.3.3'
  s.add_development_dependency 'rspec',   '~> 2.6.0'
  s.add_development_dependency 'rake',    '~> 0.9.2'
  s.add_development_dependency 'rails',   '~> 3.0'
end
