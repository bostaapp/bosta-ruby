# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name = 'bosta'
  s.version = '0.0.1'
  s.authors = ['Ahmad Elkhateeb']
  s.email = 'ahmed.khateeb@bosta.co'
  s.date = '2020-11-01'
  s.licenses = ['MIT']
  s.homepage = 'https://github.com/bostaapp/bosta-ruby'
  s.summary = 'A Ruby client SDK for Bosta APIs integration.'
  s.description = 'This gem simplifies the integration process with Bosta.
  create, update and track your shimpents easily'
  s.required_ruby_version = '>= 2.4'
  s.files = Dir[
    'README.md',
    'LICENSE',
    'CONTRIBUTING.md',
    'CODE_OF_CONDUCT.md',
    'lib/**/*.rb',
    'bosta.gemspec'
  ]
  s.extra_rdoc_files = ['README.md']
  s.test_files = Dir.glob('test/*_test.rb')
  s.add_runtime_dependency 'faraday', '~> 1.1.0'
  s.add_development_dependency 'rubocop', '~> 0.60'
  s.add_development_dependency 'rubocop-performance', '~> 1.5'
  s.add_development_dependency 'rubocop-rspec', '~> 1.37'
end
