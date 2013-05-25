source 'https://rubygems.org'

gem 'rails', '3.2.11'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
gem 'unicorn', '>= 4.3.1', :group => :production
gem 'mongoid', '>= 3.1.2'
gem 'slim-rails', '~> 1.1.1'
gem 'devise', '>= 2.2.3'
gem 'figaro', '>= 0.6.3'
gem 'twitter-bootstrap-rails', '~> 2.2.6'

group :development, :test do
  gem 'thin', '>= 1.5.0'
  gem 'rspec-rails', '>= 2.12.2'
  gem 'factory_girl_rails', '>= 4.2.0'
  gem 'debugger'

  gem 'spring', github: "jonleighton/spring"
  gem 'listen'
  gem 'rb-inotify', :require => false  # linux
  gem 'rb-fsevent', :require => false  # mac os x
  gem 'rb-kqueue',  :require => false  # bsd
end

group :development do
  gem 'guard-bundler', '>= 1.0.0'
  gem 'guard-rails', '>= 0.4.0'
  gem 'guard-rspec', '>= 2.5.2'
  gem 'quiet_assets', '>= 1.0.2'
  gem 'better_errors', '>= 0.7.2'
  gem 'binding_of_caller', '>= 0.7.1', :platforms => [:mri_19, :rbx]
end

group :test do
  gem 'database_cleaner', '>= 1.0.0.RC1'
  gem 'mongoid-rspec', '>= 1.7.0'
  gem 'email_spec', '>= 1.4.0'
  gem 'launchy', '>= 2.2.0'
  gem 'capybara', '~> 2.1.0'
  gem 'poltergeist', '~> 1.3.0'
  gem 'capybara-screenshot'
end
