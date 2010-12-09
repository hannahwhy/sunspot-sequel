# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunspot/sequel/version"

Gem::Specification.new do |s|
  s.name        = "sunspot-sequel"
  s.version     = Sunspot::Sequel::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["David Yip"]
  s.email       = ["yipdw@member.fsf.org"]
  s.homepage    = ""
  s.summary     = %q{Sunspot integration for Sequel}
  s.description = %Q{
  sunspot-sequel is a Sequel plugin similar to the ActiveRecord integration
  available in sunspot_rails.
  }.strip

  s.rubyforge_project = "sunspot-sequel"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency 'sequel'
  s.add_dependency 'sunspot'
end
