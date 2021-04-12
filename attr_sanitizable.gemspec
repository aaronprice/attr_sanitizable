# frozen_string_literal: true
require_relative 'lib/attr_sanitizable/version'

Gem::Specification.new do |spec|
  spec.name        = 'attr_sanitizable'
  spec.version     = AttrSanitizable::VERSION
  spec.date        = '2014-10-28'
  spec.summary     = 'Active Record extention to sanitize your inputspec.'
  spec.description = 'Active Record extention to sanitize your inputspec.'
  spec.authors     = ['Aaron Price']
  spec.email       = 'price.aaron@gmail.com'
  spec.homepage    = 'https://github.com/aaronprice/attr_sanitizable'
  spec.license     = 'MIT'

  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/aaronprice/attr_sanitizable'
  spec.metadata['changelog_uri'] = 'https://github.com/aaronprice/attr_sanitizable/blob/main/CHANGELOG.md'

  spec.files = Dir['{lib}/**/*', 'LICENSE', 'CHANGELOG.md', 'README.md']

  spec.add_dependency('activerecord', '>= 3.1')
  spec.add_dependency('activesupport', '>= 3.1')

  spec.add_development_dependency('sqlite3', '~> 1.3')
  spec.add_development_dependency('rspec-rails', '~> 3.3', '>= 3.3.3')
  spec.add_development_dependency('rake', '>= 0.9', '~> 12.3')
end