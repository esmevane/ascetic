# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ascetic/version'

Gem::Specification.new do |gem|
  gem.name          = "ascetic"
  gem.version       = Ascetic::VERSION
  gem.authors       = ["Joseph McCormick"]
  gem.email         = ["esmevane@gmail.com"]
  gem.description   = %q{Basic configuration loader}
  gem.summary       = %q{Load .yml and .json files into a basic interface}
  gem.homepage      = "http://www.github.com/esmevane/ascetic"

  gem.files         = `git ls-files`.split($/)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency "minitest", "~> 4.3"
  gem.add_development_dependency "pry", "~> 0.9"
  gem.add_development_dependency "simplecov", "~> 0.8"
end