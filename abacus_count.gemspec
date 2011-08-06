# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "abacus_count/version"

Gem::Specification.new do |s|
  s.name        = "abacus_count"
  s.version     = AbacusCount::VERSION
  s.authors     = ["Dmitriy Kiriyenko"]
  s.email       = ["dmitriy.kiriyenko@gmail.com"]
  s.homepage    = "https://github.com/dmitriy-kiriyenko/abacus_count"
  s.summary     = %q{ActiveRecord::Base#count and other calculations as subqueries}
  s.description = %q{ActiveRecord::Base#count and other calculations as subqueries. Instead of nice Rails grouping calculation feature,
                     uses subqueries to return the result with any complex query}

  s.rubyforge_project = "abacus_count"

  s.add_dependency "activerecord", ">= 3.0.0"
  s.add_development_dependency "rspec", ">= 2.0.0"
  s.add_development_dependency "sqlite3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
