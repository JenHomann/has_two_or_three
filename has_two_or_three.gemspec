# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'has_two_or_three/version'

Gem::Specification.new do |spec|
  spec.name          = 'has_two_or_three'
  spec.version       = HasTwoOrThree::VERSION
  spec.authors       = ['Jen Homann']
  spec.email         = ['mpjeno@gmail.com']

  spec.summary       = %q{For those pesky times when has_many just isn't specific enough.}
  spec.homepage      = 'https://github.com/JenHomann/has_two_or_three'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'pry'

  spec.add_dependency 'activerecord', '>= 4.2.1'
  spec.add_dependency 'activesupport', '>= 4.2.1'
end
