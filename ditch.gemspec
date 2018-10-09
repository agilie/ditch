# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ditch/version'

Gem::Specification.new do |spec|
  spec.name          = 'ditch'
  spec.version       = Ditch::VERSION
  spec.authors       = ["Michael Thorsager"]
  spec.email         = ["thorsager@gmail.com"]

  spec.summary       = %q{Extends the Creek gem, for ease of use}
  spec.description   = %q{This adds some functions onto the Creek gem, that makes it a bit easier to work with spreadsheets}
  spec.homepage      = 'https://github.com/thorsager/ditch'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.2'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency 'creek', '~> 2.0', '>= 1.1.1'
end
