require File.expand_path('../lib/comprehensible/version', __FILE__)

gemspec = Gem::Specification.new do |s|
  s.name              = 'comprehensible'
  s.version           = Comprehensible::VERSION
  s.summary           = 'List comprehensions... ish'
  s.description       = 'Map and filter enumerables into lists of your design'
  s.files             = Dir.glob("{lib,spec}/**/*") + %w{README.md Rakefile}
  s.require_path      = 'lib'
  s.has_rdoc          = false
  s.rubyforge_project = ''
  s.homepage          = 'http://github.com/qbyt/comprehensible'
  s.authors           = ['Matt Smith']
  s.email             = "matt@thunk.io"
  s.license           = "MIT"
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
