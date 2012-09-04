source "http://rubygems.org"

gemspec

gem "jquery-rails"

gem 'responders'
gem "active_model_serializers", :git => "git://github.com/josevalim/active_model_serializers.git"

# Tyne
gem 'tyne_ui', :git => "https://github.com/tyne/tyne-ui.git", :branch => "master"

# Webserver
gem 'thin'

group :production do
 gem 'pg'
end

# Testing
group :test, :development do
  gem 'tyne_dev', :git => "https://github.com/tyne/tyne-dev.git", :branch => "master"
end
