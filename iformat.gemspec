# -*- encoding: utf-8 -*-
require File.expand_path('../lib/iformat/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Karol Sarnacki']
  gem.email         = ['sodercober@gmail.com']
  gem.description   = %q{A Ruby wrapper for the iFormat API.}
  gem.summary       = %q{iFormat API wrapper}
  gem.homepage      = 'https://github.com/sodercober/iformat'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'iformat'
  gem.require_paths = ['lib']
  gem.version       = IFormat::VERSION

  gem.add_runtime_dependency 'savon', ['~> 0.9']

  gem.add_development_dependency 'minitest', ['>= 2.0.0']
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'turn'
end
