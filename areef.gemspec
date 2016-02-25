# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'areef/version'

Gem::Specification.new do |spec|
  spec.name          = "areef"
  spec.version       = Areef::VERSION
  spec.authors       = ["Oduola Akeem"]
  spec.email         = ["akeem.oduola@andela.com"]

  spec.summary       = "An MVC framework"
  spec.description   = "An MVC framework based on Rack"
  spec.homepage      = "https://github.com/andela-aoduola/areef"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.
                       split("\x0").
                       reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-test", "~> 0.6"
  # spec.add_development_dependency "pry"
  spec.add_development_dependency "coveralls"

  spec.add_runtime_dependency "rack", "~> 1.0"
  spec.add_runtime_dependency "pry"

end
