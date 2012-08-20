require File.expand_path('../lib/enum_plus/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'enum_plus'
  s.version     = EnumPlus::VERSION
  s.authors     = ['caedes']
  s.email       = ['laurentromain@gmail.com']
  s.homepage    = 'https://github.com/caedes/enum_plus'
  s.summary     = 'Add enumeration to your ruby classes'
  s.description = s.summary

  s.files        = `git ls-files`.split("\n")

  s.require_path = 'lib'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'turn', '~> 0.9.3'
  s.add_development_dependency 'shoulda', '~> 3.1.1'
end
