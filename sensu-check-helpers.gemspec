lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sensu-check-helpers/version'

Gem::Specification.new do |spec|
  spec.name          = 'sensu-check-helpers'
  spec.version       = SensuCheckHelpers::VERSION
  spec.authors       = ['Ben Snape']
  spec.email         = ['ben.snape@itv.com']
  spec.summary       = %q{Shared code used across custom Sensu checks}
  spec.homepage      = 'http://www.bensnape.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
