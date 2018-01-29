# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.4.2"

source "https://rails-assets.org" do
  gem "rails-assets-tether", ">= 1.3.3"
end

gem "clearance"
gem "autoprefixer-rails"
gem "bootstrap"
gem "coffee-rails", "~> 4.2"
gem "faraday"
gem "faraday_middleware"
gem "font-awesome-sass"
gem "haml-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "kaminari"
gem "pg"
gem "puma", "~> 3.0"
gem "rails", "~> 5.1.0"
gem "rails-i18n"
gem "routing-filter"
gem "sass-rails", "~> 5.0"
gem "sentry-raven"
gem "skylight"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :production do
  gem "rack-timeout"
end

group :development, :test do
  gem "awesome_print"
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "pry-rails"
  gem "rspec-rails"
end

group :test do
  gem "coveralls", require: false
  gem "webmock"
end

group :development do
  gem "bullet"
  gem "listen", "~> 3.1"
end
