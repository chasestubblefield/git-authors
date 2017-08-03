# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'git-authors/version'

Gem::Specification.new do |gem|
  gem.name          = "git-authors"
  gem.version       = GitAuthors::VERSION
  gem.authors       = ["Chase Stubblefield"]
  gem.email         = ["chasestubblefield@gmail.com"]
  gem.description   = %q{Manage multiple authors with ease}
  gem.summary       = %q{Manage multiple authors with ease}
  gem.homepage      = "https://github.com/chasetopher/git-authors"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency('rspec')
  gem.add_development_dependency('rake')
end
