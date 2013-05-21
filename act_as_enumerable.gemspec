require File.expand_path('../lib/act_as_enumerable/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'act_as_enumerable'
  s.version     = ActAsEnumerable::VERSION
  s.authors     = ['caedes']
  s.email       = ['laurentromain@gmail.com']
  s.homepage    = 'https://github.com/caedes/act_as_enumerable'
  s.summary     = 'Add enumeration to your ruby classes'
  s.description = s.summary

  s.files        = `git ls-files`.split("\n")

  s.require_path = 'lib'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'shoulda', '~> 3.1.1'
end
