source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? ENV['PUPPET_VERSION'] : '>=3.7.3'

group :rspec, :kitchen do
  gem 'librarian-puppet'
  gem 'puppet', puppetversion
  gem 'rspec_junit_formatter'
  gem 'puppet-blacksmith'
end

group :rspec do
  gem 'puppetlabs_spec_helper', '>= 0.1.0'
  gem 'puppet-lint'
  gem 'facter', '>= 1.7.0'
  gem 'rspec-puppet'
  gem 'puppet-syntax'
  gem 'metadata-json-lint'
  gem 'webmock'
end

group :kitchen do
  gem 'test-kitchen'
  gem 'kitchen-docker'
  gem 'kitchen-puppet', '0.0.31'
  gem 'kitchen-vagrant'
  gem 'kitchen-transport-sshtar'
  gem 'vagrant-wrapper'
end
