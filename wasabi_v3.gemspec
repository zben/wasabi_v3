# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "wasabi_v3/version"

Gem::Specification.new do |s|
  s.name        = "wasabi_v3"
  s.version     = WasabiV3::VERSION
  s.authors     = ["Daniel Harrington"]
  s.email       = ["me@rubiii.com"]
  s.homepage    = "https://github.com/savonrb/#{s.name}"
  s.summary     = "A simple WSDL parser"
  s.description = s.summary

  s.rubyforge_project = s.name
  s.license = 'MIT'

  s.add_dependency "nokogiri", ">= 1.4.2"

  s.add_development_dependency "rake",  "~> 0.9"
  s.add_development_dependency "rspec", "~> 2.14"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
