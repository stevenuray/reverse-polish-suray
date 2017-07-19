# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reverse/polish/suray/version'

Gem::Specification.new do |spec|
  spec.name          = "reverse-polish-suray"
  spec.version       = Reverse::Polish::Suray::VERSION
  spec.authors       = ["stevenuray"]
  spec.email         = ["steven.uray@gmail.com"]

  spec.summary       = %q{Reverse Polish Calculator.}
  spec.description   = %q{Reverse Polish Calculator for Steven Uray's application to On-Site.}
  spec.homepage      = "https://github.com/stevenuray/reverse-polish-suray"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 11.3.0"
  spec.add_development_dependency "rspec", "~> 3.5.0"
end
