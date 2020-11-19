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
  s.files = Dir.glob('lib/**/**')
  s.required_ruby_version = '>= 2.4'
  s.test_files = Dir.glob('test/*_test.rb')
  s.add_runtime_dependency 'faraday', ['= 1.1.0']
end
