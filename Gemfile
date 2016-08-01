# frozen_string_literal: true
source "https://rubygems.org"

ruby "2.3.1"

gem "autoprefixer-rails"
gem "bourbon"
gem "coffee-rails", "~> 4.2"
gem "haml-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "neat"
gem "pg"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.0"
gem "sass-rails", "~> 5.0"
gem "sentry-raven"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "rack-timeout"
end

group :development, :test do
  gem "byebug", platform: :mri
  gem "rspec-rails"
end

group :test do
  gem "coveralls", require: false
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end
