# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'simple_form_recurring_select/version'

Gem::Specification.new do |spec|
  spec.name          = "simple_form_recurring_select"
  spec.version       = SimpleFormRecurringSelect::VERSION
  spec.authors       = ["Tomas Celizna"]
  spec.email         = ["tomas.celizna@gmail.com"]

  spec.summary       = %q{Wrapper around the 'recurring_select' gem for SimpleForm.}
  spec.homepage      = "https://github.com/tomasc/simple_form_recurring_select"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "ice_cube"
  spec.add_dependency "rails"
  spec.add_dependency "recurring_select"
  spec.add_dependency "simple_form"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-minitest"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake", "~> 10.0"
end
