Gem::Specification.new do |s|
  s.name        = 'attr_sanitizable'
  s.version     = '0.0.3'
  s.date        = '2014-10-28'
  s.summary     = 'Active Record extention to sanitize your inputs.'
  s.description = 'Active Record extention to sanitize your inputs.'
  s.authors     = ['Aaron Price']
  s.email       = 'price.aaron@gmail.com'
  s.files       = ['lib/attr_sanitizable.rb']
  s.homepage    = 'https://github.com/aaronprice/attr_sanitizable'
  s.license     = 'MIT'

  s.add_dependency('activerecord', '>= 3.1')
  s.add_dependency('activesupport', '>= 3.1')

  s.add_development_dependency('sqlite3', '~> 1.3')
  s.add_development_dependency('rspec', '~> 2.0')
  s.add_development_dependency('rake', '~> 0.9', '>= 0.9')
end